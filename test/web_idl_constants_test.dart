// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
      expect(result, equals(expected));
    });
  });
}