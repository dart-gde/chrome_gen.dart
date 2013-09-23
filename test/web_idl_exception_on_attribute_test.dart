
library test_web_idl_exception_on_attributes;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("exception_on_attributes", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('8. Exception On Attributes', () {
      String testCode ="""interface Dahut10 {
    attribute DOMString gr;
    attribute DOMString sr;
    attribute DOMString bothAtOnce;
    attribute DOMString multi;
    attribute DOMString grc;
    attribute DOMString src;
    attribute DOMString bothAtOnceC;
    attribute DOMString multic;
};
""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'Dahut10',
                        EMPTY,
                        [
                         EMPTY,
                         [EMPTY, EMPTY, 'attribute', ['DOMString', EMPTY], 'gr', ';'],
                         [
                          EMPTY,
                          [EMPTY, EMPTY, 'attribute', ['DOMString', EMPTY], 'sr', ';'],
                          [
                           EMPTY,
                           [
                            EMPTY,
                            EMPTY,
                            'attribute',
                            ['DOMString', EMPTY],
                            'bothAtOnce',
                            ';'
                            ],
                            [
                             EMPTY,
                             [
                              EMPTY,
                              EMPTY,
                              'attribute',
                              ['DOMString', EMPTY],
                              'multi',
                              ';'
                              ],
                              [
                               EMPTY,
                               [
                                EMPTY,
                                EMPTY,
                                'attribute',
                                ['DOMString', EMPTY],
                                'grc',
                                ';'
                                ],
                                [
                                 EMPTY,
                                 [
                                  EMPTY,
                                  EMPTY,
                                  'attribute',
                                  ['DOMString', EMPTY],
                                  'src',
                                  ';'
                                  ],
                                  [
                                   EMPTY,
                                   [
                                    EMPTY,
                                    EMPTY,
                                    'attribute',
                                    ['DOMString', EMPTY],
                                    'bothAtOnceC',
                                    ';'
                                    ],
                                    [
                                     EMPTY,
                                     [
                                      EMPTY,
                                      EMPTY,
                                      'attribute',
                                      ['DOMString', EMPTY],
                                      'multic',
                                      ';'
                                      ],
                                      EMPTY
                                      ]
                                   ]
                                 ]
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
      expect(result, equals(expected));
    });
  });
}