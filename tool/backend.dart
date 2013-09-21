
library backend;

import 'model_chrome.dart';
import 'overrides.dart';
import 'src/src_gen.dart';
import 'src/utils.dart';

/**
 * An abstract superclass for anything that wants to translate from an IDL model
 * into source code.
 */
abstract class Backend {
  Overrides overrides;

  Backend(this.overrides);

  factory Backend.createDefault(Overrides overrides) {
    return new DefaultBackend(overrides);
  }

  String generate(ChromeLibrary library, {String license, String sourceFileName});
}

class DefaultBackend extends Backend {
  DartGenerator generator;
  ChromeLibrary library;

  DefaultBackend(Overrides overrides): super(overrides);

  String generate(ChromeLibrary library, {String license, String sourceFileName}) {
    this.library = library;
    generator = new DartGenerator();

    if (license != null) {
      generator.writeln(license);
      generator.writeln();
    }

    if (sourceFileName != null) {
      generator.writeln("/* This file has been generated from ${sourceFileName} - do not edit */");
    } else {
      generator.writeln("/* This file is auto-generated */");
    }
    generator.writeln();

    generator.writeDocs(library.documentation);
    generator.writeln("library chrome.${libraryName};");
    generator.writeln();

    library.imports.forEach((String str) {
      str = fromCamelCase(str.replaceAll('.', '_'));
      generator.writeln("import '${str}.dart';");
    });
    generator.writeln("import '../src/common.dart';");
    generator.writeln();

    // final ChromeI18N i18n = new ChromeI18N._();
    generator.writeDocs("Accessor for the `chrome.${library.name}` namespace.",
        preferSingle: true);
    generator.writeln("final ${className} ${libraryName}"
        " = new ${className}._();");
    generator.writeln();

    _printClass();

    library.types.forEach((t) => _printDeclaredType(t));

    return generator.toString();
  }

  String get libraryName {
    return library.name.replaceAll('.', '_');
  }

  /**
   * Returns a class name like 'ChromeFooBar'.
   */
  String get className {
    if (overrides.getClassRename(library.name) != null) {
       return "Chrome${overrides.getClassRename(library.name)}";
    }

    return "Chrome${titleCase(toCamelCase(library.name))}";
  }

  String get contextReference {
    return "_${library.name.replaceAll('.', '_')}";
  }

  void _printClass() {
    generator.writeln("class ${className} {");
    generator.writeln("JsObject ${contextReference};");
    generator.writeln();
    generator.writeln("${className}._() {");

    List sections = library.name.split('.');
    generator.writeln("${contextReference} = "
        "context['chrome']['${sections.join('\'][\'')}'];");
    generator.writeln("}");

    library.properties.forEach((p) => _printProperty(p, contextReference));
    library.methods.forEach(_printMethod);
    library.events.forEach(_printEvent);

    generator.writeln("}");
  }

  void _printProperty(ChromeProperty property, String refString) {
    if (property.nodoc) {
      return;
    }

    String converter = getReturnConverter(property.type, preferCtor: true);

    generator.writeln();
    generator.writeDocs(property.documentation);
    generator.write("${property.type.toReturnString()} ");
    generator.write("get ${property.name} => ");
    if (converter != null) {
      generator.write('${converter}(');
    }
    generator.write("${refString}['${property.name}']");
    if (converter != null) {
      generator.write(')');
    }
    generator.writeln(';');
  }

  void _printMethod(ChromeMethod method) {
    generator.writeln();
    generator.writeDocs(method.description);
    generator.write("${method.returns.toReturnString()} ${method.name}(");
    generator.write(method.requiredParams.map((p) => "${p.type} ${p.name}").join(', '));
    if (method.optionalParams.isNotEmpty) {
      if (method.requiredParams.isNotEmpty) {
        generator.write(', ');
      }
      generator.write('[');
      generator.write(method.optionalParams.map((p) => "${p.type} ${p.name}").join(', '));
      generator.write(']');
    }
    generator.writeln(") {");
    if (method.usesCallback) {
      ChromeType future = method.returns;
      generator.write("ChromeCompleter completer = new ChromeCompleter.");
      if (future.parameters.length == 0) {
        generator.writeln("noArgs();");
      } else if (future.parameters.length == 1) {
        ChromeType param = future.parameters.first;
        if (getReturnConverter(param) == null) {
          generator.writeln("oneArg();");
        } else {
          generator.writeln("oneArg(${getReturnConverter(param)});");
        }
      } else if (future.parameters.length == 2) {
        // TODO: currently, the json convert is changing 2 arg calls to 1 arg.
        throw 'not yet supported';
        generator.writeln("twoArgs((arg1, arg2) {");
        generator.writeln("return null;");
        generator.writeln("});");
      } else {
        throw new StateError('unsupported number of params(${future.parameters.length})');
      }
    }
    if (!method.returns.isVoid && !method.usesCallback) {
      generator.write("return ");
    }
    generator.write("${contextReference}.callMethod('${method.name}'");
    if (method.params.length > 0 || method.usesCallback) {
      generator.write(", [");
      List strParams = method.params.map(getParamConverter).toList();
      if (method.usesCallback) {
        strParams.add('completer.callback');
      }
      generator.write("${strParams.join(', ')}]");
    }
    generator.writeln(");");
    if (method.usesCallback) {
      generator.writeln("return completer.future;");
    }
    generator.writeln("}");
  }

  void _printEvent(ChromeEvent event) {
    generator.writeln();
    generator.writeDocs(event.documentation);
    generator.writeln("Stream<${event.toReturnString()}> get ${event.name} => _${event.name}.stream;");

    // TODO: we need to type the stream controller
    generator.writeln();
    generator.writeln("// TODO:");
    generator.writeln("final ChromeStreamController<${event.toReturnString()}> _${event.name} = null;");
  }

  void _printDeclaredType(ChromeDeclaredType type) {
    if (overrides.ignoreDeclaredType(library.name, type.name)) {
      return;
    }

    generator.writeln();
    generator.writeDocs(type.documentation);
    generator.writeln("class ${type.name} extends ChromeObject {");
    generator.writeln("static ${type.name} create(JsObject proxy) => new ${type.name}(proxy);");
    generator.writeln();
    generator.writeln("${type.name}(JsObject proxy): super(proxy);");

    if (library.name == 'chrome.proxy') {
      type.properties.forEach((p) => _printProperty(p, 'proxy'));
    } else {
      type.properties.forEach((p) => _printProperty(p, 'this.proxy'));
    }

    generator.writeln("}");
  }

  // TODO: this is actually a return type converter -
  String getReturnConverter(ChromeType param, {bool preferCtor : false}) {
    if (param.isString || param.isInt || param.isBool) {
      return null;
    }

    // If it's a list and the elements are identity converters
    if (param.isList) {
      if (getReturnConverter(param.parameters.first) == null) {
        return "listify";
      } else {
        // TODO: we need to call listify with a map() param
        return null;
      }
    }

    if (param.isMap) {
      return 'mapify';
    }

    if (param.isReferencedType) {
      if (preferCtor) {
        return 'new ${param.refName}';
      } else {
        return '${param.refName}.create';
      }
    }

    return null;
  }

  String getParamConverter(ChromeType param) {
    if (param.isMap || param.isList) {
      return "jsify(${param.name})";
    } else {
      return param.name;
    }
  }
}

