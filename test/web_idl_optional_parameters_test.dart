
library test_web_idl_optional_parameters;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("optional_parameters", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('14. Optional parameters', () {
      String testCode ="""interface OptionalStuff {
    void oneOpt (optional MaybeNot foo);
    void twoOpt (Yes yes, optional MaybeNot foo, optional MaybeNot bar);
    void restOpt (Yes yes, optional MaybeNot foo, optional SilentlyOpt bar);
    void extendedOptional (optional unsigned long? foo);
};""";
      List expected =
                       [
                        EMPTY,
                        [
                         'interface',
                         'OptionalStuff',
                         EMPTY,
                         [
                          EMPTY,
                          [
                           EMPTY,
                           [
                            'void',
                            'oneOpt',
                            [
                             [EMPTY, ['optional', ['MaybeNot', EMPTY], 'foo', EMPTY]],
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
                              'twoOpt',
                              [
                               [EMPTY, [['Yes', EMPTY], EMPTY, 'yes']],
                               [
                                ',',
                                [EMPTY, ['optional', ['MaybeNot', EMPTY], 'foo', EMPTY]],
                                [
                                 ',',
                                 [EMPTY, ['optional', ['MaybeNot', EMPTY], 'bar', EMPTY]],
                                 EMPTY
                                 ]
                                ]
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
                                'restOpt',
                                [
                                 [EMPTY, [['Yes', EMPTY], EMPTY, 'yes']],
                                 [
                                  ',',
                                  [EMPTY, ['optional', ['MaybeNot', EMPTY], 'foo', EMPTY]],
                                  [
                                   ',',
                                   [
                                    EMPTY,
                                    ['optional', ['SilentlyOpt', EMPTY], 'bar', EMPTY]
                                    ],
                                    EMPTY
                                    ]
                                  ]
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
                                  'extendedOptional',
                                  [
                                   [
                                    EMPTY,
                                    [
                                     'optional',
                                     [['unsigned', ['long', EMPTY]], ['?', EMPTY]],
                                     'foo',
                                     EMPTY
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