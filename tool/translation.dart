// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library translation;

import 'model_idl.dart';
import 'src/src_gen.dart';
import 'src/utils.dart';

final Map _TYPE_NAME_MAP = {
  "string": "String",
  "integer": "int",
  "boolean": "bool"
};

/**
 * An aide to translating from IDL entites and references to Dart specific ones.
 */
class TranslationContext {
  Map overrides = {};

  TranslationContext();

  TranslationContext.fromOverrides(this.overrides);

  bool isAutoTransformType(IDLType type) {
    return type.name == 'integer' || type.name == 'boolean' || type.name == 'string';
  }

  String getContextReference(IDLNamespace namespace) {
    return "_${namespace.name.replaceAll('.', '_')}";
  }

  String getReturnType(IDLType type) {
    if (type == null) {
      return 'void';
    }

    if (_TYPE_NAME_MAP.containsKey(type.name)) {
      return _TYPE_NAME_MAP[type.name];
    }

    // TODO: function
    // TODO: object
    // TODO: array

    // TODO: or JsObject?
    return 'dynamic';
  }

  String getParamType(IDLType type) {
    if (_TYPE_NAME_MAP.containsKey(type.name)) {
      return _TYPE_NAME_MAP[type.name];
    }

    // TODO: function
    // TODO: object
    // TODO: array

    // TODO: or JsObject?
    return 'var';
  }

  /**
   * Returns something suitable for use as a Dart library name. Generally,
   * something like 'system_storage'.
   */
  String getLibraryName(IDLNamespace namespace) {
    return namespace.name.replaceAll('.', '_');
  }

  /**
   * Returns a class name like 'ChromeFooBar'.
   */
  String getClassName(IDLNamespace namespace) {
    if (overrides.containsKey('classNames')) {
      Map names = overrides['classNames'];

      if (names.containsKey(namespace.name)) {
        return "Chrome${names[namespace.name]}";
      }
    }

    return "Chrome${titleCase(toCamelCase(namespace.name))}";
  }
}

/**
 * An abstract superclass for anything that wants to translate from an IDL model
 * into source code.
 */
abstract class Translator {
  TranslationContext ctx;

  Translator(this.ctx);

  String translate(IDLNamespace namespace, {String license, String sourceFilePath});
}

/**
 * A [Translator] to create Dart code. The generated source accesses the
 * referenced IDL APIs using the dart:js library.
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
      generator.writeln("/* This is a generated file - do not edit */");
    }
    generator.writeln();

    if (namespace.description != null) {
      generator.writeDocs(namespace.description, preferSingle: true);
    }

    generator.writeln("library chrome.${libName};");
    generator.writeln();

    generator.writeln("import '../src/common.dart';");
    generator.writeln();

    // final ChromeI18N i18n = new ChromeI18N._();
    generator.writeDocs("Accessor for the `chrome.${namespace.name}` namespace.", preferSingle: true);
    generator.writeln("final ${className} ${libName} = new ${className}._();");
    generator.writeln();

    _printClass();

    return generator.toString();
  }

  void _printClass() {
    generator.writeln("class ${className} {");
    generator.writeln("JsObject ${ctx.getContextReference(namespace)};");
    generator.writeln();
    generator.writeln("${className}._() {");

    List sections = namespace.name.split('.');
    generator.writeln("${ctx.getContextReference(namespace)} = "
        "context['chrome']['${sections.join('\'][\'')}'];");
    generator.writeln("}");

    namespace.properties.forEach((p) => _printProperty(p));
    namespace.functions.forEach((f) => _printFunction(f));
    namespace.events.forEach((e) => _printEvent(e));

    generator.writeln("}");
  }

  void _printProperty(IDLProperty property) {
    generator.writeln();
    generator.writeDocs(property.description);
    generator.write("${ctx.getReturnType(property.returnType)} ");
    generator.write("get ${property.name} => ");
    generator.writeln("${ctx.getContextReference(namespace)}['${property.name}'];");
  }

  void _printFunction(IDLFunction function) {
    generator.writeln();
    generator.writeDocs(function.description);
    generator.write("${calculateReturnType(function)} ${function.name}(");
    generator.write(function.parameters.where((p) => !p.isCallback).
        map((p) => "${ctx.getParamType(p.type)} ${p.name}").join(', '));
    generator.writeln(") {");
    if (function.usesCallback) {
      generator.write("ChromeCompleter completer = new ChromeCompleter.");
      IDLParameter callback = function.callbackParamType;
      if (callback.params.length == 0) {
        generator.writeln("noArgs();");
      } else if (callback.params.length == 1) {
        IDLType type = callback.params.first.type;

        if (ctx.isAutoTransformType(type)) {
          generator.writeln("oneArg();");
        } else {
          generator.writeln("oneArg((arg) {");
          // TODO:
          generator.writeln("return arg;");
          generator.writeln("});");
        }
      } else if (callback.params.length == 2) {
        generator.writeln("twoArgs((arg1, arg2) {");
        // TODO:
        generator.writeln("return null;");
        generator.writeln("});");
      } else {
        throw new StateError('unsupported number of params(${callback.params.length})');
      }
    }
    if (function.returns){
      generator.write("return ");
    }
    generator.write("${ctx.getContextReference(namespace)}.callMethod('${function.name}'");
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
    generator.writeln("Stream get ${event.name} => _${event.name}.stream;");

    // TODO: we need to type the stream controller
    generator.writeln();
    generator.writeln("final ChromeStreamController _${event.name} = null;");
  }

  String get libName => ctx.getLibraryName(namespace);

  String get className => ctx.getClassName(namespace);

  String calculateReturnType(IDLFunction function) {
    if (function.usesCallback) {
      IDLParameter callback = function.callbackParamType;
      if (callback.params.isEmpty) {
        return 'Future';
      } else {
        // TODO: we need to figure out the type system
        return 'Future<${ctx.getReturnType(callback.params.first.type)}>';
      }
    } else {
      return ctx.getReturnType(function.returnType);
    }
  }

}
