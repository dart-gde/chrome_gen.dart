
library test_web_idl_nullable;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("nullable", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('13. Nullable', () {
      String testCode ="""interface NullableStuff {
    const boolean? ARE_WE_THERE_YET = false;
    attribute unsigned long? viciousness;
    void           nullMe (MaybeNull? foo);
    unsigned long? nullRet ();
    void           extendedNull (unsigned long? foo);
};""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'NullableStuff',
                        EMPTY,
                        [
                         EMPTY,
                         ['const', ['boolean', '?'], 'ARE_WE_THERE_YET', '=', 'false', ';'],
                         [
                          EMPTY,
                          [
                           EMPTY,
                           EMPTY,
                           'attribute',
                           [['unsigned', ['long', EMPTY]], ['?', EMPTY]],
                           'viciousness',
                           ';'
                           ],
                           [
                            EMPTY,
                            [
                             EMPTY,
                             [
                              'void',
                              'nullMe',
                              [
                               [EMPTY, [['MaybeNull', ['?', EMPTY]], EMPTY, 'foo']],
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
                                [['unsigned', ['long', EMPTY]], ['?', EMPTY]],
                                'nullRet',
                                EMPTY,
                                ';'
                                ]
                               ],
                               [
                                EMPTY,
                                [
                                 EMPTY,
                                 [
                                  'void',
                                  'extendedNull',
                                  [
                                   [
                                    EMPTY,
                                    [
                                     [['unsigned', ['long', EMPTY]], ['?', EMPTY]],
                                     EMPTY,
                                     'foo'
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