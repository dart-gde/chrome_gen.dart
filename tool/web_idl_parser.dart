// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library web_idl_parser;

import 'package:parsers/parsers.dart';

class EMPTY {
  // EPSILON
  const EMPTY();
}

final Parser spaces = (space.many > success(EMPTY)) % 'spaces';

final reservedNames = [ "readonly",
                        // ArgumentNameKeyword
                        "attribute",
                        "callback",
                        "const",
                        "creator",
                        "deleter",
                        "dictionary",
                        "enum",
                        "exception",
                        "getter",
                        "implements",
                        "inherit",
                        "interface",
                        "legacycaller",
                        "partial",
                        "setter",
                        "static",
                        "stringifier",
                        "typedef",
                        "unrestricted",
                        // Other
                        "-",
                        ".",
                        "...",
                        ":",
                        ";",
                        "<",
                        ">",
                        "?",
                        "Date",
                        "DOMString",
                        "Infinity",
                        "NaN",
                        "any",
                        "any?",
                        "boolean",
                        "byte",
                        "double",
                        "false",
                        "float",
                        "long",
                        "null",
                        "object",
                        "octet",
                        "or",
                        "optional",
                        "sequence",
                        "short",
                        "true",
                        "unsigned",
                        "void",
                        // Custom google reserved word
                        "namespace"];

// http://www.w3.org/TR/WebIDL/#idl-grammar
class WebIdlParser extends LanguageParsers {
  WebIdlParser() : super(reservedNames: reservedNames);

  get start =>  whiteSpace > (stmts() < eof);

  stmts() => stmt();

  stmt() => namespace() | rec(definitions);

  // Custom Google WebIDL grammar
  namespace() => (rec(extendedAttributeList)
                + reserved["namespace"]
                + namespaceIdentifier()
                + braces(rec(definitions))
                + semi).list;

  // Custom Google WebIDL grammar
  namespaceIdentifier() => identifier.sepBy(dot) | identifier;

  definitions() => (rec(extendedAttributeList)
                    + rec(definition)
                    + rec(definitions)).list
                    | spaces;

  definition() => rec(callbackOrInterface)
                  | rec(partial)
                  | rec(dictionary)
                  | rec(exception)
                  | rec(enumStmt)
                  | rec(typedefStmt)
                  | rec(implementsStatement);

  callbackOrInterface() => (reserved["callback"]
                           + rec(callbackRestOrInterface)).list
                           | rec(interfaceStmt);

  callbackRestOrInterface() => rec(callbackRest) | rec(interfaceStmt);

  interfaceStmt() => (reserved["interface"]
                      + identifier
                      + inheritance()
                      + braces(rec(interfaceMembers))
                      + semi).list;

  partial() => (reserved["partial"] + rec(partialDefinition)).list;

  partialDefinition() => rec(partialInterface) | rec(partialDictionary);

  partialInterface() => (reserved["interface"]
                        + identifier
                        + braces(rec(interfaceMembers))
                        + semi).list;

  interfaceMembers() => (rec(extendedAttributeList)
                        + rec(interfaceMember)
                        + rec(interfaceMembers)).list
                        | spaces;

  interfaceMember() => rec(constStmt) | rec(attributeOrOperation);

  dictionary() => (reserved["dictionary"]
                  + identifier
                  + inheritance()
                  + braces(rec(dictionaryMembers))
                  + semi).list;

  dictionaryMembers() => (rec(extendedAttributeList)
                          + rec(dictionaryMember)
                          + rec(dictionaryMembers)).list
                          | spaces;

  dictionaryMember() => (rec(type) + identifier + rec(defaultStmt) + semi).list
                        // Non standard WebIDL in Chrome IDL operations as
                        // dictionary members
                        | rec(operation);

  partialDictionary() => (reserved["dictionary"]
                         + identifier
                         + braces(rec(dictionaryMembers))
                         + semi).list;

  defaultStmt() => (symbol("=") + rec(defaultValue)).list
                    | spaces;

  defaultValue() => rec(constValue) | stringLiteral;

  exception() => (reserved["exception"]
                + identifier
                + inheritance()
                + braces(rec(exceptionMembers))
                + semi).list;

  exceptionMembers() => (rec(extendedAttributeList)
                        + rec(exceptionMember)
                        + rec(exceptionMembers)).list
                        | spaces;

  inheritance() => (reserved[":"] + identifier).list | spaces;

  // chrome idl does not follow the WebIDL spec, enums should be string literal.
  enumStmt() => (reserved["enum"]
                + identifier
                + braces(rec(enumValueList))
                + semi).list
                | (reserved["enum"]
                + identifier
                + braces(rec(enumIdentifierList))
                + semi).list;

  enumValueList() => (stringLiteral + rec(enumValues)).list;

  enumValues() => (symbol(",") + stringLiteral + rec(enumValues)).list | spaces;

  // chrome idl does not follow the WebIDL spec, enums should be string literal.
  enumIdentifierList() => (identifier + rec(enumIdentifiers)).list;

  enumIdentifiers() => (symbol(",") + identifier + rec(enumIdentifiers)).list | spaces;

  callbackRest() => (identifier
                    + symbol('=')
                    + rec(returnType)
                    + parens(rec(argumentList))
                    + semi).list;

  typedefStmt() => (reserved["typedef"]
                    + rec(extendedAttributeList)
                    + rec(type)
                    + identifier
                    + semi).list;

  implementsStatement() => (identifier
                            + reserved["implements"]
                            + identifier
                            + semi).list;

  constStmt() => (reserved["const"]
                  + rec(constType)
                  + identifier
                  + symbol("=")
                  + rec(constValue)
                  + semi).list;

  constValue() => booleanLiteral()
                | floatLiteralWebIdl()
                | intLiteral
                | stringLiteral
                | reserved["null"];

  booleanLiteral() => reserved["true"]
                    | reserved["false"];

  floatLiteralWebIdl() => floatLiteral
                        | (symbol("-") + reserved["Infinity"]).list
                        | reserved["Infinity"]
                        | reserved["NaN"];


  attributeOrOperation() => (reserved["stringifier"]
                            + rec(stringifierAttributeOrOperation)).list
                            | rec(attribute)
                            | rec(operation);

  stringifierAttributeOrOperation() =>  rec(attribute)
                                      | rec(operationRest)
                                      | semi;

  attribute() => (inherit()
                  + readOnly()
                  + reserved["attribute"]
                  + rec(type)
                  + identifier
                  + semi).list
                  | (qualifiers()
                  + readOnly()
                  + reserved["attribute"]
                  + rec(type)
                  + identifier
                  + semi).list;

  inherit() => reserved["inherit"] | spaces;

  readOnly() => reserved["readonly"] | spaces;

  operation() => (rec(qualifiers) + rec(operationRest)).list;

  qualifiers() => reserved["static"] | rec(specials);

  specials() => (special() + rec(specials)).list | spaces;

  special() => reserved["getter"]
             | reserved["setter"]
             | reserved["creator"]
             | reserved["deleter"]
             | reserved["legacycaller"];

  operationRest() => (rec(returnType)
                      + optionalIdentifier()
                      + parens(rec(argumentList))
                      + semi).list;

  optionalIdentifier() => identifier | spaces;

  argumentList() => (rec(argument) + rec(arguments)).list | spaces;

  arguments() => (symbol(",")
                  + rec(argument)
                  + rec(arguments)).list
                  | spaces;

  argument() => (rec(extendedAttributeList) + rec(optionalOrRequiredArgument)).list;

  optionalOrRequiredArgument() => (reserved["optional"] + rec(type)
                                  + argumentName() + rec(defaultStmt)).list
                                  | (rec(type) + ellipsis() + argumentName()).list;

  argumentName() => argumentNameKeyword() | identifier;

  ellipsis() => reserved["..."] | spaces;

  exceptionMember() => rec(constStmt) | rec(exceptionField);

  exceptionField() => (rec(type) + identifier + semi).list;

  extendedAttributeList() => brackets((rec(extendedAttribute)
                              + rec(extendedAttributes)).list)
                              | spaces;

  extendedAttributes() => (symbol(",")
                          + rec(extendedAttribute)
                          + rec(extendedAttributes)).list
                          | spaces;

  extendedAttribute() =>
      (parens(rec(extendedAttributeInner)) + rec(extendedAttributeRest)).list
      | (brackets(rec(extendedAttributeInner)) + rec(extendedAttributeRest)).list
      | (braces(rec(extendedAttributeInner)) + rec(extendedAttributeRest)).list
      | (other() + rec(extendedAttributeRest)).list;

  extendedAttributeRest() => rec(extendedAttribute) | spaces;

  extendedAttributeInner() =>
      (parens(rec(extendedAttributeInner)) + rec(extendedAttributeInner)).list
      | (brackets(rec(extendedAttributeInner)) + rec(extendedAttributeInner)).list
      | (braces(rec(extendedAttributeInner)) + rec(extendedAttributeInner)).list
      | (otherOrComma() + rec(extendedAttributeInner)).list
      | spaces;

  other() => intLiteral
            | floatLiteral
            | identifier
            | stringLiteral
            // | other TODO: this refers to some other regex
            | reserved["-"]
            | reserved["."]
            | reserved["..."]
            | reserved[":"]
            | reserved[";"]
            | reserved["<"]
            // '=' is specified in the spec as `other` but we parse it as
            // symbol for better results
            | symbol('=')
            | reserved[">"]
            | reserved["?"]
            | reserved["Date"]
            | reserved["DOMString"]
            | reserved["Infinity"]
            | reserved["NaN"]
            | reserved["any"]
            | reserved["boolean"]
            | reserved["byte"]
            | reserved["double"]
            | reserved["false"]
            | reserved["float"]
            | reserved["long"]
            | reserved["null"]
            | reserved["object"]
            | reserved["octet"]
            | reserved["or"]
            | reserved["optional"]
            | reserved["sequence"]
            | reserved["short"]
            | reserved["true"]
            | reserved["unsigned"]
            | reserved["void"]
            | argumentNameKeyword();

  argumentNameKeyword() =>  reserved["attribute"]
                          | reserved["callback"]
                          | reserved["const"]
                          | reserved["creator"]
                          | reserved["deleter"]
                          | reserved["dictionary"]
                          | reserved["enum"]
                          | reserved["exception"]
                          | reserved["getter"]
                          | reserved["implements"]
                          | reserved["inherit"]
                          | reserved["interface"]
                          | reserved["legacycaller"]
                          | reserved["partial"]
                          | reserved["setter"]
                          | reserved["static"]
                          | reserved["stringifier"]
                          | reserved["typedef"]
                          | reserved["unrestricted"];

  otherOrComma() => other() | symbol(",");

  type() => rec(singleType) | (rec(unionType) + rec(typeSuffix)).list;

  // Patch around non-standard "any?" support
  singleType() =>   rec(nonAnyType)
                    | reserved["any?"]
                    | (reserved["any"] + rec(typeSuffixStartingWithArray)).list;


  unionType() => parens((rec(unionMemberType)
                          + reserved["or"]
                          + rec(unionMemberType)
                          + rec(unionMemberTypes)).list);

  unionMemberType() => nonAnyType()
                      | (rec(unionType) + rec(typeSuffix)).list
                      | (reserved["any"]
                      + symbol("[")
                      + symbol("]")
                      + rec(typeSuffix)).list;

  unionMemberTypes() => (reserved["or"]
                        + rec(unionMemberType)
                        + rec(unionMemberTypes)).list
                        | spaces;

  nonAnyType() => (rec(primitiveType) + rec(typeSuffix)).list
                | (reserved["DOMString"] + rec(typeSuffix)).list
                | (identifier + rec(typeSuffix)).list
                | (reserved["sequence"]
                + symbol("<")
                + rec(type)
                + symbol(">")
                + rec(nullStmt)).list
                | (reserved["object"] + rec(typeSuffix)).list
                | (reserved["Date"] + rec(typeSuffix)).list;

  constType() => (rec(primitiveType) + rec(nullStmt)).list
               | (identifier + rec(nullStmt)).list;

  primitiveType() =>  rec(unsignedIntegerType)
                    | rec(unrestrictedFloatType)
                    | reserved["boolean"]
                    | reserved["byte"]
                    | reserved["octet"]
                    | reserved["DOMString"];

  unrestrictedFloatType() => (reserved["unrestricted"] + rec(floatType)).list
      | rec(floatType);

  floatType() => reserved["float"] | reserved["double"];

  unsignedIntegerType() =>  (reserved["unsigned"] + rec(integerType)).list
                          | rec(integerType);

  integerType() =>  reserved["short"]
                  | (reserved["long"] + rec(optionalLong)).list;

  optionalLong() => reserved["long"] | spaces;

  typeSuffix() => (symbol("[") + symbol("]") + rec(typeSuffix)).list
                  | (reserved["?"] + rec(typeSuffixStartingWithArray)).list
                  | spaces;

  typeSuffixStartingWithArray() => (symbol("[")
                                    + symbol("]")
                                    + rec(typeSuffix)).list
                                    | spaces;

  nullStmt() => reserved["?"] | spaces;

  returnType() =>  rec(type)
                 | reserved["void"];

  extendedAttributeNoArgs() => identifier;

  extendedAttributeArgList() => (identifier + symbol('=')
                                + parens(rec(argumentList))).list;

  extendedAttributeIdent() => (identifier + symbol('=') + identifier).list;

  extendedAttributeNamedArgList() => (identifier
                                    + symbol('=')
                                    + identifier
                                    + parens(rec(argumentList))).list;
}
