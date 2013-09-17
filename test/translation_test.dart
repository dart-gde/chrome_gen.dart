// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library translation_test;

import 'package:unittest/unittest.dart';

import '../tool/model_idl.dart';
import '../tool/translation.dart';

main() {
  group('translation.dart', () {
    IDLNamespace namespace1;
    IDLNamespace namespace2;
    TranslationContext ctx;

    setUp(() {
      namespace1 = new IDLNamespace();
      namespace1.name = 'system.cpu';

      namespace2 = new IDLNamespace();
      namespace2.name = 'fontSettings';

      ctx = new TranslationContext();
    });

    test('getJSContext', () {
      expect(ctx.getContextReference(namespace1), "_system_cpu");
      expect(ctx.getContextReference(namespace2), "_fontSettings");
    });

    test('getLibraryName', () {
      expect(ctx.getLibraryName(namespace1), 'system_cpu');
      expect(ctx.getLibraryName(namespace2), 'fontSettings');
    });

    test('getClassName', () {
      expect(ctx.getClassName(namespace1), 'ChromeSystemCpu');
      expect(ctx.getClassName(namespace2), 'ChromeFontSettings');
    });
  });
}
