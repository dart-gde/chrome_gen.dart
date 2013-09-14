// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:io';

import 'package:args/args.dart';

import 'json_parser.dart';
import 'idl_model.dart';
import 'translation.dart';
import 'translator_dartjs.dart';
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
  TranslationContext context;

  GenApiFile(this.inFile, this.outFile, [this.context]) {
    if (context == null) {
      context = new TranslationContext();
    }

    if (!inFile.path.endsWith(".json") && !inFile.path.endsWith(".idl")) {
      throw new Exception('format not understood: ${inFile.path}');
    }
  }

  void generate() {
    print("parsing ${inFile.path}...");

    IDLNamespace namespace;

    if (inFile.path.endsWith(".json")) {
      JsonParser parser = new JsonParser();
      namespace = parser.parse(inFile.readAsStringSync());
    } else if (inFile.path.endsWith(".idl")) {
      WebIdlParser webIdlParser = new WebIdlParser();

      String fileName = getFileName(inFile);

      namespace = new IDLNamespace();
      namespace.name = fileName.substring(0, fileName.indexOf('.'));
      namespace.name = namespace.name.replaceAll('_', '.');
      try {
        webIdlParser.start.parse(inFile.readAsStringSync());
        // TODO: this parse will produce a model...

      } catch (e) {
        // TODO: change this to allow the throw to kill generation
        print("  ${e}");
      }
    }

    outFile.directory.createSync();

    Translator translator = new DartJSTranslator(context);
    outFile.writeAsStringSync(
        translator.translate(namespace, license: LICENSE, sourceFilePath: getFileName(inFile)));
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
