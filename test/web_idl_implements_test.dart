// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library test_web_idl_implements;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("implements", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('11. Implements', () {
      String testCode ="""Foo implements Dahut5;""";
      List expected = [EMPTY, ['Foo', 'implements', 'Dahut5', ';'], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      expect(result, equals(expected));
    });
  });
}