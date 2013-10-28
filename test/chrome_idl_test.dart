library chrome_idl_test;

import 'package:unittest/unittest.dart';

import '../tool/chrome_idl_parser.dart';
import '../tool/chrome_idl_model.dart';

ChromeIDLParser chromeIDLParser;

void main() {
  setUp(() {
    chromeIDLParser = new ChromeIDLParser();
  });

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
  group('ChromeIDLParser.fieldType.parse',
        chromeIDLParserFieldTypeTests);
  group('ChromeIDLParser.fieldMethodParameters.parse',
        chromeIDLParserFieldMethodParametersTests);
  group('ChromeIDLParser.typeBody.parse',
        chromeIDLParserTypeBodyTests);
  group('ChromeIDLParser.typeDeclaration.parse',
        chromeIDLParserTypeDeclarationTests);
}

void chromeIDLParserDocStringTests() {
  test('comment with **', () {

    var doc = chromeIDLParser.docString.parse("/** Some comment */");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment "));
  });

  test('comment with ** multiline', () {

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

    var doc = chromeIDLParser.docString.parse("/* Some comment */");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment "));
  });

  test('comment with * multiline', () {

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

    var doc = chromeIDLParser.docString.parse("// Some comment\n");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment"));
  });

  test('comment with // multiline', () {

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

    IDLAttributeDeclaration attributeDeclaration =
        chromeIDLParser.attributeDeclaration.parse("[instanceOf=Window]");

    expect(attributeDeclaration, isNotNull);
    List<IDLAttribute> attributes = attributeDeclaration.attributes;
    expect(attributes.length, equals(1));
    IDLAttribute attribute = attributes[0];
    expect(attribute, isNotNull);
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(attribute.attributeValue, equals("Window"));
  });

  test('attribute with [nodoc]', () {

    IDLAttributeDeclaration attributeDeclaration =
        chromeIDLParser.attributeDeclaration.parse("[nodoc]");

    expect(attributeDeclaration, isNotNull);
    List<IDLAttribute> attributes = attributeDeclaration.attributes;
    expect(attributes.length, equals(1));
    IDLAttribute attribute = attributes[0];
    expect(attribute, isNotNull);
    expect(attribute.attributeType, equals(IDLAttributeTypeEnum.NODOC));
  });

  test('attribute with [legalValues=(16,32)]', () {

    IDLAttributeDeclaration attributeDeclaration =
        chromeIDLParser.attributeDeclaration.parse("[legalValues=(16,32)]");

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

    IDLAttributeDeclaration attributeDeclaration =
        chromeIDLParser.attributeDeclaration.parse("[nocompile, nodoc]");

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

    IDLEnumValue enumValue = chromeIDLParser.enumBody.parse("value");
    expect(enumValue, isNotNull);
    expect(enumValue.name, equals("value"));
    expect(enumValue.documentation, isEmpty);
  });
}

void chromeIDLParserEnumDeclarationTests() {
  test('enum single line declaration', () {

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

  test('enum multiline with comments', () {

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

    IDLType callbackParameterType = chromeIDLParser.callbackParameterType
        .parse("Device[]");
    expect(callbackParameterType, isNotNull);
    expect(callbackParameterType.name, equals("Device"));
    expect(callbackParameterType.isArray, isTrue);
  });

  test('callback parameter type without array', () {

    IDLType callbackParameterType = chromeIDLParser.callbackParameterType
        .parse("Device");
    expect(callbackParameterType, isNotNull);
    expect(callbackParameterType.name, equals("Device"));
    expect(callbackParameterType.isArray, isFalse);
  });
}

void chromeIDLParserCallbackParameterTests() {
  test('callback parameter with attribute', () {

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

    List<IDLParameter> parameters = chromeIDLParser.callbackMethod
        .parse("void()");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(0));

    parameters = chromeIDLParser.callbackMethod.parse("void ()");

    expect(parameters, isNotNull);
    expect(parameters.length, equals(0));

  });

  test('with one parameter', () {

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

void chromeIDLParserFieldTypeTests() {
  test('field type with array', () {

    IDLType fieldType = chromeIDLParser.fieldType
        .parse("Device[]");
    expect(fieldType, isNotNull);
    expect(fieldType.name, equals("Device"));
    expect(fieldType.isArray, isTrue);
  });

  test('field type without array', () {

    IDLType fieldType = chromeIDLParser.fieldType
        .parse("Device");
    expect(fieldType, isNotNull);
    expect(fieldType.name, equals("Device"));
    expect(fieldType.isArray, isFalse);
  });
}

void chromeIDLParserFieldMethodParametersTests() {
  test('with attribute', () {

    IDLParameter fieldMethodParameter = chromeIDLParser.fieldMethodParameters
        .parse("[instanceOf=Entry] object entry");

    expect(fieldMethodParameter, isNotNull);
    expect(fieldMethodParameter.name, equals("entry"));
    expect(fieldMethodParameter.isCallback, isFalse);
    expect(fieldMethodParameter.isOptional, isFalse);
    expect(fieldMethodParameter.type.isArray, isFalse);
    expect(fieldMethodParameter.type.name, equals("Entry"));
    expect(fieldMethodParameter.attribute.attributes[0].attributeType,
        equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(fieldMethodParameter.attribute.attributes[0].attributeValue,
        equals("Entry"));
  });

  test('without attribute', () {

    IDLParameter fieldMethodParameter = chromeIDLParser.fieldMethodParameters
        .parse("DOMString responseUrl");

    expect(fieldMethodParameter, isNotNull);
    expect(fieldMethodParameter.name, equals("responseUrl"));
    expect(fieldMethodParameter.attribute, isNull);
    expect(fieldMethodParameter.isCallback, isFalse);
    expect(fieldMethodParameter.isOptional, isFalse);
    expect(fieldMethodParameter.type.isArray, isFalse);
    expect(fieldMethodParameter.type.name, equals("DOMString"));
  });

  test('array type without attribute', () {

    IDLParameter fieldMethodParameter = chromeIDLParser.fieldMethodParameters
        .parse("DOMString[] urls");

    expect(fieldMethodParameter, isNotNull);
    expect(fieldMethodParameter.name, equals("urls"));
    expect(fieldMethodParameter.attribute, isNull);
    expect(fieldMethodParameter.isCallback, isFalse);
    expect(fieldMethodParameter.isOptional, isFalse);
    expect(fieldMethodParameter.type.isArray, isTrue);
    expect(fieldMethodParameter.type.name, equals("DOMString"));
  });
}

void chromeIDLParserTypeBodyTests() {


  test('field with attribute', () {
    List<IDLField> typeField = chromeIDLParser.typeBody
        .parse("[instanceOf=FileEntry] object entry;");
    expect(typeField, isNotNull);
    expect(typeField.length, 1);
    expect(typeField[0].name, equals("entry"));
    expect(typeField[0].type.name, equals("FileEntry"));
    expect(typeField[0].type.isArray, isFalse);
    expect(typeField[0].isOptional, isFalse);
    expect(typeField[0].attribute.attributes[0].attributeType,
        equals(IDLAttributeTypeEnum.INSTANCE_OF));
    expect(typeField[0].attribute.attributes[0].attributeValue,
        equals("FileEntry"));
  });
  test('field with optional', () {
    List<IDLField> typeField = chromeIDLParser.typeBody
        .parse("DOMString? entry;");
    expect(typeField, isNotNull);
    expect(typeField.length, 1);
    expect(typeField[0].name, equals("entry"));
    expect(typeField[0].type.name, equals("DOMString"));
    expect(typeField[0].type.isArray, isFalse);
    expect(typeField[0].isOptional, isTrue);
  });

  test('field without optional', () {
    List<IDLField> typeField = chromeIDLParser.typeBody
        .parse("DOMString entry;");
    expect(typeField, isNotNull);
    expect(typeField.length, 1);
    expect(typeField[0].name, equals("entry"));
    expect(typeField[0].type.name, equals("DOMString"));
    expect(typeField[0].type.isArray, isFalse);
    expect(typeField[0].isOptional, isFalse);
  });

  test('field array with optional', () {
    List<IDLField> typeField = chromeIDLParser.typeBody
        .parse("DOMString[]? entry;");
    expect(typeField, isNotNull);
    expect(typeField.length, 1);
    expect(typeField[0].name, equals("entry"));
    expect(typeField[0].type.name, equals("DOMString"));
    expect(typeField[0].type.isArray, isTrue);
    expect(typeField[0].isOptional, isTrue);
  });

  test('field array without optional', () {
    List<IDLField> typeField = chromeIDLParser.typeBody
        .parse("DOMString[] entry;");
    expect(typeField, isNotNull);
    expect(typeField.length, 1);
    expect(typeField[0].name, equals("entry"));
    expect(typeField[0].type.name, equals("DOMString"));
    expect(typeField[0].type.isArray, isTrue);
    expect(typeField[0].isOptional, isFalse);
  });

  test('field void method no parameters', () {
    List<IDLMethod> typeFieldMethod = chromeIDLParser.typeBody
        .parse("static void size();");
    expect(typeFieldMethod, isNotNull);
    expect(typeFieldMethod.length, 1);
    expect(typeFieldMethod[0].name, equals("size"));
    expect(typeFieldMethod[0].parameters, isEmpty);
    expect(typeFieldMethod[0].attribute, isNull);
    expect(typeFieldMethod[0].returnType.name, equals("void"));
    expect(typeFieldMethod[0].returnType.isArray, isFalse);
    expect(typeFieldMethod[0].documentation, isEmpty);
  });

  test('field void method with multiple parameters', () {
    List<IDLMethod> typeFieldMethod = chromeIDLParser.typeBody
        .parse("static Sizes[] resizeTo(long width, long height);");
    expect(typeFieldMethod, isNotNull);
    expect(typeFieldMethod.length, 1);
    expect(typeFieldMethod[0].name, equals("resizeTo"));
    expect(typeFieldMethod[0].parameters.length, 2);
    IDLParameter parameter = typeFieldMethod[0].parameters[0];
    expect(parameter.name, equals("width"));
    expect(parameter.type.name, equals("long"));
    parameter = typeFieldMethod[0].parameters[1];
    expect(parameter.name, equals("height"));
    expect(parameter.type.name, equals("long"));
    expect(typeFieldMethod[0].attribute, isNull);
    expect(typeFieldMethod[0].returnType.name, equals("Sizes"));
    expect(typeFieldMethod[0].returnType.isArray, isTrue);
    expect(typeFieldMethod[0].documentation, isEmpty);
  });

  test('field void method with attribute', () {
    List<IDLMethod> typeFieldMethod = chromeIDLParser.typeBody
        .parse("[nodoc] static void size();");
    expect(typeFieldMethod, isNotNull);
    expect(typeFieldMethod.length, 1);
    expect(typeFieldMethod[0].name, equals("size"));
    expect(typeFieldMethod[0].parameters, isEmpty);
    expect(typeFieldMethod[0].attribute.attributes.length, equals(1));
    IDLAttribute attribute = typeFieldMethod[0].attribute.attributes[0];
    expect(attribute.attributeType, IDLAttributeTypeEnum.NODOC);
    expect(typeFieldMethod[0].returnType.name, equals("void"));
    expect(typeFieldMethod[0].returnType.isArray, isFalse);
    expect(typeFieldMethod[0].documentation, isEmpty);
  });

  test('field type returned method with no parameters', () {
    List<IDLMethod> typeFieldMethod = chromeIDLParser.typeBody
        .parse("static Bounds getBounds();");
    expect(typeFieldMethod, isNotNull);
    expect(typeFieldMethod.length, 1);
    expect(typeFieldMethod[0].name, equals("getBounds"));
    expect(typeFieldMethod[0].parameters, isEmpty);
    expect(typeFieldMethod[0].attribute, isNull);
    expect(typeFieldMethod[0].returnType.name, equals("Bounds"));
    expect(typeFieldMethod[0].returnType.isArray, isFalse);
    expect(typeFieldMethod[0].documentation, isEmpty);
  });

  test('field type returned method with mixed parameters', () {
    List types = chromeIDLParser.typeBody
        .parse(""" 
// Some comments
static Bounds getBounds();

// Some other comments
// Multiline
[nodoc] static void size();

static Sizes[] resizeTo(long width, long height);

DOMString[] entry1;

DOMString[]? entry2;

DOMString? entry3;

DOMString entry4;
""");
    expect(types, isNotNull);
    expect(types[0].runtimeType.toString(), equals("IDLMethod"));
    expect(types[0].documentation.length, equals(1));
    expect(types[1].runtimeType.toString(), equals("IDLMethod"));
    expect(types[1].documentation.length, equals(2));
    expect(types[2].runtimeType.toString(), equals("IDLMethod"));
    expect(types[3].runtimeType.toString(), equals("IDLField"));
    expect(types[4].runtimeType.toString(), equals("IDLField"));
    expect(types[5].runtimeType.toString(), equals("IDLField"));
    expect(types[6].runtimeType.toString(), equals("IDLField"));
  });
}


void chromeIDLParserTypeDeclarationTests() {
  test('dictionary with no members or methods', () {
    IDLTypeDeclaration typeDeclaration = chromeIDLParser.typeDeclaration
        .parse("""// Options for the getServices function.
  dictionary GetServicesOptions {
  };
""");

    expect(typeDeclaration, isNotNull);
    expect(typeDeclaration.name, equals("GetServicesOptions"));
    expect(typeDeclaration.documentation.length, equals(1));
    expect(typeDeclaration.members, isEmpty);
    expect(typeDeclaration.methods, isEmpty);
    expect(typeDeclaration.attribute, isNull);
  });

  test('dictionary with one member', () {
    IDLTypeDeclaration typeDeclaration = chromeIDLParser.typeDeclaration
        .parse("""// Options for the getServices function.
dictionary GetServicesOptions {
  // The address of the remote device that the data should be associated
  // with. |deviceAddress| should be in the format 'XX:XX:XX:XX:XX:XX'.
  DOMString deviceAddress;
};
""");

    expect(typeDeclaration, isNotNull);
    expect(typeDeclaration.name, equals("GetServicesOptions"));
    expect(typeDeclaration.documentation.length, equals(1));
    expect(typeDeclaration.members.length, equals(1));
    expect(typeDeclaration.members[0].documentation.length, equals(2));
    expect(typeDeclaration.members[0].name, equals("deviceAddress"));
    expect(typeDeclaration.members[0].type.name, equals("DOMString"));
    expect(typeDeclaration.methods, isEmpty);
    expect(typeDeclaration.attribute, isNull);
  });

  test('dictionary with one method', () {
    IDLTypeDeclaration typeDeclaration = chromeIDLParser.typeDeclaration
        .parse("""// Options for the getServices function.
  dictionary GetServicesOptions {
    static Device getDevice();
  };
""");

    expect(typeDeclaration, isNotNull);
    expect(typeDeclaration.name, equals("GetServicesOptions"));
    expect(typeDeclaration.documentation.length, equals(1));
    expect(typeDeclaration.members, isEmpty);
    expect(typeDeclaration.methods.length, equals(1));
    expect(typeDeclaration.methods[0].documentation, isEmpty);
    expect(typeDeclaration.methods[0].name, equals("getDevice"));
    expect(typeDeclaration.methods[0].returnType.name, equals("Device"));
  });

  test('dictionary with multiple members', () {
    IDLTypeDeclaration typeDeclaration = chromeIDLParser.typeDeclaration
        .parse("""// Options for the getDevices function. If |profile| is not provided, all
// devices known to the system are returned.
  dictionary GetDevicesOptions {
    // Only devices providing |profile| will be returned.
    Profile? profile;

    // Called for each matching device.  Note that a service discovery request
    DeviceCallback deviceCallback;
  };
""");

    expect(typeDeclaration, isNotNull);
    expect(typeDeclaration.name, equals("GetDevicesOptions"));
    expect(typeDeclaration.documentation.length, equals(2));
    expect(typeDeclaration.methods, isEmpty);
    expect(typeDeclaration.members.length, equals(2));
    expect(typeDeclaration.members[0].name, equals("profile"));
    expect(typeDeclaration.members[0].type.name, equals("Profile"));
    expect(typeDeclaration.members[0].isOptional, isTrue);

    expect(typeDeclaration.members[1].name, equals("deviceCallback"));
    expect(typeDeclaration.members[1].type.name, equals("DeviceCallback"));
    expect(typeDeclaration.members[1].isOptional, isFalse);
  });

  test('dictionary with multiple methods', () {
    IDLTypeDeclaration typeDeclaration = chromeIDLParser.typeDeclaration
        .parse("""[noinline_doc] dictionary AppWindow {
    // Focus the window.
    static void focus();

    // Fullscreens the window.
    static void fullscreen();


    static boolean isFullscreen();
};
""");

    expect(typeDeclaration, isNotNull);
    expect(typeDeclaration.name, equals("AppWindow"));
    expect(typeDeclaration.attribute.attributes[0].attributeType,
        equals(IDLAttributeTypeEnum.NOINLINE_DOC));
    expect(typeDeclaration.documentation, isEmpty);
    expect(typeDeclaration.members, isEmpty);
    expect(typeDeclaration.methods.length, equals(3));
    expect(typeDeclaration.methods[0].name, equals("focus"));
    expect(typeDeclaration.methods[0].returnType.name, equals("void"));

    expect(typeDeclaration.methods[1].name, equals("fullscreen"));
    expect(typeDeclaration.methods[1].returnType.name, equals("void"));

    expect(typeDeclaration.methods[2].name, equals("isFullscreen"));
    expect(typeDeclaration.methods[2].returnType.name, equals("boolean"));
  });

  test('dictionary with attribute, members, methods', () {
    IDLTypeDeclaration typeDeclaration = chromeIDLParser.typeDeclaration
        .parse("""[noinline_doc] dictionary AppWindow {
    // Focus the window.
    static void focus();

    // Move the window to the position (|left|, |top|).
    static void moveTo(long left, long top);

    // Resize the window to |width|x|height| pixels in size.
    static void resizeTo(long width, long height);

    // Draw attention to the window.
    static void drawAttention();

    // Get the window's bounds as a \$ref:Bounds object.
    [nocompile] static Bounds getBounds();

    // Set the window's bounds.
    static void setBounds(Bounds bounds);

    // Set the app icon for the window (experimental).
    [nodoc] static void setIcon(DOMString icon_url);

    // The JavaScript 'window' object for the created child.
    [instanceOf=Window] object contentWindow;

    // Type of window to create.
    [nodoc] WindowType? type;
    // The connection is made to |profile|.
    Profile profile;
  };
""");

    expect(typeDeclaration, isNotNull);
    expect(typeDeclaration.name, equals("AppWindow"));
    expect(typeDeclaration.attribute.attributes[0].attributeType,
        equals(IDLAttributeTypeEnum.NOINLINE_DOC));
    expect(typeDeclaration.documentation, isEmpty);
    expect(typeDeclaration.members.length, equals(3));
    expect(typeDeclaration.methods.length, equals(7));
  });
}

