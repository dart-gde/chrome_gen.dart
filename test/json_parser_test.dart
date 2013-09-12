
library json_parser_test;

import 'package:unittest/unittest.dart';

import '../tool/idl_model.dart';
import '../tool/json_parser.dart';

main() {
  group('json_parser', () {
    JsonParser parser;

    setUp(() {
      parser = new JsonParser();
    });

    test('simpleParse', () {
      IDLNamespace namespace = parser.parse("""
[
  {
    "namespace": "contextMenus",
    "description": "Use the and pages."
  }
]
""");

      expect(namespace.name, "contextMenus");
      expect(namespace.description, "Use the and pages.");
    });

    test('stripComments', () {
      IDLNamespace namespace = parser.parse('// line comment here!\n[{\n'
          '"namespace": "contextMenus",\n'
          '"description": "some docs"}]');

      expect(namespace.name, "contextMenus");
      expect(namespace.description, "some docs");
    });

  });
}
