
library test_web_idl_interface;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("interface", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('1.1 Simplest', () {
      String testCode ="""
interface Dahut1 {
};""";
      List expected = [EMPTY, ['interface', 'Dahut1', EMPTY, EMPTY, ';'], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      // expect(result, equals(expected));
      // TODO: unit test AST properly.
      expect(result, isNotNull);
      expect(result.length, greaterThan(1));
    });

    test('1.2 Inheritance', () {
      String testCode ="""interface Dahut2 : Cryptoid {
};
""";
      List expected = [EMPTY, ['interface', 'Dahut2', [':', 'Cryptoid'], EMPTY, ';'], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      // expect(result, equals(expected));
      // TODO: unit test AST properly.
      expect(result, isNotNull);
      expect(result.length, greaterThan(1));
    });

//    test('1.3 Multiple Inheritance', () {
//      String testCode ="""interface Dahut3 : Cryptoid, Mammal {
//};
//""";
//      List expected = [];
//      var result = webIdlParser.start.parse(testCode);
//      expect(result, equals(expected));
//    });

    test('1.4 Extended Attribute', () {
      String testCode ="""[Constructor]
interface Dahut4 {
};
""";
      List expected = [
                       [['Constructor', EMPTY], EMPTY],
                       ['interface', 'Dahut4', EMPTY, EMPTY, ';'],
                       EMPTY
                           ];
      var result = webIdlParser.start.parse(testCode);
      // expect(result, equals(expected));
      // TODO: unit test AST properly.
      expect(result, isNotNull);
      expect(result.length, greaterThan(1));
    });

//    test('1.5 Everything', () {
//      String testCode ="""[Constructor]
//interface Dahut5 : Cryptoid, Mammal {
//};
//""";
//      List expected = [];
//      var result = webIdlParser.start.parse(testCode);
//      expect(result, equals(expected));
//    });

    test('1.6 Partial', () {
      String testCode ="""partial interface Dahut17 {
};
""";
      List expected = [EMPTY, ['partial', ['interface', 'Dahut17', EMPTY, ';']], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      // expect(result, equals(expected));
      // TODO: unit test AST properly.
      expect(result, isNotNull);
      expect(result.length, greaterThan(1));
    });
  });
}