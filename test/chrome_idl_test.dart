library chrome_idl_test;

import 'package:unittest/unittest.dart';

import '../tool/chrome_idl_parser.dart';

void chromeIDLParserDocStringTests() {
  test('comment with **', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("/** Some comment */");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment "));
  });

  test('comment with ** multiline', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("""
/**
 * Some comment
 *
 * Some comment information.
 * Some more comment information.
 *
 */""");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(
        '\n'
        ' * Some comment\n'
        ' *\n'
        ' * Some comment information.\n'
        ' * Some more comment information.\n'
        ' *\n'
        ' '));
  });

  test('comment with *', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("/* Some comment */");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment "));
  });

  test('comment with * multiline', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("""
/*
 * Some comment
 *
 * Some comment information.
 * Some more comment information.
 *
 */""");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(
        '\n'
        ' * Some comment\n'
        ' *\n'
        ' * Some comment information.\n'
        ' * Some more comment information.\n'
        ' *\n'
        ' '));
  });

  test('comment with //', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("// Some comment\n");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment"));
  });

  test('comment with // multiline', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("""
//
// Some comment
//
// Some comment information.
// Some more comment information.
//
//""");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(6));
    expect(doc[0], equals(''));
    expect(doc[1], equals(' Some comment'));
    expect(doc[2], equals(''));
    expect(doc[3], equals(' Some comment information.'));
    expect(doc[4], equals(' Some more comment information.'));
    expect(doc[5], equals(''));
  });
}

void chromeIDLParserAttributeDeclarationTests() {
  test('attribute with [instanceOf=Window]', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLAttributeDeclaration attributeDeclaration = chromeIDLParser.attributeDeclaration
        .parse("[instanceOf=Window]");

    expect(attributeDeclaration, isNotNull);
    List<IDLAttribute> attributes = attributeDeclaration.attributes;
    expect(attributes.length, equals(1));
    IDLAttribute attribute = attributes[0];
    expect(attribute, isNotNull);
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(attribute.attributeValue, equals("Window"));
  });

  test('attribute with [nodoc]', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLAttributeDeclaration attributeDeclaration = chromeIDLParser.attributeDeclaration
        .parse("[nodoc]");

    expect(attributeDeclaration, isNotNull);
    List<IDLAttribute> attributes = attributeDeclaration.attributes;
    expect(attributes.length, equals(1));
    IDLAttribute attribute = attributes[0];
    expect(attribute, isNotNull);
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.NODOC));
  });

  test('attribute with [legalValues=(16,32)]', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLAttributeDeclaration attributeDeclaration = chromeIDLParser.attributeDeclaration
        .parse("[legalValues=(16,32)]");

    expect(attributeDeclaration, isNotNull);
    List<IDLAttribute> attributes = attributeDeclaration.attributes;
    expect(attributes.length, equals(1));
    IDLAttribute attribute = attributes[0];
    expect(attribute, isNotNull);
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.LEGAL_VALUES));
    expect(attribute.attributeValues.length, equals(2));
    expect(attribute.attributeValues[0], equals(16));
    expect(attribute.attributeValues[1], equals(32));
  });

  test('attribute with [nocompile, nodoc]', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLAttributeDeclaration attributeDeclaration = chromeIDLParser.attributeDeclaration
        .parse("[nocompile, nodoc]");

    expect(attributeDeclaration, isNotNull);
    List<IDLAttribute> attributes = attributeDeclaration.attributes;
    expect(attributeDeclaration.attributes.length, equals(2));
    IDLAttribute attribute = attributes[0];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.NOCOMPILE));
    attribute = attributes[1];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.NODOC));
  });
}

void chromeIDLParserEnumBodyTests() {
  test('enum value with comments', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumValue enumValue = chromeIDLParser.enumBody.parse("""
// A comment about a value.
value
""");
    expect(enumValue, isNotNull);
    expect(enumValue.name, equals("value"));
    expect(enumValue.documentation.length, equals(1));
    expect(enumValue.documentation[0], equals(" A comment about a value."));
  });

  test('enum value with multiline comments', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumValue enumValue = chromeIDLParser.enumBody.parse("""
// A comment about a value.
// A second line of comments.
value
""");
    expect(enumValue, isNotNull);
    expect(enumValue.name, equals("value"));
    expect(enumValue.documentation.length, equals(2));
    expect(enumValue.documentation[0], equals(" A comment about a value."));
    expect(enumValue.documentation[1], equals(" A second line of comments."));
  });

  test('enum value without comments', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumValue enumValue = chromeIDLParser.enumBody.parse("value");
    expect(enumValue, isNotNull);
    expect(enumValue.name, equals("value"));
    expect(enumValue.documentation, isEmpty);
  });
}

void chromeIDLParserEnumDeclarationTests() {
  test('enum single line declaration', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumDeclaration enumDeclaration = chromeIDLParser.enumDeclaration
        .parse("enum Values {value1, value_2, VALUE};");
    expect(enumDeclaration, isNotNull);
    expect(enumDeclaration.name, equals("Values"));
    expect(enumDeclaration.documentation, isEmpty);
    expect(enumDeclaration.attribute, isNull);
    expect(enumDeclaration.enums.length, equals(3));
    expect(enumDeclaration.enums[0].name, equals("value1"));
    expect(enumDeclaration.enums[0].documentation, isEmpty);
    expect(enumDeclaration.enums[1].name, equals("value_2"));
    expect(enumDeclaration.enums[1].documentation, isEmpty);
    expect(enumDeclaration.enums[2].name, equals("VALUE"));
    expect(enumDeclaration.enums[2].documentation, isEmpty);
  });

  test('enum single line declaration with attribute', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumDeclaration enumDeclaration = chromeIDLParser.enumDeclaration
        .parse("[nodoc] enum Values {value1, value_2, VALUE};");
    expect(enumDeclaration, isNotNull);
    expect(enumDeclaration.name, equals("Values"));
    expect(enumDeclaration.documentation, isEmpty);
    expect(enumDeclaration.attribute, isNotNull);
    expect(enumDeclaration.attribute.attributes.length, equals(1));
    expect(enumDeclaration.attribute.attributes[0].attributeType,
        equals(IDLAttributeTypeEnum.NODOC));
    expect(enumDeclaration.enums.length, equals(3));
    expect(enumDeclaration.enums[0].name, equals("value1"));
    expect(enumDeclaration.enums[0].documentation, isEmpty);
    expect(enumDeclaration.enums[1].name, equals("value_2"));
    expect(enumDeclaration.enums[1].documentation, isEmpty);
    expect(enumDeclaration.enums[2].name, equals("VALUE"));
    expect(enumDeclaration.enums[2].documentation, isEmpty);
  });

  // TODO: enum multiline with/without attribute & doc.

  test('enum multiline with comments', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumDeclaration enumDeclaration = chromeIDLParser.enumDeclaration
        .parse("""
// Comments for Values
enum Values {

// Comments for value1
value1, 

// Comments for value_2
// Added second line for comment
value_2, 

// Comments for Values
VALUE};""");

    expect(enumDeclaration, isNotNull);
    expect(enumDeclaration.name, equals("Values"));
    expect(enumDeclaration.documentation.length, equals(1));
    expect(enumDeclaration.documentation[0], equals(" Comments for Values"));

    expect(enumDeclaration.enums.length, equals(3));
    expect(enumDeclaration.enums[0].name, equals("value1"));
    expect(enumDeclaration.enums[0].documentation.length, equals(1));
    expect(enumDeclaration.enums[0].documentation[0],
        equals(" Comments for value1"));
    expect(enumDeclaration.enums[1].name, equals("value_2"));
    expect(enumDeclaration.enums[1].documentation.length, equals(2));
    expect(enumDeclaration.enums[1].documentation[0],
        equals(" Comments for value_2"));
    expect(enumDeclaration.enums[1].documentation[1],
        equals(" Added second line for comment"));
    expect(enumDeclaration.enums[2].name, equals("VALUE"));
    expect(enumDeclaration.enums[2].documentation.length, equals(1));
    expect(enumDeclaration.enums[2].documentation[0],
        equals(" Comments for Values"));
  });

  test('enum multiline with comments attribute', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLEnumDeclaration enumDeclaration = chromeIDLParser.enumDeclaration
        .parse("""
// Comments for Values
[nocompile, nodoc]
enum Values {

// Comments for value1
value1, 

// Comments for value_2
// Added second line for comment
value_2, 

// Comments for Values
VALUE};""");

    expect(enumDeclaration, isNotNull);

    expect(enumDeclaration.attribute, isNotNull);
    List<IDLAttribute> attributes = enumDeclaration.attribute.attributes;
    expect(attributes.length, equals(2));
    IDLAttribute attribute = attributes[0];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.NOCOMPILE));
    attribute = attributes[1];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.NODOC));

    expect(enumDeclaration.name, equals("Values"));
    expect(enumDeclaration.documentation.length, equals(1));
    expect(enumDeclaration.documentation[0], equals(" Comments for Values"));

    expect(enumDeclaration.enums.length, equals(3));
    expect(enumDeclaration.enums[0].name, equals("value1"));
    expect(enumDeclaration.enums[0].documentation.length, equals(1));
    expect(enumDeclaration.enums[0].documentation[0],
        equals(" Comments for value1"));
    expect(enumDeclaration.enums[1].name, equals("value_2"));
    expect(enumDeclaration.enums[1].documentation.length, equals(2));
    expect(enumDeclaration.enums[1].documentation[0],
        equals(" Comments for value_2"));
    expect(enumDeclaration.enums[1].documentation[1],
        equals(" Added second line for comment"));
    expect(enumDeclaration.enums[2].name, equals("VALUE"));
    expect(enumDeclaration.enums[2].documentation.length, equals(1));
    expect(enumDeclaration.enums[2].documentation[0],
        equals(" Comments for Values"));
  });
}

void chromeIDLParserCallbackParameterTypeTests() {
  test('callback parameter type with array', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLType callbackParameterType = chromeIDLParser.callbackParameterType
        .parse("Device[]");
    expect(callbackParameterType, isNotNull);
    expect(callbackParameterType.name, equals("Device"));
    expect(callbackParameterType.isArray, isTrue);
  });

  test('callback parameter type without array', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLType callbackParameterType = chromeIDLParser.callbackParameterType
        .parse("Device");
    expect(callbackParameterType, isNotNull);
    expect(callbackParameterType.name, equals("Device"));
    expect(callbackParameterType.isArray, isFalse);
  });
}

void chromeIDLParserCallbackParameterTests() {
  test('callback parameter with attribute', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLParameter callbackParameter = chromeIDLParser.callbackParameters
        .parse("[instanceOf=Entry] object entry");

    expect(callbackParameter, isNotNull);
    expect(callbackParameter.name, equals("entry"));
    expect(callbackParameter.isCallback, isFalse);
    expect(callbackParameter.isOptional, isFalse);
    expect(callbackParameter.type.isArray, isFalse);
    expect(callbackParameter.type.name, equals("Entry"));
    expect(callbackParameter.attribute.attributes[0].attributeType,
        equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(callbackParameter.attribute.attributes[0].attributeValue,
        equals("Entry"));
  });

  test('callback parameter with optional', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLParameter callbackParameter = chromeIDLParser.callbackParameters
        .parse("optional DOMString responseUrl");

    expect(callbackParameter, isNotNull);
    expect(callbackParameter.name, equals("responseUrl"));
    expect(callbackParameter.attribute, isNull);
    expect(callbackParameter.isCallback, isFalse);
    expect(callbackParameter.isOptional, isTrue);
    expect(callbackParameter.type.isArray, isFalse);
    expect(callbackParameter.type.name, equals("DOMString"));
  });

  test('callback parameter with array', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLParameter callbackParameter = chromeIDLParser.callbackParameters
        .parse("Device[] result");

    expect(callbackParameter, isNotNull);
    expect(callbackParameter.name, equals("result"));
    expect(callbackParameter.attribute, isNull);
    expect(callbackParameter.isCallback, isFalse);
    expect(callbackParameter.isOptional, isFalse);
    expect(callbackParameter.type.isArray, isTrue);
    expect(callbackParameter.type.name, equals("Device"));
  });

  test('callback parameter', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    IDLParameter callbackParameter = chromeIDLParser.callbackParameters
        .parse("Device device");

    expect(callbackParameter, isNotNull);
    expect(callbackParameter.name, equals("device"));
    expect(callbackParameter.attribute, isNull);
    expect(callbackParameter.isCallback, isFalse);
    expect(callbackParameter.isOptional, isFalse);
    expect(callbackParameter.type.isArray, isFalse);
    expect(callbackParameter.type.name, equals("Device"));
  });
}

void chromeIDLParserCallbackMethodTests() {
  test('with no parameters', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLParameter> parameters = chromeIDLParser.callbackMethod.parse("void()");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(0));

    parameters = chromeIDLParser.callbackMethod.parse("void ()");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(0));

  });

  test('with one parameter', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLParameter> parameters = chromeIDLParser.callbackMethod
        .parse("void (long result)");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(1));
    IDLParameter parameter = parameters[0];
    expect(parameter.name, equals("result"));
    expect(parameter.attribute, isNull);
    expect(parameter.isCallback, isFalse);
    expect(parameter.isOptional, isFalse);
    expect(parameter.type.isArray, isFalse);
    expect(parameter.type.name, equals("long"));
  });

  test('with multiple parameters', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLParameter> parameters = chromeIDLParser.callbackMethod
        .parse("""void(OutputDeviceInfo[] outputInfo,
InputDeviceInfo[] inputInfo)""");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(2));
    IDLParameter parameter = parameters[0];
    expect(parameter.name, equals("outputInfo"));
    expect(parameter.attribute, isNull);
    expect(parameter.isCallback, isFalse);
    expect(parameter.isOptional, isFalse);
    expect(parameter.type.isArray, isTrue);
    expect(parameter.type.name, equals("OutputDeviceInfo"));

    parameter = parameters[1];
    expect(parameter.name, equals("inputInfo"));
    expect(parameter.attribute, isNull);
    expect(parameter.isCallback, isFalse);
    expect(parameter.isOptional, isFalse);
    expect(parameter.type.isArray, isTrue);
    expect(parameter.type.name, equals("InputDeviceInfo"));
  });

  test('with mixed type parameters', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLParameter> parameters = chromeIDLParser.callbackMethod.parse(
"""void (optional ArrayBuffer result, bool success, DOMString[] codes)""");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(3));
    IDLParameter parameter = parameters[0];
    expect(parameter.name, equals("result"));
    expect(parameter.attribute, isNull);
    expect(parameter.isCallback, isFalse);
    expect(parameter.isOptional, isTrue);
    expect(parameter.type.isArray, isFalse);
    expect(parameter.type.name, equals("ArrayBuffer"));

    parameter = parameters[1];
    expect(parameter.name, equals("success"));
    expect(parameter.attribute, isNull);
    expect(parameter.isCallback, isFalse);
    expect(parameter.isOptional, isFalse);
    expect(parameter.type.isArray, isFalse);
    expect(parameter.type.name, equals("bool"));

    parameter = parameters[2];
    expect(parameter.name, equals("codes"));
    expect(parameter.attribute, isNull);
    expect(parameter.isCallback, isFalse);
    expect(parameter.isOptional, isFalse);
    expect(parameter.type.isArray, isTrue);
    expect(parameter.type.name, equals("DOMString"));
  });
}

void chromeIDLParserCallbackDeclarationTests() {
  test('single line', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLCallbackDeclaration> callbackDeclarations =
        chromeIDLParser.callbackDeclaration.parse(""" 
callback GetAuthTokenCallback = void (optional DOMString token);
""");

    expect(callbackDeclarations, isNotNull);
    expect(callbackDeclarations.length, equals(1));
    IDLCallbackDeclaration callbackDeclaration = callbackDeclarations[0];
    expect(callbackDeclaration.name, equals("GetAuthTokenCallback"));
    expect(callbackDeclaration.documentation, isEmpty);
    expect(callbackDeclaration.parameters.length, equals(1));
    expect(callbackDeclaration.parameters[0].name, equals("token"));
    expect(callbackDeclaration.parameters[0].type.name, equals("DOMString"));
    expect(callbackDeclaration.parameters[0].isOptional, isTrue);
    expect(callbackDeclaration.parameters[0].isCallback, isFalse);
    expect(callbackDeclaration.parameters[0].attribute, isNull);
  });

  test('single line with comments', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLCallbackDeclaration> callbackDeclarations =
        chromeIDLParser.callbackDeclaration.parse(""" 
// Some comment.
callback EntryCallback = void ([instanceOf=Entry] object entry);
""");

    expect(callbackDeclarations, isNotNull);
    expect(callbackDeclarations.length, equals(1));
    IDLCallbackDeclaration callbackDeclaration = callbackDeclarations[0];
    expect(callbackDeclaration.name, equals("EntryCallback"));
    expect(callbackDeclaration.documentation.length, equals(1));
    expect(callbackDeclaration.documentation[0], equals(" Some comment."));
    expect(callbackDeclaration.parameters.length, equals(1));
    expect(callbackDeclaration.parameters[0].name, equals("entry"));
    expect(callbackDeclaration.parameters[0].type.name, equals("Entry"));
    expect(callbackDeclaration.parameters[0].isOptional, isFalse);
    expect(callbackDeclaration.parameters[0].isCallback, isFalse);
    expect(callbackDeclaration.parameters[0].attribute, isNotNull);
    expect(callbackDeclaration.parameters[0].attribute.attributes.length,
        equals(1));
    IDLAttribute attribute =
        callbackDeclaration.parameters[0].attribute.attributes[0];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(attribute.attributeValue, equals("Entry"));
  });

  test('multiline', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLCallbackDeclaration> callbackDeclarations =
        chromeIDLParser.callbackDeclaration.parse(""" 
callback GetAuthTokenCallback = void (optional DOMString token);
callback EntryCallback = void ([instanceOf=Entry] object entry);
""");

    expect(callbackDeclarations, isNotNull);
    expect(callbackDeclarations.length, equals(2));
    IDLCallbackDeclaration callbackDeclaration = callbackDeclarations[0];
    expect(callbackDeclaration.name, equals("GetAuthTokenCallback"));
    expect(callbackDeclaration.documentation, isEmpty);
    expect(callbackDeclaration.parameters.length, equals(1));
    expect(callbackDeclaration.parameters[0].name, equals("token"));
    expect(callbackDeclaration.parameters[0].type.name, equals("DOMString"));
    expect(callbackDeclaration.parameters[0].isOptional, isTrue);
    expect(callbackDeclaration.parameters[0].isCallback, isFalse);
    expect(callbackDeclaration.parameters[0].attribute, isNull);

    callbackDeclaration = callbackDeclarations[1];
    expect(callbackDeclaration.name, equals("EntryCallback"));
    expect(callbackDeclaration.documentation, isEmpty);
    expect(callbackDeclaration.parameters.length, equals(1));
    expect(callbackDeclaration.parameters[0].name, equals("entry"));
    expect(callbackDeclaration.parameters[0].type.name, equals("Entry"));
    expect(callbackDeclaration.parameters[0].isOptional, isFalse);
    expect(callbackDeclaration.parameters[0].isCallback, isFalse);
    expect(callbackDeclaration.parameters[0].attribute, isNotNull);
    expect(callbackDeclaration.parameters[0].attribute.attributes.length,
        equals(1));
    IDLAttribute attribute =
        callbackDeclaration.parameters[0].attribute.attributes[0];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(attribute.attributeValue, equals("Entry"));
  });

  test('multiline with comments', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    List<IDLCallbackDeclaration> callbackDeclarations =
        chromeIDLParser.callbackDeclaration.parse("""
// Some comment.
callback GetAuthTokenCallback = void (optional DOMString token);
/* Another comment. */
callback EntryCallback = void ([instanceOf=Entry] object entry);
""");

    expect(callbackDeclarations, isNotNull);
    expect(callbackDeclarations.length, equals(2));
    IDLCallbackDeclaration callbackDeclaration = callbackDeclarations[0];
    expect(callbackDeclaration.name, equals("GetAuthTokenCallback"));
    expect(callbackDeclaration.documentation.length, equals(1));
    expect(callbackDeclaration.parameters.length, equals(1));
    expect(callbackDeclaration.documentation[0], equals(" Some comment."));
    expect(callbackDeclaration.parameters[0].name, equals("token"));
    expect(callbackDeclaration.parameters[0].type.name, equals("DOMString"));
    expect(callbackDeclaration.parameters[0].isOptional, isTrue);
    expect(callbackDeclaration.parameters[0].isCallback, isFalse);
    expect(callbackDeclaration.parameters[0].attribute, isNull);

    callbackDeclaration = callbackDeclarations[1];
    expect(callbackDeclaration.name, equals("EntryCallback"));
    expect(callbackDeclaration.documentation.length, equals(1));
    expect(callbackDeclaration.documentation[0], equals(" Another comment. "));
    expect(callbackDeclaration.parameters.length, equals(1));
    expect(callbackDeclaration.parameters[0].name, equals("entry"));
    expect(callbackDeclaration.parameters[0].type.name, equals("Entry"));
    expect(callbackDeclaration.parameters[0].isOptional, isFalse);
    expect(callbackDeclaration.parameters[0].isCallback, isFalse);
    expect(callbackDeclaration.parameters[0].attribute, isNotNull);
    expect(callbackDeclaration.parameters[0].attribute.attributes.length,
        equals(1));
    IDLAttribute attribute =
        callbackDeclaration.parameters[0].attribute.attributes[0];
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(attribute.attributeValue, equals("Entry"));
  });
}

void main() {
  group('ChromeIDLParser.docString.parse', chromeIDLParserDocStringTests);
  group('ChromeIDLParser.attributeDeclaration.parse',
      chromeIDLParserAttributeDeclarationTests);
  group('ChromeIDLParser.enumBody.parse', chromeIDLParserEnumBodyTests);
  group('ChromeIDLParser.enumDeclaration.parse',
      chromeIDLParserEnumDeclarationTests);
  group('ChromeIDLParser.callbackParameterType.parse',
      chromeIDLParserCallbackParameterTypeTests);
  group('ChromeIDLParser.callbackParameters.parse',
      chromeIDLParserCallbackParameterTests);
  group('ChromeIDLParser.callbackMethod.parse',
        chromeIDLParserCallbackMethodTests);
  group('ChromeIDLParser.callbackDeclaration.parse',
        chromeIDLParserCallbackDeclarationTests);
}
