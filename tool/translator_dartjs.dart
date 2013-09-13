// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library translator_dartjs;

import 'generate_dart.dart';
import 'idl_model.dart';
import 'translation.dart';
import 'utils.dart';

/**
 * A [Translator] which generates code which uses the dart:js library.
 */
class DartJSTranslator extends Translator {
  DartGenerator generator;
  IDLNamespace namespace;

  DartJSTranslator(TranslationContext ctx): super(ctx);

  String translate(IDLNamespace namespace, {String license, String sourceFilePath}) {
    this.namespace = namespace;

    generator = new DartGenerator();

    if (license != null) {
      generator.writeln(license);
      generator.writeln();
    }

    if (sourceFilePath != null) {
      generator.writeln("/* This file has been generated from ${sourceFilePath} - do not edit */");
    } else {
      generator.writeln("/* This file has been generated - do not edit */");
    }
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

    return generator.toString();
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

  String get libName => ctx.getLibraryName(namespace);

  String get className => ctx.getClassName(namespace);

}
