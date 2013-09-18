
library model_json_test;

import 'dart:io';

import 'package:unittest/unittest.dart';

import '../tool/model_json.dart' as model_json;

main() {
  group('model_json', () {
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
            model_json.JsonNamespace namespace = model_json.parse(file.readAsStringSync());
            expect(namespace.namespace, isNotNull);
          });
        }
      }
    }
  });
}
