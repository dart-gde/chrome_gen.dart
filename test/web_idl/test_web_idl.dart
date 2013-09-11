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
  constValue() => null;
  booleanLiteral() => null;
  floatLiteralWebIdl() => null;
  attributeOrOperation() => null;
  stringifierAttributeOrOperation() => null;
  attribute() => null;
  inherit() => null;
  readOnly() => null;
  operation() => null;
  qualifiers() => null;
  specials() => null;
  special() => null;
  operationRest() => null;
  optionalIdentifier() => null;
  argumentList() => null;
  arguments() => null;
  argument() => null;
  optionalOrRequiredArgument() => null;
  argumentName() => null;
  ellipsis() => null;
  exceptionMember() => null;
  exceptionField() => null;
  extendedAttributeList() => null;
  extendedAttributes() => null;
  extendedAttribute() => null;
  extendedAttributeRest() => null;
  extendedAttributeInner() => null;
  other() => null;
  argumentNameKeyword() => null;
  otherOrComma() => null;
  type() => null;
  singleType() => null;
  unionType() => null;
  unionMemberType() => null;
  unionMemberTypes() => null;
  nonAnyType() => null;
  constType() => null;
  primitiveType() => null;
  unrestrictedFloatType() => null;
  floatType() => null;
  unsignedIntegerType() => null;
  integerType() => null;
  optionalLong() => null;
  typeSuffix() => null;
  typeSuffixStartingWithArray() => null;
  nullStmt() => null;
//  returnType() => type() | identifier;
//  extendedAttributeNoArgs() => identifier;
//  extendedAttributeArgList() => (identifier + parens(argumentList)).list;
  returnType() => null;
  extendedAttributeNoArgs() => null;
  extendedAttributeArgList() => null;
  extendedAttributeIdent() => null;
  extendedAttributeNamedArgList() => null;

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