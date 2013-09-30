
import 'dart:io';

import 'package:args/args.dart';

import 'backend.dart';
import 'chrome_model.dart';
import 'json_model.dart' as json_model;
import 'json_parser.dart' as json_parser;
import 'web_idl_model.dart' as model_idl;
import 'overrides.dart';
import 'web_idl_parser.dart';
import 'src/utils.dart';

void main() {
  ArgParser parser = _createArgsParser();
  ArgResults results = parser.parse(new Options().arguments);

  if (results['help'] || results.rest.length != 1) {
    _printUsage(parser);
    return;
  }

  GenApiFile generator = new GenApiFile(
      new File(results.rest.first), new File(results['out']));
  generator.generate();
}

final String LICENSE = null;

class GenApiFile {
  File inFile;
  File outFile;
  Overrides overrides;

  GenApiFile(this.inFile, this.outFile, [this.overrides]) {
    if (overrides == null) {
      overrides = new Overrides();
    }

    if (!inFile.path.endsWith(".json") && !inFile.path.endsWith(".idl")) {
      throw new Exception('format not understood: ${inFile.path}');
    }
  }

  void generate() {
    print("parsing ${inFile.path}...");

    ChromeLibrary chromeLib;

    String fileName = getFileName(inFile);

    if (inFile.path.endsWith(".json")) {
      json_model.JsonNamespace namespace = json_parser.parse(
          inFile.readAsStringSync());
      chromeLib = json_model.convert(namespace);
    } else if (inFile.path.endsWith(".idl")) {
      WebIdlParser webIdlParser = new WebIdlParser.withCollector(
          new model_idl.IDLCollectorChrome());
      webIdlParser.start.parse(inFile.readAsStringSync());
      chromeLib = model_idl.convert(webIdlParser.collector);
    }

    outFile.directory.createSync();

    Backend backend = new Backend.createDefault(overrides);
    outFile.writeAsStringSync(
        backend.generate(chromeLib, license: LICENSE, sourceFileName: fileName));
  }

  String _parseNamespace(List tokens) {
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == 'namespace' && i + 1 < tokens.length) {
        List ns = tokens[i + 1];
        return ns.join('.');
      }
    }

    return null;
  }
}

// args handling

ArgParser _createArgsParser() {
  ArgParser parser = new ArgParser();
  parser.addFlag('help',
      abbr: 'h',
      negatable: false,
      help: 'show command help');
  parser.addOption(
      'out',
      defaultsTo: 'out',
      help: 'the output directory');
  return parser;
}

void _printUsage(ArgParser parser) {
  print('usage: dart gen_api <options> path/to/idl_or_json_file');
  print('');
  print('where <options> is one or more of:');
  print(parser.getUsage().replaceAll('\n\n', '\n'));
}
