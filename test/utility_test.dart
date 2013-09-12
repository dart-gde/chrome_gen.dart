
library utility_test;

import 'package:unittest/unittest.dart';

import '../tool/utility.dart';

main() {
  group('utility.dart', () {
    test('camelCase', () {
      expect(camelCase('foo_bar'), 'fooBar');
    });

    test('titleCase', () {
      expect(titleCase('foo'), 'Foo');
    });

    test('convertHtmlToDartdoc', () {
      expect(
          convertHtmlToDartdoc("Use the <code>chrome.contextMenus</code> API to <em>add</em> items to <a href='index.html'>index html</a>"),
          "Use the `chrome.contextMenus` API to _add_ items to [index html](index.html)");
    });
  });
}
