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

  definitions() => null;
  definition() => null;
  callbackOrInterface() => null;
  callbackRestOrInterface() => null;
  interfaceStmt() => null;
  partial() => null;
  partialDefinition() => null;
  partialInterface() => null;
  interfaceMembers() => null;
  interfaceMember() => null;
  dictionary() => null;
  dictionaryMembers() => null;
  dictionaryMember() => null;
  partialDictionary() => null;
  defaultStmt() => null;
  defaultValue() => null;
  exception() => null;
  exceptionMembers() => null;
  inheritance() => null;
  enumStmt() => null;
  enumValueList() => null;
  enumValues() => null;
  callbackRest() => null;
  typedefStmt() => null;
  implementsStatement() => null;
  constStmt() => null;

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

  inherit() => null;
  readOnly() => null;

  operation() => (qualifiers() + operationRest()).list;

  qualifiers() => reserved["static"] | specials();

  specials() => null;

  special() => reserved["getter"]
             | reserved["setter"]
             | reserved["creator"]
             | reserved["deleter"]
             | reserved["legacycaller"];

  operationRest() => (returnType()
                      + optionalIdentifier()
                      + parens(argumentList())
                      + reserved[";"]).list;

  optionalIdentifier() => null;
  argumentList() => null;
  arguments() => null;

  argument() => (extendedAttributeList() + optionalOrRequiredArgument()).list;

  optionalOrRequiredArgument() => (reserved["optional"] + type()
                                  + argumentName() + defaultStmt()).list
                                  | (type() + ellipsis() + argumentName()).list;

  argumentName() => argumentNameKeyword() | identifier;

  ellipsis() => null;

  exceptionMember() => constStmt() | exceptionField();

  exceptionField() => (type() + identifier + semi).list;

  extendedAttributeList() => null;
  extendedAttributes() => null;
  extendedAttribute() => null;
  extendedAttributeRest() => null;
  extendedAttributeInner() => null;

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

  unionType() => null;
  unionMemberType() => null;
  unionMemberTypes() => null;

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

  optionalLong() => null;
  typeSuffix() => null;
  typeSuffixStartingWithArray() => null;
  nullStmt() => null;

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