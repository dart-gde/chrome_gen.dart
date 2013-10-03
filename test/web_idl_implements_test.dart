
library test_web_idl_implements;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("implements", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('11. Implements', () {
      String testCode ="""Foo implements Dahut5;""";
      List expected = [EMPTY, ['Foo', 'implements', 'Dahut5', ';'], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      // expect(result, equals(expected));
      // TODO: unit test AST properly.
      expect(result, isNotNull);
      expect(result.length, greaterThan(1));
    });
  });
}