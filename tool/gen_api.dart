// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

import 'dart:io';

import 'package:args/args.dart';

import 'generate_dart.dart';
import 'json_parser.dart';
import 'idl_model.dart';
import 'utility.dart';
import 'web_idl_parser.dart';

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
  String libName;
  File inFile;
  File outFile;

  DartGenerator generator;
  IDLNamespace namespace;

  GenApiFile(this.inFile, this.outFile, [this.libName]) {
    print("parsing ${inFile.path}...");

    if (inFile.path.endsWith(".json")) {
      JsonParser parser = new JsonParser();
      namespace = parser.parse(inFile.readAsStringSync());
    } else if (inFile.path.endsWith(".idl")) {
      WebIdlParser webIdlParser = new WebIdlParser();

      try {
        webIdlParser.start.parse(inFile.readAsStringSync());
        // TODO: this parse will produce a model...
        namespace = new IDLNamespace();
      } catch (e) {
        // TODO: check this to allow the throw to kill generation
        print("  ${e}");
        namespace = new IDLNamespace();
      }

      // TODO:
      //print("*idl not yet supported*");
    } else {
      throw new Exception('format not understood: ${inFile.path}');
    }
  }

  void generate() {
    generator = new DartGenerator();

    generator.writeln(LICENSE);
    generator.writeln();
    generator.writeln("/* This file has been generated from ${getName(inFile)} - do not edit */");
    generator.writeln();

    if (libName != null) {
      if (namespace.description != null) {
        generator.writeDocs(namespace.description, preferSingle: true);
      }

      if (libName != null) {
        generator.writeln("library chrome.${libName};");
      } else {
        generator.writeln("library chrome.${namespace.name};");
      }
      generator.writeln();
    }

    generator.writeln("import '../src/common.dart';");
    generator.writeln();

    // final ChromeI18N i18n = new ChromeI18N._();
    generator.writeDocs("Accessor for the `chrome.${libName}` namespace.", preferSingle: true);
    generator.writeln("final ${className} ${libName} = new ${className}._();");
    generator.writeln();

    _printClass();

    outFile.directory.createSync();
    outFile.writeAsStringSync(generator.toString());
  }

  void _printClass() {
    generator.writeln("class ${className} {");
    generator.writeln("${className}._();");

    namespace.properties.forEach((p) => _printProperty(p));
    namespace.functions.forEach((f) => _printFunction(f));
    namespace.events.forEach((e) => _printEvent(e));

    generator.writeln("}");
  }

  void _printProperty(IDLProperty property) {
    generator.writeln();
    generator.writeDocs(property.description);
    generator.writeln(
        "${property.calculateReturnType()} get ${property.name} => chrome['${libName}']['${property.name}'];");
  }

  void _printFunction(IDLFunction function) {
    generator.writeln();
    generator.writeDocs(function.description);
    generator.write("${function.calculateReturnType()} ${function.name}(");
    generator.write(function.parameters.where((p) => !p.isCallback).join(', '));
    generator.writeln(") {");
    if (function.usesCallback) {
      generator.writeln("ChromeCompleter completer = new ChromeCompleter.noArgs();");
    }
    if (function.returns){
      generator.write("return ");
    }
    generator.write("chrome['${libName}'].callMethod('${function.name}'");
    if (!function.parameters.isEmpty) {
      generator.write(", [");
      generator.write(function.parameters.map((IDLParameter p) {
        if (p.isCallback) {
          return 'completer.callback';
        } else {
          return p.name;
        }
      }).join(", "));
      generator.write("]");
    }
    generator.writeln(");");
    if (function.usesCallback) {
      generator.writeln("return completer.future;");
    }
    generator.writeln("}");
  }

  void _printEvent(IDLEvent event) {
    generator.writeln();
    generator.writeDocs(event.description);
    generator.writeln("Stream get ${event.name} => null;");
  }

  String get className => "Chrome${titleCase(camelCase(libName))}";
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
