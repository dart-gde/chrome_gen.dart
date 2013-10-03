
library test_web_idl_attributes;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("attributes", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('3. Attributes', () {
      String testCode ="""interface Dahut7 {
             attribute DOMString      foo;
    readonly attribute DOMString      bar;
             attribute unsigned short xxx;
    readonly attribute unsigned short yyy;
    [Ook, Oook]
    readonly attribute unsigned short ook;
};""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'Dahut7',
                        EMPTY,
                        [
                         EMPTY,
                         [EMPTY, EMPTY, 'attribute', ['DOMString', EMPTY], 'foo', ';'],
                         [
                          EMPTY,
                          [EMPTY, 'readonly', 'attribute', ['DOMString', EMPTY], 'bar', ';'],
                          [
                           EMPTY,
                           [
                            EMPTY,
                            EMPTY,
                            'attribute',
                            [['unsigned', 'short'], EMPTY],
                            'xxx',
                            ';'
                            ],
                            [
                             EMPTY,
                             [
                              EMPTY,
                              'readonly',
                              'attribute',
                              [['unsigned', 'short'], EMPTY],
                              'yyy',
                              ';'
                              ],
                              [
                               [['Ook', EMPTY], [',', ['Oook', EMPTY], EMPTY]],
                               [
                                EMPTY,
                                'readonly',
                                'attribute',
                                [['unsigned', 'short'], EMPTY],
                                'ook',
                                ';'
                                ],
                                EMPTY
                                ]
                             ]
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