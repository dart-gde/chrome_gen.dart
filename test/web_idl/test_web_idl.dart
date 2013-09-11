library test_web_idl;

import 'package:parsers/parsers.dart';

final reservedNames = [ "readonly",
                        // ArgumentNameKeyword
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
                        "=",
                        ">",
                        "?",
                        "Date",
                        "DOMString",
                        "Infinity",
                        "NaN",
                        "any",
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
                        "void" ];

// http://www.w3.org/TR/WebIDL/#idl-grammar
class WebIdlParser extends LanguageParsers {
  WebIdlParser() : super(reservedNames: reservedNames);

  get start => spaces > (stmts() < eof);
  stmts() => stmt().endBy(semi);
  stmt() => definition();
/*
  definition() =>
         callbackOrInterface()
        | partialStmt();
//      | dictionaryStmt()
//      | exceptionStmt()
//      | enumStmt()
//      | typedefStmt()
//      | implementsStmt();

  callbackOrInterface() => (reserved['callback'] +
      (callbackRestOrInterface() | interfaceStmt())).list;

  callbackRestOrInterface() => callbackRest() | interfaceStmt();
  callbackRest() => (identifier
      + symbol('=')
      + returnType()
      + parens(argumentList())).list;

  partialStmt() => (reserved['partial'] + partialDefinition()).list;
  partialDefinition() =>
        partialInterface();
//      | partialDictionary();
  partialInterface() => (reserved['interface']
                        + identifier
                        + braces(rec(stmts))).list;
*/

  definitions() => (extendedAttributeList()
                    + definition()
                    + definitions()).list
                    | spaces;

  definition() => callbackOrInterface()
                  | partial()
                  | dictionary()
                  | exception()
                  | enumStmt()
                  | typedefStmt()
                  | implementsStatement();

  callbackOrInterface() => (reserved["callback"]
                           + callbackRestOrInterface()).list
                           | interfaceStmt();

  callbackRestOrInterface() => callbackRest() | interfaceStmt();

  interfaceStmt() => (reserved["interface"]
                      + identifier
                      + inheritance()
                      + braces(interfaceMembers())
                      + semi).list;

  partial() => (reserved["partial"] + partialDefinition()).list;

  partialDefinition() => partialInterface() | partialDictionary();

  partialInterface() => (reserved["interface"]
                        + identifier
                        + braces(interfaceMembers())
                        + semi).list;

  interfaceMembers() => (extendedAttributeList()
                        + interfaceMember()
                        + interfaceMembers()).list
                        | spaces;

  interfaceMember() => constStmt() | attributeOrOperation();

  dictionary() => (reserved["dictionary"]
                  + identifier
                  + inheritance()
                  + braces(dictionaryMembers())
                  + semi).list;

  dictionaryMembers() => (extendedAttributeList()
                          + dictionaryMember()
                          + dictionaryMembers()).list
                          | spaces;

  dictionaryMember() => (type() + identifier + defaultStmt() + semi).list;

  partialDictionary() => (reserved["dictionary"]
                         + identifier
                         + braces(dictionaryMembers())
                         + semi).list;

  defaultStmt() => (symbol("=") + defaultValue()).list
                    | spaces;

  defaultValue() => constValue() | stringLiteral;

  exception() => (reserved["exception"]
                + identifier
                + inheritance()
                + braces(exceptionMembers())
                + semi).list;

  exceptionMembers() => (extendedAttributeList()
                        + exceptionMember()
                        + exceptionMembers()).list
                        | spaces;

  inheritance() => (reserved[":"] + identifier).list | spaces;

  enumStmt() => (reserved["enum"]
                + identifier
                + braces(enumValueList())
                + semi).list;

  enumValueList() => (stringLiteral + enumValues()).list;

  enumValues() => (reserved[","] + stringLiteral + enumValues()).list | spaces;

  callbackRest() => (identifier
                    + symbol('=')
                    + returnType()
                    + parens(argumentList())
                    + semi).list;

  typedefStmt() => (reserved["typedef"]
                    + extendedAttributeList()
                    + type()
                    + identifier
                    + semi).list;

  implementsStatement() => (identifier
                            + reserved["implements"]
                            + identifier
                            + semi).list;

  constStmt() => (reserved["const"]
                  + constType()
                  + identifier
                  + symbol("=")
                  + constValue()
                  + semi).list;

  constValue() => booleanLiteral()
                | floatLiteralWebIdl()
                | intLiteral
                | reserved["null"];

  booleanLiteral() => reserved["true"]
                    | reserved["false"];

  floatLiteralWebIdl() => floatLiteral
                        | (reserved["-"] + reserved["Infinity"]).list
                        | reserved["Infinity"]
                        | reserved["NaN"];


  attributeOrOperation() => (reserved["stringifier"]
                            + stringifierAttributeOrOperation()).list
                            | attribute()
                            | operation();

  stringifierAttributeOrOperation() => attribute() | operationRest() | semi;

  attribute() => (inherit()
                  + readOnly()
                  + reserved["attribute"]
                  + type()
                  + identifier
                  + reserved[";"]).list;

  inherit() => reserved["inherit"] | spaces;

  readOnly() => reserved["readonly"] | spaces;

  operation() => (qualifiers() + operationRest()).list;

  qualifiers() => reserved["static"] | specials();

  specials() => (special() + specials()).list | spaces;

  special() => reserved["getter"]
             | reserved["setter"]
             | reserved["creator"]
             | reserved["deleter"]
             | reserved["legacycaller"];

  operationRest() => (returnType()
                      + optionalIdentifier()
                      + parens(argumentList())
                      + reserved[";"]).list;

  optionalIdentifier() => identifier | spaces;

  argumentList() => (argument() + arguments()).list | spaces;

  arguments() => (reserved[","]
                  + argument()
                  + arguments()).list
                  | spaces;

  argument() => (extendedAttributeList() + optionalOrRequiredArgument()).list;

  optionalOrRequiredArgument() => (reserved["optional"] + type()
                                  + argumentName() + defaultStmt()).list
                                  | (type() + ellipsis() + argumentName()).list;

  argumentName() => argumentNameKeyword() | identifier;

  ellipsis() => reserved["..."] | spaces;

  exceptionMember() => constStmt() | exceptionField();

  exceptionField() => (type() + identifier + semi).list;

  extendedAttributeList() => brackets((extendedAttribute()
                              + extendedAttributes()).list)
                              | spaces;

  extendedAttributes() => (reserved[","]
                          + extendedAttribute()
                          + extendedAttributes()).list
                          | spaces;

  extendedAttribute() =>
      (parens(extendedAttributeInner()) + extendedAttributeRest()).list
      | (brackets(extendedAttributeInner()) + extendedAttributeRest()).list
      | (braces(extendedAttributeInner()) + extendedAttributeRest()).list
      | (other() + extendedAttributeRest()).list;

  extendedAttributeRest() => extendedAttribute() | spaces;

  extendedAttributeInner() =>
      (parens(extendedAttributeInner()) + extendedAttributeInner()).list
      | (brackets(extendedAttributeInner()) + extendedAttributeInner()).list
      | (braces(extendedAttributeInner()) + extendedAttributeInner()).list
      | (otherOrComma() + extendedAttributeInner()).list
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
            | reserved["="]
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

  otherOrComma() => other() | reserved[","];

  type() => singleType() | (unionType() + typeSuffix()).list;

  singleType() =>   nonAnyType()
                  | (reserved["any"] + typeSuffixStartingWithArray()).list;

  unionType() => parens((unionMemberType()
                          + reserved["or"]
                          + unionMemberType()
                          + unionMemberTypes()).list);

  unionMemberType() => nonAnyType()
                      | (unionType() + typeSuffix()).list
                      | (reserved["any"]
                      + symbol("[")
                      + symbol("]")
                      + typeSuffix()).list;

  unionMemberTypes() => (reserved["or"]
                        + unionMemberType()
                        + unionMemberTypes()).list
                        | spaces;

  nonAnyType() => (primitiveType() + typeSuffix()).list
                | (reserved["DOMString"] + typeSuffix()).list
                | (identifier + typeSuffix()).list
                | (reserved["sequence"] + reserved["<"] + type() + reserved[">"] + nullStmt()).list
                | (reserved["object"] + typeSuffix()).list
                | (reserved["Date"] + typeSuffix()).list;

  constType() => (primitiveType() + nullStmt()).list
               | (identifier + nullStmt()).list;

  primitiveType() =>  unsignedIntegerType()
                    | unrestrictedFloatType()
                    | reserved["boolean"]
                    | reserved["byte"]
                    | reserved["octet"];

  unrestrictedFloatType() => (reserved["unrestricted"] + floatType()).list
      | floatType();

  floatType() => reserved["float"] | reserved["double"];

  unsignedIntegerType() =>  (reserved["unsigned"] + integerType()).list
                          | integerType();

  integerType() =>  reserved["short"]
                  | (reserved["long"] + optionalLong()).list;

  optionalLong() => reserved["long"] | spaces;

  typeSuffix() => (symbol("[") + symbol("]") + typeSuffix()).list
                  | (reserved["?"] + typeSuffixStartingWithArray()).list
                  | spaces;

  typeSuffixStartingWithArray() => (reserved["["]
                                    + reserved["]"]
                                    + typeSuffix()).list
                                    | spaces;

  nullStmt() => reserved["?"] | spaces;

  returnType() =>  type()
                 | reserved["void"];

  extendedAttributeNoArgs() => identifier;

  extendedAttributeArgList() => (identifier + symbol('=')
                                + parens(argumentList())).list;

  extendedAttributeIdent() => (identifier + symbol('=') + identifier).list;

  extendedAttributeNamedArgList() => (identifier + symbol('=')
                                    + identifier + parens(argumentList())).list;

}

final test = """
partial interface testInterface1 {
};
""";

main() {
  WebIdlParser miniLang = new WebIdlParser();
  var parsed = miniLang.start.parse(test);
  print(parsed);
}