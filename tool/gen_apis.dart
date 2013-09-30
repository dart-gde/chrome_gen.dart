
library gen_apis;

import 'dart:io';
import 'dart:convert';

import 'gen_api.dart';
import 'overrides.dart';
import 'src/src_gen.dart';
import 'src/utils.dart';

// TODO: parse _api_features.json and add permissions info to the dartdoc for
// the libraries

void main() {
  DateTime startTime = new DateTime.now();

  new GenApis().generate();

  Duration elapsed = new DateTime.now().difference(startTime);
  print("generated in ${elapsed.inMilliseconds}ms.");
}

class GenApis {
  Directory outDir;
  Directory idlDir;
  File apisFile;
  File overridesFile;

  GenApis() {
    _init();
  }

  void generate() {
    print("reading ${apisFile.path}...");

    var apisInfo = JSON.decode(apisFile.readAsStringSync());

    _generateApi('app', apisInfo['packaged_app'], includeAppSrc: true);
    _generateApi('ext', apisInfo['extension'], alreadyWritten: apisInfo['packaged_app']);
  }

  void _init() {
    print(Directory.current);

    outDir = new Directory('lib');
    apisFile = new File('meta/apis.json');
    overridesFile = new File('meta/overrides.json');
    idlDir = new Directory('idl');

    if (!idlDir.existsSync()) {
      throw new Exception('${idlDir.path} not found');
    }
  }

  void _generateApi(String name, List<String> libraryNames,
                    {List<String> alreadyWritten, bool includeAppSrc: false}) {
    File libFile = new File("${outDir.path}/chrome_${name}.dart");

    DartGenerator generator = new DartGenerator();

    if (LICENSE != null) {
      generator.writeln(LICENSE);
      generator.writeln();
    }
    generator.writeln("/* This file has been generated - do not edit */");
    generator.writeln();

    generator.writeDocs(
        'A library to expose the Chrome ${name} APIs.',
        preferSingle: true);
    generator.writeln("library chrome_${name};");
    generator.writeln();

    for (String libName in libraryNames) {
      generator.writeln(
          "export 'gen/${convertJSLibNameToFileName(libName)}.dart';");
    }

    generator.writeln("export 'src/common_exp.dart';");

    if (includeAppSrc) {
      generator.writeln("export 'src/files.dart';");
      generator.writeln("export 'src/socket.dart';");
    }

    libFile.writeAsStringSync(generator.toString());
    print('wrote ${libFile.path}');

    if (alreadyWritten != null) {
      libraryNames.removeWhere((e) => alreadyWritten.contains(e));
    }

    Overrides overrides = new Overrides.fromFile(overridesFile);

    for (String libName in libraryNames) {
      _generateFile(overrides, libName);
    }
  }

  void _generateFile(Overrides overrides, String jsLibName) {
    String fileName = convertJSLibNameToFileName(jsLibName);
    String locateName = fileName.replaceFirst("devtools_", "devtools/");

    File jsonFile = new File("${idlDir.path}/${locateName}.json");
    File idlFile = new File("${idlDir.path}/${locateName}.idl");

    File outFile = new File("${outDir.path}/gen/${fileName}.dart");

    if (jsonFile.existsSync()) {
      GenApiFile apiGen = new GenApiFile(jsonFile, outFile, overrides);
      apiGen.generate();
    } else if (idlFile.existsSync()) {
      GenApiFile apiGen = new GenApiFile(idlFile, outFile, overrides);
      apiGen.generate();
    } else {
      print("Unable to locate idl or json file for '${jsLibName}'.");
      exit(1);
    }
  }
}
