
library model_idl_test;

import 'dart:io';

import 'package:unittest/unittest.dart';

import '../tool/web_idl_parser.dart';
import '../tool/model_idl.dart' as model_idl;

void modelIdlParseTests() {
  // Define a test for each .json file in idl/
  File testFile = new File('idl/alarms.idl');

  // The unittest script likes to be run with the cwd set to the project root.
  if (testFile.existsSync()) {
    Iterable<File> idlFiles = new Directory('idl')
    .listSync(recursive: true, followLinks: false)
      .where((f) => f.path.endsWith('.idl'));

    for (File file in idlFiles) {
      // skip _api_features.json, _manifest_features.json, _permission_features.json
      if (!file.path.contains('/_')) {
        test(file.path, () {
          WebIdlParser webIdlParser =
              new WebIdlParser.withCollector(new model_idl.IDLCollectorChrome());
          webIdlParser.start.parse(file.readAsStringSync());
          expect(webIdlParser.collector.idlNamespace.name, isNotNull);
        });
      }
    }
  }
}

void main() {
  group('model_idl.IDLCollectorChrome parse', modelIdlParseTests);
}