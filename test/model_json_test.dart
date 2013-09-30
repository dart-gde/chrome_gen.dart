
library model_json_test;

import 'dart:io';

import 'package:unittest/unittest.dart';

import '../tool/json_model.dart' as json_model;
import '../tool/json_parser.dart' as json_parser;

main() {
  group('json_model', () {
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
            json_model.JsonNamespace namespace = json_parser.parse(file.readAsStringSync());
            expect(namespace.namespace, isNotNull);
          });
        }
      }
    }
  });
}
