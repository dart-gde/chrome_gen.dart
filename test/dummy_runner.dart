library dummy_runner;

import 'dart:io';

import '../tool/json_model.dart' as json_model;
import '../tool/json_parser.dart' as json_parser;


void main() {
  File file = new File('idl/browser_action.json');
  json_model.JsonNamespace namespace =
      json_parser.parse(file.readAsStringSync());

  print(namespace);

  var result = json_model.convert(namespace);

  print(result);
}