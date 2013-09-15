
library parser_json_test;

import 'dart:io';

import 'package:unittest/unittest.dart';

import '../tool/model_idl.dart';
import '../tool/parser_json.dart';

main() {
  group('json_parser', () {
    JsonParser parser;

    setUp(() {
      parser = new JsonParser();
    });

    test('simpleParse', () {
      IDLNamespace namespace = parser.parse("""[
  {
    "namespace": "contextMenus",
    "description": "Use the and pages."
  }
]""");

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

    // Define a test for each .json file in idl/
    File testFile = new File('idl/runtime.json');

    // The unittest script likes to be run with the cwd set to the project root.
    if (testFile.existsSync()) {
      Iterable<File> jsonFiles = new Directory('idl')
          .listSync(recursive: true, followLinks: false)
          .where((f) => f.path.endsWith('.json'));

      for (File file in jsonFiles) {
        // skip _api_features.json, _manifest_features.json, _permission_features.json
        if (!file.path.contains('/_')) {
          test(file.path, () {
            IDLNamespace namespace = parser.parse(file.readAsStringSync());
            expect(namespace.name, isNotNull);
          });
        }
      }
    }
  });
}
