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

void main() {
  group('ChromeIDLParser.docString.parse', chromeIDLParserDocStringTests);
  group('ChromeIDLParser.attributeDeclaration.parse',
      chromeIDLParserAttributeDeclarationTests);
}