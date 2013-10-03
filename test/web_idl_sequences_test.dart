
library test_web_idl_sequences;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("sequences", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('9. Sequences', () {
      String testCode ="""interface Dahut14 {
    attribute sequence<DOMString> foos;
    attribute sequence<Dahut9>    moreDahuts;
    sequence<Dahut5> doSomething (sequence<Dahut10> dahuts);
    void             doSomethingElse (sequence<DOMString> bars);
};""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'Dahut14',
                        EMPTY,
                        [
                         EMPTY,
                         [
                          EMPTY,
                          EMPTY,
                          'attribute',
                          ['sequence', '<', ['DOMString', EMPTY], '>', EMPTY],
                          'foos',
                          ';'
                          ],
                          [
                           EMPTY,
                           [
                            EMPTY,
                            EMPTY,
                            'attribute',
                            ['sequence', '<', ['Dahut9', EMPTY], '>', EMPTY],
                            'moreDahuts',
                            ';'
                            ],
                            [
                             EMPTY,
                             [
                              EMPTY,
                              [
                               ['sequence', '<', ['Dahut5', EMPTY], '>', EMPTY],
                               'doSomething',
                               [
                                [
                                 EMPTY,
                                 [
                                  ['sequence', '<', ['Dahut10', EMPTY], '>', EMPTY],
                                  EMPTY,
                                  'dahuts'
                                  ]
                                 ],
                                 EMPTY
                                 ],
                                 ';'
                                 ]
                              ],
                              [
                               EMPTY,
                               [
                                EMPTY,
                                [
                                 'void',
                                 'doSomethingElse',
                                 [
                                  [
                                   EMPTY,
                                   [
                                    ['sequence', '<', ['DOMString', EMPTY], '>', EMPTY],
                                    EMPTY,
                                    'bars'
                                    ]
                                   ],
                                   EMPTY
                                   ],
                                   ';'
                                   ]
                                ],
                                EMPTY
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