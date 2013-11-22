
library model_json_test;

import 'dart:io';

import 'package:unittest/unittest.dart';

import '../tool/json_model.dart' as json_model;
import '../tool/json_parser.dart' as json_parser;

void main() {
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
        if (!file.path.contains('/_') && !file.path.contains('test_presubmit')) {
          test(file.path, () {
            json_model.JsonNamespace namespace = json_parser.parse(file.readAsStringSync());
            expect(namespace.namespace, isNotNull);
          });
        }
      }
    }
  });

  group("json model parameters", () {
    test("parse browser_action.json", () {
      File file = new File('idl/browser_action.json');
      json_model.JsonNamespace namespace =
          json_parser.parse(file.readAsStringSync());
      expect(namespace.namespace, isNotNull);
      expect(namespace.functions.any((e) => e.name == "setTitle"), isTrue);
      json_model.JsonFunction function =
          namespace.functions.singleWhere((e) => e.name == "setTitle");
      expect(function.parameters.length, 1);
      json_model.JsonParamType parameter = function.parameters[0];
      expect(parameter, isNotNull);
      expect(parameter.type, "object");
      expect(parameter.properties.length, 2);
      json_model.JsonProperty titleProperty =
          parameter.properties.singleWhere((e) => e.name == "title");
      expect(titleProperty, isNotNull);
      expect(titleProperty.type.type, equals("string"));
      json_model.JsonProperty tabIdProperty =
          parameter.properties.singleWhere((e) => e.name == "tabId");
      expect(tabIdProperty, isNotNull);
      expect(tabIdProperty.type.type, equals("integer"));
      expect(tabIdProperty.type.optional, true);
    });
  });
}
