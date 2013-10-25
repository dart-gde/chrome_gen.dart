library chrome_idl_test;

import 'package:unittest/unittest.dart';

import '../tool/chrome_idl_parser.dart';

void chromeIDLParserDocStringTests() {
  test('Parse comment with **', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("/** Some comment */");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment "));
  });

  test('Parse comment with *', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("/* Some comment */");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment "));
  });

  test('Parse comment with //', () {
    ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
    var doc = chromeIDLParser.docString.parse("// Some comment\n");
    expect(doc.runtimeType.toString(), equals("List"));
    expect(doc.length, equals(1));
    expect(doc[0], equals(" Some comment"));
  });
}

void main() {
  group('ChromeIDLParser.docString', chromeIDLParserDocStringTests);
}