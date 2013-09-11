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

  definition() =>
        partialStmt();
//      | dictionaryStmt()
//      | exceptionStmt()
//      | enumStmt()
//      | typedefStmt()
//      | implementsStmt();

  partialStmt() => (reserved['partial'] + partialDefinition()).list;
  partialDefinition() =>
        partialInterface();
//      | partialDictionary();
  partialInterface() => (reserved['interface']
                        + identifier
                        + braces(rec(stmts))).list;


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