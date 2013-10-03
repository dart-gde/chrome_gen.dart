
library web_idl_parser;

import 'dart:math';

import 'package:parsers/parsers.dart';
import 'web_idl_model.dart';
export 'web_idl_model.dart' show EMPTY;

final Parser spaces = (space.many > success(EMPTY)) % 'spaces';

_consStr(c) => (String cs) => "$c$cs";

class ReservedNames {
  Map<String, Parser<String>> _map;
  ReservedNames._(this._map);
  Parser<String> operator[](String key) {
    final res = _map[key];
    if (res == null) throw "$key is not a reserved name";
    else return res;
  }
}

/// Programming language specific combinators
class BaseWebIdlParser {
  String _commentStart;
  String _commentEnd;
  String _commentLine;
  bool _nestedComments;
  Parser<String> _identStart;
  Parser<String> _identLetter;
  Set<String> _reservedNames;
  bool _caseSensitive;

  ReservedNames _reserved;

  BaseWebIdlParser({
    String         commentStart   : '/*',
    String         commentEnd     : '*/',
    String         commentLine    : '//',
    bool           nestedComments : false,
    Parser<String> identStart     : null, // letter | char('_')
    Parser<String> identLetter    : null, // alphanum | char('_')
    List<String>   reservedNames  : const []
  }) {
    final identStartDefault = letter | char('_');
    final identLetterDefault = alphanum | char('_');

    _commentStart = commentStart;
    _commentEnd = commentEnd;
    _commentLine = commentLine;
    _nestedComments = nestedComments;
    _identStart = (identStart == null) ? identStartDefault : identStart;
    _identLetter = (identLetter == null) ? identLetterDefault : identLetter;
    _reservedNames = new Set<String>.from(reservedNames);
  }

  Parser<String> get semi  => symbol(';') % 'semicolon';
  Parser<String> get comma => symbol(',') % 'comma';
  Parser<String> get colon => symbol(':') % 'colon';
  Parser<String> get dot   => symbol('.') % 'dot';

  Parser<String> get _ident =>
      success((c) => (cs) => _consStr(c)(cs.join()))
      * _identStart
      * _identLetter.many;

  Parser<String> get identifier =>
      lexeme(_ident >> (name) =>
             _reservedNames.contains(name) ? fail : success(name))
      % 'identifier';

  ReservedNames get reserved {
    if (_reserved == null) {
      final map = new Map<String, Parser<String>>();
      for (final name in _reservedNames) {
        map[name] = lexeme(string(name).notFollowedBy(_identLetter));
      }
      _reserved = new ReservedNames._(map);
    }
    return _reserved;
  }

  final Parser<String> _escapeCode =
      (char('a')  > success('\a'))
    | (char('b')  > success('\b'))
    | (char('f')  > success('\f'))
    | (char('n')  > success('\n'))
    | (char('r')  > success('\r'))
    | (char('t')  > success('\t'))
    | (char('v')  > success('\v'))
    | (char('\\') > success('\\'))
    | (char('"')  > success('"'))
    | (char("'")  > success("'"));

  Parser<String> get _charChar => (char('\\') > _escapeCode)
                                | pred((c) => c != "'");

  Parser<String> get charLiteral =>
      lexeme(_charChar.between(char("'"), char("'")))
      % 'character literal';

  Parser<String> get _stringChar => (char('\\') > _escapeCode)
                                  | pred((c) => c != '"');

  Parser<String> get stringLiteral =>
      lexeme(_stringChar.many.between(char('"'), char('"')))
      .map((cs) => cs.join())
      % 'string literal';

  Map<String, int> _digitToInt = {
    '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8,
    '9': 9, 'a': 10, 'b': 11, 'c': 12, 'd': 13, 'e': 14, 'f': 15, 'A': 10,
    'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
  };

  Parser<int> _number(int base, Parser baseDigit) => baseDigit.many1 >> (ds) {
    int res = 0;
    for (final d in ds) { res = base * res + _digitToInt[d]; }
    return success(res);
  };

  Parser<int> get _zeroNumber =>
      char('0') > (hexaDecimal | octal | decimal | success(0));

  Parser<int> get _nat => _zeroNumber | decimal;

  Parser<int> get _int => lexeme(_sign) * _nat;

  Parser<Function> get _sign => (char('-') > success((n) => -n))
                              | (char('+') > success((n) => n))
                              | success((n) => n);

  Parser<int> get natural => lexeme(_nat) % 'natural number';

  Parser<int> get intLiteral => lexeme(_int) % 'integer';

  num _power(num e) => e < 0 ? 1.0 / _power(-e) : pow(10, e);

  Parser<double> get _exponent =>
      oneOf('eE') > success((f) => (e) => _power(f(e))) * _sign * decimal;

  Parser<double> get _fraction => char('.') > digit.many1 >> (ds) {
    double res = 0.0;
    for (int i = ds.length - 1; i >= 0; i--) {
      res = (res + _digitToInt[ds[i]]) / 10.0;
    }
    return success(res);
  };

  Parser<double> _fractExponent(int n) =>
      (success((fract) => (expo) => (n + fract) * expo)
          * _fraction
          * _exponent.orElse(1.0))
      | _exponent.map((expo) => n * expo);

  Parser<double> get floatLiteral =>
      lexeme(decimal >> _fractExponent) % 'float';

  Parser<int> get decimal => _number(10, digit) % 'decimal number';

  Parser<int> get hexaDecimal =>
      (oneOf("xX") > _number(16, oneOf("0123456789abcdefABCDEF")))
      % 'hexadecimal number';

  Parser<int> get octal =>
      (oneOf("oO") > _number(8, oneOf("01234567")))
      % 'octal number';

  Parser<String> symbol(String symb) => lexeme(string(symb));

  Parser lexeme(Parser p) => p < spaces;

  Parser get _start => string(_commentStart);
  Parser get _end => string(_commentEnd);
  Parser get _notStartNorEnd => (_start | _end).notAhead > anyChar;

  Parser _multiLineComment() => _start > _inComment();

  Parser _inComment() =>
      _nestedComments ? _inCommentMulti() : _inCommentSingle();

  Parser _inCommentMulti() => _notStartNorEnd.skipMany > _recOrEnd();

  Parser _recOrEnd() => (rec(_multiLineComment) > rec(_inCommentMulti))
                      | (_end > success(null));

  Parser _inCommentSingle() => anyChar.skipManyUntil(_end);

  StringBuffer commendLineBuffer = new StringBuffer();
  _recordOneCommentLine(c) {
    commendLineBuffer.write(c);
    return c != '\n';
  }
  Parser get _oneLineComment =>
      string(_commentLine) > (pred(_recordOneCommentLine).skipMany > success(null));

  Parser get whiteSpace => _whiteSpace % 'whitespace/comment';

  Parser get _whiteSpace {
    if (_commentLine.isEmpty && _commentStart.isEmpty) {
      return space.skipMany;
    } else if (_commentLine.isEmpty) {
      return (space | _multiLineComment()).skipMany;
    } else if (_commentStart.isEmpty) {
      return (space | _oneLineComment).skipMany;
    } else {
      return (space | _oneLineComment | _multiLineComment()).skipMany;
    }
  }

  Parser parens(Parser p) => p.between(symbol('('), symbol(')'));

  Parser braces(Parser p) => p.between(symbol('{'), symbol('}'));

  Parser angles(Parser p) => p.between(symbol('<'), symbol('>'));

  Parser brackets(Parser p) => p.between(symbol('['), symbol(']'));
}



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
class WebIdlParser extends BaseWebIdlParser {
  final IDLCollector collector;

  WebIdlParser() :
    collector = new IDLCollector(),
    super(reservedNames: reservedNames);

  WebIdlParser.withCollector(this.collector) :
    super(reservedNames: reservedNames);

  get start =>  whiteSpace > (stmts() < eof);

  stmts() => stmt();

  stmt() => (whiteSpace.maybe + namespace()).list | rec(definitions);

  // Custom Google WebIDL grammar
  namespace() => (rec(extendedAttributeList)
                + reserved["namespace"]
                + namespaceIdentifier()
                + braces(rec(definitions))
                + semi).list ^ (l) => collector.namespace(l, commendLineBuffer);

  // Custom Google WebIDL grammar
  namespaceIdentifier() => identifier.sepBy(dot) | identifier;

  definitions() => (whiteSpace.maybe + rec(extendedAttributeList)
                    + rec(definition)
                    + rec(definitions)).list
                    | spaces;

  definition() => (whiteSpace.maybe + rec(callbackOrInterface)).list
                  | (whiteSpace.maybe + rec(partial)).list
                  | (whiteSpace.maybe + rec(dictionary)).list
                  | (whiteSpace.maybe + rec(exception)).list
                  | (whiteSpace.maybe + rec(enumStmt)).list
                  | (whiteSpace.maybe + rec(typedefStmt)).list
                  | (whiteSpace.maybe + rec(implementsStatement)).list;

  callbackOrInterface() => (whiteSpace.maybe + reserved["callback"]
                           + rec(callbackRestOrInterface)).list
                           | rec(interfaceStmt);

  callbackRestOrInterface() => rec(callbackRest) | rec(interfaceStmt);

  interfaceStmt() => (reserved["interface"]
                      + identifier
                      + inheritance()
                      + braces(rec(interfaceMembers))
                      + semi).list ^ (l) => collector.interface(l);

  partial() => (reserved["partial"] + rec(partialDefinition)).list;

  partialDefinition() => rec(partialInterface) | rec(partialDictionary);

  partialInterface() => (whiteSpace.maybe + reserved["interface"]
                        + identifier
                        + braces(rec(interfaceMembers))
                        + semi).list;

  interfaceMembers() => (whiteSpace.maybe + rec(extendedAttributeList)
                        + rec(interfaceMember)
                        + rec(interfaceMembers)).list
                        | spaces;

  interfaceMember() => rec(constStmt)
                     | rec(attributeOrOperation)
                     ^ (l) => collector.interfaceMember(l, commendLineBuffer);

  dictionary() => (reserved["dictionary"]
                  + identifier
                  + inheritance()
                  + braces(rec(dictionaryMembers))
                  + semi).list ^ (l) => collector.dictionary(l);

  dictionaryMembers() => (whiteSpace.maybe + rec(extendedAttributeList)
                          + rec(dictionaryMember)
                          + rec(dictionaryMembers)).list
                          | spaces;

  dictionaryMember() => (rec(type) + identifier + rec(defaultStmt) + semi).list
                        // Wrapped in braces not to get caught by the next pipe.
                        ^ (l) { return collector.dictionaryMember(l, commendLineBuffer); }
                        // Non standard WebIDL in Chrome IDL operations as
                        // dictionary members
                        | rec(operation)
                        ^ (l) { return collector.dictionaryMethod(l, commendLineBuffer); };

  partialDictionary() => (whiteSpace.maybe + reserved["dictionary"]
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
                + semi).list
                ^ (l) => collector.enumStatement(l, commendLineBuffer);

  enumValueList() => (stringLiteral + rec(enumValues)).list;

  enumValues() => (symbol(",") + stringLiteral + rec(enumValues)).list | spaces;

  // chrome idl does not follow the WebIDL spec, enums should be string literal.
  enumIdentifierList() => (whiteSpace.maybe + identifier + whiteSpace.maybe +  rec(enumIdentifiers)).list;

  enumIdentifiers() => (whiteSpace.maybe + symbol(",") + whiteSpace.maybe + identifier + rec(enumIdentifiers)).list | spaces;

  callbackRest() => (identifier
                    + symbol('=')
                    + rec(returnType)
                    + parens(rec(argumentList))
                    + semi).list ^ (l) => collector.callback(l, commendLineBuffer);

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
