
library backend;

import 'chrome_model.dart';
import 'overrides.dart';
import 'src/src_gen.dart';
import 'src/utils.dart';

/**
 * An abstract superclass for anything that wants to translate from an IDL model
 * into source code.
 */
abstract class Backend {
  final Overrides overrides;

  Backend(this.overrides);

  factory Backend.createDefault(Overrides overrides) {
    return new DefaultBackend(overrides);
  }

  String generate(ChromeLibrary library, {String license, String sourceFileName});
}

class DefaultBackend extends Backend {
  DefaultBackend(Overrides overrides): super(overrides);

  String generate(ChromeLibrary library, {String license, String sourceFileName}) {
    var context = new _DefaultBackendContext(new DartGenerator(),
        library, overrides);

    return context.generate(license: license, sourceFileName: sourceFileName);
  }
}

class _DefaultBackendContext {
  final DartGenerator generator;
  final ChromeLibrary library;
  final Overrides overrides;

  final Set<String> _neededFactories = new Set<String>();

  _DefaultBackendContext(this.generator, this.library, this.overrides);

  String generate({String license, String sourceFileName}) {
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

    // final ChromeI18N i18n = ChromeI18N._i18n == null ? null : new ChromeI18N._();
    generator.writeDocs("Accessor for the `chrome.${library.name}` namespace.",
        preferSingle: true);
    generator.writeln("final ${className} ${libraryName} = (${className}."
        "${contextReference} == null ? null : new ${className}._());");
    generator.writeln();

    _printClass();

    library.eventTypes.forEach((t) => _printEventType(t));
    library.enumTypes.forEach((t) => _printEnumType(t));
    library.types.forEach((t) => _printDeclaredType(t));

    if(_neededFactories.isNotEmpty) {
      generator.writeln();

      var created = new Set<String>();

      while(_neededFactories.isNotEmpty) {
        var factoryType = _neededFactories.first;
        _neededFactories.remove(factoryType);

        if(!created.contains(factoryType)) {
          _writeFactory(factoryType);
          created.add(factoryType);
        }
      }
    }

    overrides.classRenamesFor(library.name).forEach((List<String> renamePair) {
      generator.renameSymbol(renamePair[0], renamePair[1]);
    });

    return generator.toString();
  }

  void _writeFactory(String creator) {
    String creatorTemplate = null;

    var type = library.eventTypes.firstWhere((e) => e.name == creator, orElse: () => null);

    if(type != null) {
      Iterable<ChromeProperty> props = type.filteredProperties;

      String createParams = props.map((p) => '${getJSType(p.type)} ${p.name}').join(', ');
      generator.writeln("${creator} _create$creator(${createParams}) =>");
      String cvtParams = props.map((ChromeProperty p) {
        String cvt = getCallbackConverter(p.type, _neededFactories);
        if (cvt == null) {
          return p.name;
        } else {
          return "${cvt}(${p.name})";
        }
      }).join(', ');
      generator.writeln("    new ${creator}(${cvtParams});");
      return;
    }

    var enumType = library.enumTypes.firstWhere((e) => e.name == creator, orElse: () => null);
    if(enumType != null) {
      creatorTemplate = "%s _create%s(String value) => %s.VALUES.singleWhere((ChromeEnum e) => e.value == value);";
    } else {
      creatorTemplate = "%s _create%s(JsObject proxy) => proxy == null ? null : new %s.fromProxy(proxy);";
    }

    generator.writeln(creatorTemplate.replaceAll('%s', creator));
  }

  String get libraryName {
    return library.name.replaceAll('.', '_');
  }

  /**
   * Returns a class name like 'ChromeFooBar'.
   */
  String get className {
    var name = overrides.namespaceRename(library.name);
    if (name == null) {
      name = titleCase(toCamelCase(library.name));
    }

    return "Chrome${name}";
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

    library.filteredProperties.forEach((p) => _printProperty(p, contextReference));
    library.methods.forEach(_printMethod);
    library.events.forEach(_printEvent);

    generator.writeln("}");
  }

  void _printProperty(ChromeProperty property, String refString, [bool printSetter = false]) {
    String converter = getReturnConverter(property.type, _neededFactories);
    String getterBody = "${refString}['${property.name}']";

    generator.writeln();
    generator.writeDocs(property.getDescription());
    generator.write("${property.type.toReturnString()} ");
    generator.write("get ${property.name} => ");
    generator.writeln("${converter.replaceFirst('%s', getterBody)};");

    if (printSetter) {
      // set periodInMinutes(double value) => proxy['periodInMinutes'] = value;
      generator.writeln("set ${property.name}(${property.type} value) => ${getterBody} = value;");
    }
  }

  /**
   * Print the given [method]. If [thisOverride] is not null, use that text to
   * represent the `this` object. It wil default to the chrome. namespace
   * reference (e.g., `_app_window`).
   */
  void _printMethod(ChromeMethod method, [String thisOverride]) {
    if (thisOverride == null) {
      thisOverride = contextReference;
    }

    generator.writeln();
    generator.writeDocs(method.getDescription());
    generator.write("${method.returns.toReturnString()} ${method.name}(");
    generator.write(method.requiredParams.map((p) => "${p.toParamString(true)} ${p.name}").join(', '));
    if (method.optionalParams.isNotEmpty) {
      if (method.requiredParams.isNotEmpty) {
        generator.write(', ');
      }
      generator.write('[');
      generator.write(method.optionalParams.map((p) => "${p.toParamString(true)} ${p.name}").join(', '));
      generator.write(']');
    }
    generator.writeln(") {");
    if (method.usesCallback) {
      ChromeType future = method.returns;
      var returnType = future.getReturnStringTypeParams();
      generator.write("var completer = new ChromeCompleter${returnType}.");
      if (future.parameters.length == 0) {
        generator.writeln("noArgs();");
      } else if (future.parameters.length == 1) {
        ChromeType param = future.parameters.first;
        var callbackConverter = getCallbackConverter(param, _neededFactories);
        if (callbackConverter == null) {
          generator.writeln("oneArg();");
        } else {
          generator.writeln("oneArg(${callbackConverter});");
        }
      } else if (future.parameters.length == 2) {
        // TODO: currently, the json convert is changing 2 arg calls to 1 arg.
        throw new UnimplementedError('not yet supported');
        generator.writeln("twoArgs((arg1, arg2) {");
        generator.writeln("return null;");
        generator.writeln("});");
      } else {
        throw new StateError('unsupported number of params(${future.parameters.length})');
      }
    }

    StringBuffer methodCall = new StringBuffer();
    methodCall.write("${thisOverride}.callMethod('${method.name}'");
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
      String returnConverter = getReturnConverter(method.returns, _neededFactories);

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
      String converter = getCallbackConverter(type, _neededFactories);
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
    // We do class renames in a lexical basis for the entire compilation unit.
    String className = type.name; //overrides.className(library.name, type.name);

    Iterable<ChromeProperty> props = type.filteredProperties;

    generator.writeln();
    generator.writeDocs(type.documentation);
    generator.writeln("class ${className} {");
    props.forEach((ChromeProperty property) {
      generator.writeln();
      generator.writeDocs(property.getDescription());
      generator.writeln("final ${property.type.toReturnString()} ${property.name};");
    });
    generator.writeln();
    String params = props.map((p) => 'this.${p.name}').join(', ');
    generator.writeln("${className}(${params});");
    generator.writeln("}");
  }

  void _printEnumType(ChromeEnumType type) {
    generator.writeln();
    generator.writeDocs(type.documentation);
    generator.writeln("class ${type.name} extends ChromeEnum {");

    var constNames = new List<String>();

    type.values.forEach((ChromeEnumEntry entry) {
      generator.writeDocs(entry.documentation);

      // TODO: do proper const name generation - WITH_UNDERSCORE
      var constName = entry.name.toUpperCase();
      constNames.add(constName);

      generator.writeln("static const ${type.name} ${constName} "
          "= const ${type.name}._('${entry.name}');");
    });

    generator.writeln();
    String str = constNames.join(', ');
    generator.writeln("static const List<${type.name}> VALUES = const[${str}];");

    generator.writeln();
    generator.writeln("const ${type.name}._(String str): super(str);");

    generator.writeln("}");
  }

  void _printDeclaredType(ChromeDeclaredType type) {
    if (overrides.suppressClass(library.name, type.name)) {
      return;
    }

    String className = type.name;
    List<ChromeProperty> props =
        type.filteredProperties.toList(growable: false);

    generator.writeln();
    generator.writeDocs(type.documentation);
    generator.writeln("class ${className} extends ChromeObject {");
    generator.writeln();
    if (props.isNotEmpty) {
      generator.write("${className}({");
      generator.write(props.map((p) => "${p.type} ${p.name}").join(', '));
      generator.writeln('}) {');
      props.forEach((ChromeProperty p) {
        generator.writeln("if (${p.name} != null) this.${p.name} = ${p.name};");
      });
      generator.writeln('}');
    } else {
      generator.writeln("${className}();");
    }
    generator.writeln();
    generator.writeln("${className}.fromProxy(JsObject proxy): super.fromProxy(proxy);");

    if (library.name != 'proxy') {
      props.forEach((p) => _printProperty(p, 'proxy', true));
    } else {
      props.forEach((p) => _printProperty(p, 'this.proxy', true));
    }

    type.methods.forEach((m) => _printMethod(m, 'proxy'));

    generator.writeln("}");
  }

  /**
   * Return the name of the incoming JS type.
   */
  static String getJSType(ChromeType type) {
    if (type.isPrimitive) {
      return type.type;
    } else {
      return 'JsObject';
    }
  }

  static String getCallbackConverter(ChromeType param, Set<String> creators) {
    if (param.isString || param.isInt || param.isBool) {
      return null;
    } else if (param.isList) {
      var firstParamCallbackConverter = getCallbackConverter(param.parameters.first, creators);
      if (firstParamCallbackConverter == null) {
        // if the elements are identity converters
        return "listify";
      } else {
        // we need to call listify with a map() param
        return "(e) => listify(e, ${firstParamCallbackConverter})";
      }
    } else if (param.isMap) {
      return 'mapify';
    } else if (param.isReferencedType) {
      creators.add(param.refName);
      return '_create${param.refName}';
    } else {
      return null;
    }
  }

  static String getReturnConverter(ChromeType param, Set<String> creators) {
    if (param.isString || param.isInt || param.isBool) {
      return '%s';
    } else if (param.isList) {
      var firstParamCallbackConverter = getCallbackConverter(param.parameters.first, creators);
      if (firstParamCallbackConverter == null) {
        // if the elements are identity converters
        return "listify(%s)";
      } else {
        // else, call listify with a map() param
        return "listify(%s, ${firstParamCallbackConverter})";
      }
    } else if (param.isMap) {
      return 'mapify(%s)';
    } else if (param.isReferencedType) {
      creators.add(param.refName);
      return '_create${param.refName}(%s)';
    } else {
      return '%s';
    }
  }

  static String getParamConverter(ChromeType param) {
    if (param.isMap || param.isList) {
      return "jsify(${param.name})";
    } else {
      return param.name;
    }
  }
}
