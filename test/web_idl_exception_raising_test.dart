// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library test_web_idl_exception_raising;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("exception_raising", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('', () {
      String testCode ="""interface Dahut9 {
    void raising ();
    void raising2 ();
    void complexRaising2 ([Optional, TreastAsNull] unsigned short another);
};
""";
      List expected = [
                       EMPTY,
                       [
                        'interface',
                        'Dahut9',
                        EMPTY,
                        [
                         EMPTY,
                         [EMPTY, ['void', 'raising', EMPTY, ';']],
                         [
                          EMPTY,
                          [EMPTY, ['void', 'raising2', EMPTY, ';']],
                          [
                           EMPTY,
                           [
                            EMPTY,
                            [
                             'void',
                             'complexRaising2',
                             [
                              [
                               [
                                ['Optional', EMPTY],
                                [',', ['TreastAsNull', EMPTY], EMPTY]
                                ],
                                [[['unsigned', 'short'], EMPTY], EMPTY, 'another']
                               ],
                               EMPTY
                               ],
                               ';'
                               ]
                            ],
                            EMPTY
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