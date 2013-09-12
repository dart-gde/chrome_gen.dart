library test_web_idl;

import 'package:unittest/unittest.dart';
import 'package:parsers/parsers.dart';

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

  stmts() => stmt();

  stmt() => rec(definitions);

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

  dictionaryMember() => (rec(type) + identifier + rec(defaultStmt) + semi).list;

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

  enumStmt() => (reserved["enum"]
                + identifier
                + braces(rec(enumValueList))
                + semi).list;

  enumValueList() => (stringLiteral + rec(enumValues)).list;

  enumValues() => (symbol(",") + stringLiteral + rec(enumValues)).list | spaces;

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
                | reserved["null"];

  booleanLiteral() => reserved["true"]
                    | reserved["false"];

  floatLiteralWebIdl() => floatLiteral
                        | (reserved["-"] + reserved["Infinity"]).list
                        | reserved["Infinity"]
                        | reserved["NaN"];


  attributeOrOperation() => (reserved["stringifier"]
                            + rec(stringifierAttributeOrOperation)).list
                            | rec(attribute)
                            | rec(operation);

  stringifierAttributeOrOperation() => rec(attribute) | rec(operationRest) | semi;

  attribute() => (inherit()
                  + readOnly()
                  + reserved["attribute"]
                  + rec(type)
                  + identifier
                  + reserved[";"]).list;

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
                      + reserved[";"]).list;

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

  otherOrComma() => other() | symbol(",");

  type() => rec(singleType) | (rec(unionType) + rec(typeSuffix)).list;

  singleType() =>   rec(nonAnyType)
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
                + reserved["<"]
                + rec(type)
                + reserved[">"]
                + rec(nullStmt)).list
                | (reserved["object"] + rec(typeSuffix)).list
                | (reserved["Date"] + rec(typeSuffix)).list;

  constType() => (rec(primitiveType) + rec(nullStmt)).list
               | (identifier + rec(nullStmt)).list;

  primitiveType() =>  rec(unsignedIntegerType)
                    | rec(unrestrictedFloatType)
                    | reserved["boolean"]
                    | reserved["byte"]
                    | reserved["octet"];

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

  extendedAttributeNamedArgList() => (identifier + symbol('=')
                                    + identifier + parens(rec(argumentList))).list;

}

void main() {
  group('web_idl.dart', () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('extendedAttributeNoArgs', () {
      var id = webIdlParser.extendedAttributeNoArgs().parse("id");
      expect(id, equals("id"));
    });

    test('extendedAttributeIdent', () {
      var id = webIdlParser.extendedAttributeIdent().parse("id = di");
      expect(id, equals(["id", "=", "di"]));
    });

//    test('extendedAttributeNamedArgList', () {
//      // Test failed: Caught Stack Overflow
//      var id = webIdlParser.extendedAttributeNamedArgList().parse("id = di(1,2,3)");
//      //expect(id, equals(["id", "=", "di"]));
//    });

    test('extendedAttributeInner', () {
      var p = webIdlParser.extendedAttributeInner();
      var sp = p.parse("(1, 2, 3)");
      expect(sp, equals([[1, [',', [2, [',', [3, null]]]]], null]));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttributeRest

    test('extendedAttributeRest empty', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("");
      expect(sp, equals(null));
    });

    test('extendedAttributeRest takes no arguments', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[Replaceable]");
      expect(sp, equals([['Replaceable', null], null]));
    });

    test('extendedAttributeRest takes an argument list', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[Constructor(float x, float y)]");
      expect(sp, equals([['Constructor', [['float', ['x', [',', ['float', ['y', null]]]]], null]], null]));
    });

    test('extendedAttributeRest takes a named argument list', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[NamedConstructor=Image(DOMString src)]");
      expect(sp, equals("THIS TEST IS FAILING"));
    });

    test('extendedAttributeRest takes an identifier', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[PutForwards=name]");
      expect(sp, equals("THIS TEST IS FAILING"));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttribute
    test('extendedAttribute empty', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("");
      expect(sp, equals(null));
    });

    test('extendedAttribute takes no arguments', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[Replaceable]");
      expect(sp, equals([['Replaceable', null], null]));
    });

    test('extendedAttribute takes an argument list', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[Constructor(float x, float y)]");
      expect(sp, equals([['Constructor', [['float', ['x', [',', ['float', ['y', null]]]]], null]], null]));
    });

    test('extendedAttribute takes a named argument list', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[NamedConstructor=Image(DOMString src)]");
      expect(sp, equals("THIS TEST IS FAILING"));
    });

    test('extendedAttribute takes an identifier', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[PutForwards=name]");
      expect(sp, equals("THIS TEST IS FAILING"));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttributes
    test('extendedAttributes empty', () {
      var p = webIdlParser.extendedAttributes();
      var sp = p.parse("");
      expect(sp, equals(null));
    });

    test('extendedAttributes', () {
      var p = webIdlParser.extendedAttributes();
      var sp = p.parse(", [Constructor(float x, float y)]");
      expect(sp, equals([',',[['Constructor', [['float', ['x', [',', ['float', ['y', null]]]]], null]],null],null]));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttributes
    test('extendedAttributeList empty', () {
      var p = webIdlParser.extendedAttributeList();
      var sp = p.parse("");
      expect(sp, equals(null));
    });

    test('extendedAttributeList list', () {
      var p = webIdlParser.extendedAttributeList();
      var sp = p.parse("[[Constructor1(float x, float y)], [Constructor2(float x, float y)]]");
      expect(sp, equals([
                         [
                          ['Constructor1', [['float', ['x', [',', ['float', ['y', null]]]]], null]],
                          null
                          ],
                          [
                           ',',
                           [
                            ['Constructor2', [['float', ['x', [',', ['float', ['y', null]]]]], null]],
                            null
                            ],
                            null
                            ]
                         ]));
    });



    test('general example test', () {
      var example = """dictionary Alarm {
    // Name of this alarm.
    DOMString name;

    // Time at which this alarm was scheduled to fire, in milliseconds past the
    // epoch (e.g. <code>Date.now() + n</code>).  For performance reasons, the
    // alarm may have been delayed an arbitrary amount beyond this.
    double scheduledTime;

    // If not null, the alarm is a repeating alarm and will fire again in
    // <var>periodInMinutes</var> minutes.
    double? periodInMinutes;
  };

  // TODO(mpcomplete): rename to CreateInfo when http://crbug.com/123073 is
  // fixed.
  dictionary AlarmCreateInfo {
    // Time at which the alarm should fire, in milliseconds past the epoch
    // (e.g. <code>Date.now() + n</code>).
    double? when;

    // Length of time in minutes after which the <code>onAlarm</code> event
    // should fire.
    //
    // <!-- TODO: need minimum=0 -->
    double? delayInMinutes;

    // If set, the onAlarm event should fire every <var>periodInMinutes</var>
    // minutes after the initial event specified by <var>when</var> or
    // <var>delayInMinutes</var>.  If not set, the alarm will only fire once.
    //
    // <!-- TODO: need minimum=0 -->
    double? periodInMinutes;
  };

  callback AlarmCallback = void (Alarm alarm);
  callback AlarmListCallback = void (Alarm[] alarms);

  interface Functions {
    // Creates an alarm.  Near the time(s) specified by <var>alarmInfo</var>,
    // the <code>onAlarm</code> event is fired. If there is another alarm with
    // the same name (or no name if none is specified), it will be cancelled and
    // replaced by this alarm.
    //
    // In order to reduce the load on the user's machine, Chrome limits alarms
    // to at most once every 1 minute but may delay them an arbitrary amount
    // more.  That is, setting <code>delayInMinutes</code> or
    // <code>periodInMinutes</code> to less than <code>1</code> will not be
    // honored and will cause a warning.  <code>when</code> can be set to less
    // than 1 minute after "now" without warning but won't actually cause the
    // alarm to fire for at least 1 minute.
    //
    // To help you debug your app or extension, when you've loaded it unpacked,
    // there's no limit to how often the alarm can fire.
    //
    // |name|: Optional name to identify this alarm. Defaults to the empty
    // string.
    //
    // |alarmInfo|: Describes when the alarm should fire.  The initial time must
    // be specified by either <var>when</var> or <var>delayInMinutes</var> (but
    // not both).  If <var>periodInMinutes</var> is set, the alarm will repeat
    // every <var>periodInMinutes</var> minutes after the initial event.  If
    // neither <var>when</var> or <var>delayInMinutes</var> is set for a
    // repeating alarm, <var>periodInMinutes</var> is used as the default for
    // <var>delayInMinutes</var>.
    static void create(optional DOMString name, AlarmCreateInfo alarmInfo);

    // Retrieves details about the specified alarm.
    // |name|: The name of the alarm to get. Defaults to the empty string.
    static void get(optional DOMString name, AlarmCallback callback);

    // Gets an array of all the alarms.
    static void getAll(AlarmListCallback callback);

    // Clears the alarm with the given name.
    // |name|: The name of the alarm to clear. Defaults to the empty string.
    static void clear(optional DOMString name);

    // Clears all alarms.
    static void clearAll();
  };

  interface Events {
    // Fired when an alarm has elapsed. Useful for event pages.
    // |alarm|: The alarm that has elapsed.
    static void onAlarm(Alarm alarm);
  };
""";
      var p = webIdlParser.start;
      var sp = p.parse(example);
      print(sp);
      expect(sp, equals("not failing"));
    });
  });
}