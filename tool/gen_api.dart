// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:io';

import 'package:args/args.dart';

import 'backend.dart';
import 'model_chrome.dart';
import 'model_json.dart' as model_json;
import 'model_idl.dart' as model_idl;
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

final String LICENSE =
"// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.\n"
"// Use of this source code is governed by a BSD-style license that can be found\n"
"// in the LICENSE file.";

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
      model_json.JsonNamespace namespace = model_json.parse(
          inFile.readAsStringSync());
      chromeLib = new model_json.JsonConverter().convert(namespace);
    } else if (inFile.path.endsWith(".idl")) {
      WebIdlParser webIdlParser = new WebIdlParser();

//      chromeLib = new ChromeLibrary();
//      chromeLib.name = fileName.substring(0, fileName.indexOf('.'));
//      chromeLib.name = chromeLib.name.replaceAll('_', '.');
//      List tokens = webIdlParser.start.parse(inFile.readAsStringSync());
//      if (_parseNamespace(tokens) != null) {
//        chromeLib.name = _parseNamespace(tokens);
//      }

      try {
        webIdlParser.start.parse(inFile.readAsStringSync());
        chromeLib = model_idl.convert(webIdlParser.collector);
      } catch (e) {
        // TODO:
        print(e);
      }

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
