// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library test_web_idl_arrays;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("arrays", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('', () {
      String testCode ="""interface ArrayStuff {
    attribute unsigned long[] viciousness;
    void            arrayMe (ArrayThing[] foo);
    unsigned long[] arrayRet ();
    void            extendedArray (unsigned long[] foo);
};""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'ArrayStuff',
                        EMPTY,
                        [
                         EMPTY,
                         [
                          EMPTY,
                          EMPTY,
                          'attribute',
                          [['unsigned', ['long', EMPTY]], ['[', ']', EMPTY]],
                          'viciousness',
                          ';'
                          ],
                          [
                           EMPTY,
                           [
                            EMPTY,
                            [
                             'void',
                             'arrayMe',
                             [
                              [EMPTY, [['ArrayThing', ['[', ']', EMPTY]], EMPTY, 'foo']],
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
                               [['unsigned', ['long', EMPTY]], ['[', ']', EMPTY]],
                               'arrayRet',
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
                                 'extendedArray',
                                 [
                                  [
                                   EMPTY,
                                   [
                                    [['unsigned', ['long', EMPTY]], ['[', ']', EMPTY]],
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