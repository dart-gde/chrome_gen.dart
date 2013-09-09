
import 'dart:io';
import 'dart:convert';

import 'package:args/args.dart';

import 'src/generate_dart.dart';
import 'src/utility.dart';

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

  Generator generator;
  String libraryComments;
  List<IDLFunction> functions = [];
  List<IDLEvent> events = [];

  GenApiFile(this.inFile, this.outFile, [this.libName]) {
    print("parsing ${inFile.path}...");

    if (inFile.path.endsWith(".json")) {
      // pre-filter to remove line comments -
      List<String> lines = new LineSplitter().convert(inFile.readAsStringSync());
      Iterable newLines = lines.map((String line) {
        int index = line.indexOf('// ');
        return index == -1 ? line : line.substring(0, line.indexOf('// '));
      });

      _parseJson(JSON.decode(newLines.join('\n')));
    } else if (inFile.path.endsWith(".idl")) {
      // TODO:
      print("*idl not yet supported*");
    } else {
      throw new Exception('format not understood: ${inFile.path}');
    }
  }

  void generate() {
    generator = new Generator();

    generator.writeln(LICENSE);
    generator.writeln();

    if (libName != null) {
      if (libraryComments != null) {
        generator.writeDocs(libraryComments, preferSingle: true);
      }

      generator.writeln("library chrome_${libName};");
      generator.writeln();
    }

    if (!events.isEmpty) {
      generator.writeln("import 'dart:async';");
      generator.writeln();
    }

    // final ChromeI18N i18n = new ChromeI18N._();
    generator.writeln("final ${className} ${libName} = new ${className}._();");
    generator.writeln();

    _printClass();

    outFile.directory.createSync();
    outFile.writeAsStringSync(generator.toString());
  }

  void _printClass() {
    generator.writeln("class ${className} {");
    generator.writeln("${className}._();");

    functions.forEach((e) => _printFunction(e));

    events.forEach((e) => _printEvent(e));

    generator.writeln("}");
  }

  void _printFunction(IDLFunction function) {
    generator.writeln();
    generator.writeDocs(function.description);
    generator.write("${function.returnType.dartName} ${function.name}(");
    generator.write(function.parameters.join(', '));
    generator.writeln(") {");
    generator.writeln();
    generator.writeln("}");
  }

  void _printEvent(IDLEvent event) {
    generator.writeln();
    generator.writeDocs(event.description);
    generator.writeln("Stream get ${event.name} => null;");
  }

  String get className => "Chrome${titleCase(camelCase(libName))}";

  void _parseJson(dynamic json) {
    Map m = json[0];

    if (libName == null) {
      libName = m['namespace'];
    }

    if (m.containsKey('description')) {
      libraryComments = convertHtmlToDartdoc(m['description']);
    }

    if (m.containsKey('functions')) {
      for (var f in m['functions']) {
        IDLFunction function = new IDLFunction(f['name'],
            convertHtmlToDartdoc(f['description']));

        if (f.containsKey('parameters')) {
          for (var p in f['parameters']) {
            IDLParameter param = new IDLParameter(p['name']);

            if (p.containsKey('type')) {
              param.type = new IDLType(p['type']);
            }

            if (p.containsKey('optional')) {
              // Look for "true", and "false", as well as boolean
              if (p['optional'] is bool) {
                param.optional = p['optional'];
              } else {
                param.optional = "true" == p['optional'];
              }
            }

            param.description = convertHtmlToDartdoc(p['description']);

            function.parameters.add(param);
          }
        }

        if (f.containsKey('returns')) {
          var r = f['returns'];

          function.returnType = new IDLType(r['type']);
        } else {
          function.returnType = IDLType.VOID;
        }

        functions.add(function);
      }
    }

    // TODO: types

    // TODO: events
    if (m.containsKey('events')) {
      for (var e in m['events']) {
        IDLEvent event = new IDLEvent(e['name']);
        event.description = convertHtmlToDartdoc(e['description']);
        events.add(event);
      }
    }
  }
}

class IDLFunction {
  String name;
  String _description;
  List<IDLParameter> parameters = [];
  IDLType returnType;

  IDLFunction(this.name, this._description);

  String get description {
    if (_description == null) {
      return _description;
    }

    StringBuffer buf = new StringBuffer(_description);
    buf.write('\n');

    parameters.forEach((p) {
      if (p.description != null) {
        buf.write('\n');
        buf.write("[${p.name}] ${p.description}\n");
      }
    });

    return buf.toString();
  }
}

class IDLEvent {
  String name;
  String description;

  IDLEvent(this.name);
}

class IDLParameter {
  String name;
  IDLType type = IDLType.VAR;
  String description;
  bool optional;

  IDLParameter(this.name);

  String toString() => "${type.dartName} ${name}";
}

class IDLType {
  static IDLType VOID = new IDLType.fromDartName('void');
  static IDLType VAR = new IDLType.fromDartName('var');

  String dartName;

  IDLType(String idlTypeName) {
    dartName = _calcDartName(idlTypeName);
  }

  IDLType.fromDartName(this.dartName);

  String _calcDartName(String idlTypeName) {
    if (idlTypeName == 'string') {
      return 'String';
    }

    if (idlTypeName == 'integer') {
      return 'int';
    }

    if (idlTypeName == 'boolean') {
      return 'bool';
    }

    return 'dynamic';
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
