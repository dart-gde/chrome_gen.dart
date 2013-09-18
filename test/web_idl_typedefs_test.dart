// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library test_web_idl_typedefs;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("typedefs", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('10. Typedefs', () {
      String testCode ="""typedef sequence<Dahut10> DaaahuuutList;""";
      List expected = [
                       EMPTY,
                       [
                        'typedef',
                        EMPTY,
                        ['sequence', '<', ['Dahut10', EMPTY], '>', EMPTY],
                        'DaaahuuutList',
                        ';'
                        ],
                        EMPTY
                        ];
      var result = webIdlParser.start.parse(testCode);
      expect(result, equals(expected));
    });
  });
}