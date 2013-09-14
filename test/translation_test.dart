
library translation_test;

import 'package:unittest/unittest.dart';

import '../tool/idl_model.dart';
import '../tool/translation.dart';

main() {
  group('translation.dart', () {
    IDLNamespace namespace;
    TranslationContext ctx;

    setUp(() {
      namespace = new IDLNamespace();
      namespace.name = 'foo.bar';

      ctx = new TranslationContext();
    });

    test('getJSContext', () {
      expect(ctx.getJSContext(namespace), "chrome['foo']['bar']");
    });

    test('getLibraryName', () {
      expect(ctx.getLibraryName(namespace), 'foo_bar');
    });

    test('getClassName', () {
      expect(ctx.getClassName(namespace), 'ChromeFooBar');
    });
  });
}
