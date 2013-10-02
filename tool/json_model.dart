
library model_json;

import 'chrome_model.dart';
import 'src/utils.dart';

abstract class JsonObject {
  final Map<String, dynamic> json;

  JsonObject(this.json);

  String get description => json['description'];

  bool _bool(String key) => json[key] == true || json[key] == 'true';
}

class JsonNamespace extends JsonObject {
  final List<JsonProperty> properties;
  final List<JsonFunction> functions;
  final List<JsonEvent> events;
  final List<JsonDeclaredType> types;

  JsonNamespace(json) :
    properties = JsonProperty.parse(json['properties']),
    functions = JsonFunction.parse(json['functions']),
    events = JsonEvent.parse(json['events']),
    types = JsonDeclaredType.parse(json['types']),
    super(json);

  String get namespace => json['namespace'];

  String toString() => "${runtimeType.toString()} ${namespace}";
}

class JsonProperty extends JsonObject {
  final String name;
  final JsonReturnType type;

  static List<JsonProperty> parse(Map m) {
    List<JsonProperty> properties = [];

    if (m != null) {
      for (String key in m.keys) {
        properties.add(new JsonProperty(key, new JsonReturnType(m[key])));
      }
    }

    return properties;
  }

  JsonProperty(this.name, this.type): super(null);

  String get description => type.description;
  bool get nodoc => type.nodoc;

  String toString() => "${runtimeType.toString()} ${name}";
}

class JsonFunction extends JsonObject {
  final List<JsonParamType> parameters;
  final JsonReturnType returns;

  static List<JsonFunction> parse(List jsons) {
    return (jsons == null ? [] : jsons.map((j) => new JsonFunction(j)).toList());
  }

  JsonFunction(json) :
    parameters = JsonParamType.parse(json['parameters']),
    returns = json.containsKey('returns') ?
        new JsonReturnType(json['returns']) : null,
    super(json);

  String get name => json['name'];
  String get type => json['type'];
  bool get nocompile => _bool('nocompile');

  String toString() => "${runtimeType.toString()} ${name}()";
}

class JsonType extends JsonObject {
  final List<JsonParamType> parameters;
  final List<JsonProperty> properties;

  JsonType(json):
    this.parameters = JsonParamType.parse(json['parameters']),
    this.properties = JsonProperty.parse(json['properties']),
    super(json) {

    if (parameters.isEmpty && json.containsKey('items')) {
      parameters.add(new JsonType(json['items']));
    }
  }

  String get name => null;

  String get type => json['type'];
  String get ref => json[r'$ref'];
  String get isInstanceOf => json['isInstanceOf'];
  List<String> get enumOptions => json['enum'];
  bool get optional => _bool('optional');
  bool get nocompile => _bool('nocompile');
  bool get nodoc => _bool('nodoc');
  bool get isCallback => type == 'function' && (name == 'callback' || name == 'responseCallback');

  String toString() => "${runtimeType.toString()} ${type} (${ref})";
}

class JsonParamType extends JsonType {

  static List<JsonType> parse(List jsons) {
    return (jsons == null ? [] : jsons.map((j) => new JsonParamType(j)).toList());
  }

  JsonParamType(json): super(json);

  String get name => json['name'];

  // rare ones
  int get maxLength => json['maxLength'];
  dynamic get value => json['value'];

  String toString() => "${runtimeType.toString()} ${name}";
}

class JsonReturnType extends JsonParamType {

  JsonReturnType(json): super(json);
}

class JsonEvent extends JsonParamType {

  static List<JsonEvent> parse(List jsons) {
    return (jsons == null ? [] : jsons.map((j) => new JsonEvent(j)).toList());
  }

  JsonEvent(json): super(json);
}

class JsonDeclaredType extends JsonType {

  static List<JsonDeclaredType> parse(List jsons) {
    return (jsons == null ? [] : jsons.map((j) => new JsonDeclaredType(j)).toList());
  }

  JsonDeclaredType(json): super(json);

  String get id => json['id'];

  String get name => id;

  String toString() => "${runtimeType.toString()} ${id}";
}

ChromeLibrary convert(JsonNamespace namespace) {
  return new JsonConverter().convert(namespace);
}

class JsonConverter {
  ChromeLibrary library;

  ChromeLibrary convert(JsonNamespace namespace) {
    library = new ChromeLibrary();
    library.name = namespace.namespace;
    library.documentation = convertHtmlToDartdoc(namespace.description);

    library.properties = namespace.properties.map(_convertProperty).toList();
    library.types = namespace.types.map(_convertDeclaredType).toList();
    library.methods = namespace.functions.map(_convertMethod).toList();
    library.events = namespace.events.map(_convertEvent).toList();

    return library;
  }

  ChromeProperty _convertProperty(JsonProperty p) {
    ChromeProperty property = new ChromeProperty();

    property.name = p.name;
    property.documentation = convertHtmlToDartdoc(p.description);
    property.type = _convertType(p.type);
    property.nodoc = p.nodoc;

    return property;
  }

  ChromeMethod _convertMethod(JsonFunction f) {
    ChromeMethod method = new ChromeMethod();

    method.name = f.name;
    method.documentation = convertHtmlToDartdoc(f.description);
    method.returns = _convertType(f.returns);
    method.params = f.parameters.map(_convertType).toList();

    if (method.returns == null) {
      if (!f.parameters.isEmpty && f.parameters.last.isCallback) {
        ChromeType type = method.params.removeLast();

        method.returns = _convertToFuture(type);
      } else {
        method.returns = ChromeType.VOID;
      }
    }

    return method;
  }

  ChromeDeclaredType _convertDeclaredType(JsonDeclaredType t) {
    ChromeDeclaredType type = _convertType_(t, new ChromeDeclaredType());

    int index = type.name.lastIndexOf('.');

    if (index != -1) {
      type.qualifier = type.name.substring(0, index);
      type.name = type.name.substring(index + 1);
    }

    return type;
  }

  ChromeEvent _convertEvent(JsonEvent e) {
    return _convertType_(e, new ChromeEvent());
  }

  ChromeType _convertType(JsonType t) {
    if (t == null) {
      return null;
    } else {
      return _convertType_(t, new ChromeType());
    }
  }

  ChromeType _convertToFuture(ChromeType type) {
    ChromeType future = new ChromeType();

    future.type = "Future";

    if (type.parameters.length == 1) {
      future.parameters.add(type.parameters.first);
      future.documentation = future.parameters.first.documentation;
    } else if (type.parameters.length >= 2) {
      // TODO: we need to correctly handle mapping multiple parameters to a single
      // return
      // runtime.requestUpdateCheck()
      // devtools.inspectedWindow.eval()

      future.parameters.add(ChromeType.JS_OBJECT);
      future.documentation = type.parameters.map(
          (p) => "[${p.name}] ${p.documentation}").join('\n');
    }

    return future;
  }

  ChromeType _convertType_(JsonType t, ChromeType type) {
    type.name = t.name;
    type.documentation = convertHtmlToDartdoc(t.description);

    if (t.type == 'string') {
      type.type = "String";
    } else if (t.type == 'integer') {
      type.type = "int";
    } else if (t.type == 'boolean') {
      type.type = "bool";
    } else if (_isImplicitInt(t)) {
      type.type = 'int';
    } else if (t.type == 'array') {
      // {type: array, items: {type: string}
      type.type = 'List';
    } else if (t.type == 'object' && t.isInstanceOf == null) {
      type.type = "Map";

//      // create documentation from the type's properties
//      if (t.properties.isNotEmpty) {
//        String propertyDocs = t.properties.map((p) {
//          if (p.description != null) {
//            return "`${p.name}` ${convertHtmlToDartdoc(p.description)}";
//          } else {
//            return "`${p.name}`";
//          }
//        }).join("\n\n");
//
//        if (type.documentation != null) {
//          type.documentation = "${type.documentation}\n\n${propertyDocs}";
//        } else {
//          type.documentation = propertyDocs;
//        }
//      }

//    } else if (t.type == 'object' && t.isInstanceOf != null) {
//      type.type = "var";
//      type.refName = t.isInstanceOf;
//      library.addImport(getImportForClass(type.refName));
    } else if (t.ref != null) {
      type.type = "var";

      List<String> names = parseQualifiedName(t.ref);

      if (names[0] != null) {
        library.addImport(names[0]);
      }

      type.refName = names[1];
    } else {
      type.type = "var";
    }

    type.optional = t.optional;
    type.parameters = t.parameters.map(_convertType).toList();
    type.properties = t.properties.map(_convertProperty).toList();
    type.enumOptions = t.enumOptions;

    if (type.hasEnums) {
      String enumStr = type.enumOptions.map((e) => "`${e}`").join(', ');
      type.appendDocs("enum of ${enumStr}");
    }

    return type;
  }
}

bool _isImplicitInt(JsonType t) {
  if (t is JsonParamType) {
    JsonParamType type = t as JsonParamType;

    return _isInt(type.value) || _isInt(type.maxLength);
  }

  return false;
}

bool _isInt(var val) {
  if (val is num) {
    num n = val as num;

    if (val.toInt().toDouble() == val.toDouble()) {
      return true;
    }
  }

  return false;
}

List<String> parseQualifiedName(String str) {
  int index = str.lastIndexOf('.');

  if (index != -1) {
    // devtools.inspectedWindow.Resource
    String qualifier = str.substring(0, index);
    String name = str.substring(index + 1);

    return [qualifier, name];
  } else {
    return [null, str];
  }
}

Map _importMap = const {
  'DirectoryEntry': '../src/files.dart',
  'Window': 'windows'
};

String getImportForClass(String name) {
  return _importMap[name];
}
