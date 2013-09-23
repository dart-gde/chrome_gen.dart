
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
      if (str.endsWith('.dart')) {
        generator.writeln("import '${str}';");
      } else {
        str = fromCamelCase(str.replaceAll('.', '_'));
        generator.writeln("import '${str}.dart';");
      }
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

    library.eventTypes.forEach((t) => _printEventType(t));

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
    List sections = library.name.split('.');

    generator.writeln("class ${className} {");
    generator.write("static final JsObject ${contextReference} = ");
    generator.writeln("context['chrome']['${sections.join('\'][\'')}'];");
    generator.writeln();
    generator.writeln("${className}._();");

    library.properties.forEach((p) => _printProperty(p, contextReference));
    library.methods.forEach(_printMethod);
    library.events.forEach(_printEvent);

    generator.writeln("}");
  }

  void _printProperty(ChromeProperty property, String refString) {
    if (property.nodoc) {
      return;
    }

    String converter = getReturnConverter(property.type);
    String getterBody = "${refString}['${property.name}']";

    generator.writeln();
    generator.writeDocs(property.getDescription());
    generator.write("${property.type.toReturnString()} ");
    generator.write("get ${property.name} => ");
    generator.writeln("${converter.replaceFirst('%s', getterBody)};");
  }

  void _printMethod(ChromeMethod method) {
    generator.writeln();
    generator.writeDocs(method.getDescription());
    generator.write("${method.returns.toReturnString()} ${method.name}(");
    generator.write(method.requiredParams.map((p) => "${p} ${p.name}").join(', '));
    if (method.optionalParams.isNotEmpty) {
      if (method.requiredParams.isNotEmpty) {
        generator.write(', ');
      }
      generator.write('[');
      generator.write(method.optionalParams.map((p) => "${p} ${p.name}").join(', '));
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
        if (getCallbackConverter(param) == null) {
          generator.writeln("oneArg();");
        } else {
          generator.writeln("oneArg(${getCallbackConverter(param)});");
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

    StringBuffer methodCall = new StringBuffer();
    methodCall.write("${contextReference}.callMethod('${method.name}'");
    if (method.params.length > 0 || method.usesCallback) {
      methodCall.write(", [");
      List strParams = method.params.map(getParamConverter).toList();
      if (method.usesCallback) {
        strParams.add('completer.callback');
      }
      methodCall.write("${strParams.join(', ')}]");
    }
    methodCall.write(")");

    if (method.usesCallback || method.returns.isVoid) {
      generator.writeln("${methodCall};");
    } else {
      String returnConverter = getReturnConverter(method.returns);

      if (returnConverter.contains(',')) {
        generator.writeln("var ret = ${methodCall};");
        generator.writeln("return ret;");
      } else {
        String text = returnConverter.replaceFirst('%s', methodCall.toString());
        generator.writeln("return ${text};");
      }
    }

    if (method.usesCallback) {
      generator.writeln("return completer.future;");
    }
    generator.writeln("}");
  }

  void _printEvent(ChromeEvent event) {
    ChromeType type = event.calculateType(library);

    generator.writeln();
    generator.writeDocs(event.documentation);

    String typeName = type == null ? null : type.toReturnString();

    if (type != null) {
      generator.writeln("Stream<${typeName}> get ${event.name} => _${event.name}.stream;");
    } else {
      generator.writeln("Stream get ${event.name} => _${event.name}.stream;");
    }

    generator.writeln();

    if (type != null) {
      generator.writeln("final ChromeStreamController<${typeName}> _${event.name} =");
      String converter = getCallbackConverter(type);
      if (converter == null) {
        converter = 'selfConverter';
      }

      String argCallArity = ['noArgs', 'oneArg', 'twoArgs', 'threeArgs'][type.arity];
      generator.writeln("    new ChromeStreamController<${typeName}>.${argCallArity}("
          "${contextReference}['${event.name}'], ${converter});");
    } else {
      generator.writeln("final ChromeStreamController _${event.name} =");
      generator.writeln("    new ChromeStreamController.noArgs("
          "${contextReference}['${event.name}']);");
    }
  }

  void _printEventType(ChromeType type) {
    generator.writeln();
    generator.writeDocs(type.documentation);
    generator.writeln("class ${type.name} {");
    String createParams = type.properties.map((p) => '${getJSType(p.type)} ${p.name}').join(', ');
    generator.writeln("static ${type.name} create(${createParams}) =>");
    String cvtParams = type.properties.map((ChromeProperty p) {
      String cvt = getCallbackConverter(p.type);
      if (cvt == null) {
        return p.name;
      } else {
        return "${cvt}(${p.name})";
      }
    }).join(', ');
    generator.writeln("    new ${type.name}(${cvtParams});");
    type.properties.forEach((ChromeProperty property) {
      generator.writeln();
      generator.writeDocs(property.getDescription());
      generator.writeln("${property.type.toReturnString()} ${property.name};");
    });
    generator.writeln();
    String params = type.properties.map((p) => 'this.${p.name}').join(', ');
    generator.writeln("${type.name}(${params});");
    generator.writeln("}");
  }

  void _printDeclaredType(ChromeType type) {
    if (overrides.ignoreDeclaredType(library.name, type.name)) {
      return;
    }

    generator.writeln();
    generator.writeDocs(type.documentation);
    generator.writeln("class ${type.name} extends ChromeObject {");
    generator.writeln("static ${type.name} create(JsObject proxy) => "
        "proxy == null ? null : new ${type.name}(proxy);");
    generator.writeln();
    generator.writeln("${type.name}(JsObject proxy): super(proxy);");

    if (library.name != 'proxy') {
      type.properties.forEach((p) => _printProperty(p, 'proxy'));
    } else {
      type.properties.forEach((p) => _printProperty(p, 'this.proxy'));
    }

    generator.writeln("}");
  }

  /**
   * Return the name of the incoming JS type.
   */
  String getJSType(ChromeType type) {
    if (type.isPrimitive) {
      return type.type;
    } else {
      return 'JsObject';
    }
  }

  String getCallbackConverter(ChromeType param) {
    if (param.isString || param.isInt || param.isBool) {
      return null;
    } else if (param.isList) {
      if (getCallbackConverter(param.parameters.first) == null) {
        // if the elements are identity converters
        return "listify";
      } else {
        // we need to call listify with a map() param
        return "(e) => listify(e, ${getCallbackConverter(param.parameters.first)})";
      }
    } else if (param.isMap) {
      return 'mapify';
    } else if (param.isReferencedType) {
      return '${param.refName}.create';
    } else {
      return null;
    }
  }

  String getReturnConverter(ChromeType param) {
    if (param.isString || param.isInt || param.isBool) {
      return '%s';
    } else if (param.isList) {
      if (getCallbackConverter(param.parameters.first) == null) {
        // if the elements are identity converters
        return "listify(%s)";
      } else {
        // else, call listify with a map() param
        return "listify(%s, ${getCallbackConverter(param.parameters.first)})";
      }
    } else if (param.isMap) {
      return 'mapify(%s)';
    } else if (param.isReferencedType) {
      return 'new ${param.refName}(%s)';
    } else {
      return '%s';
    }
  }

  String getParamConverter(ChromeType param) {
    if (param.isMap || param.isList) {
      return "jsify(${param.name})";
    } else {
      return param.name;
    }
  }
}

