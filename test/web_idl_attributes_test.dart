// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
      expect(result, equals(expected));
    });
  });
}