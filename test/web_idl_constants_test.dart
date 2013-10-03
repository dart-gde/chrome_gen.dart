
library test_web_idl_constants;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("constants", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('2. Constants', () {
      String testCode ="""interface Dahut6 {
    const unsigned short LEVROGYROUS = 0;
    const float          DEXTROGYROUS = 1.6;
    const boolean        SHOUT = true;
};""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'Dahut6',
                        EMPTY,
                        [
                         EMPTY,
                         ['const', [['unsigned', 'short'], EMPTY], 'LEVROGYROUS', '=', 0, ';'],
                         [
                          EMPTY,
                          ['const', ['float', EMPTY], 'DEXTROGYROUS', '=', 1.6, ';'],
                          [
                           EMPTY,
                           ['const', ['boolean', EMPTY], 'SHOUT', '=', 'true', ';'],
                           EMPTY
                           ]
                          ]
                         ],
                         ';'
                         ],
                         EMPTY
                         ];
      var result = webIdlParser.start.parse(testCode);
      // expect(result, equals(expected));
      // TODO: unit test AST properly.
      expect(result, isNotNull);
      expect(result.length, greaterThan(1));
    });
  });
}