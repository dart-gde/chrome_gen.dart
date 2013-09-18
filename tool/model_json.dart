
library model_json;

import 'dart:convert';
import 'dart:io';

import 'model_chrome.dart';
import 'src/utils.dart';

void main() {
  JsonNamespace namespace = parse(new File(
      new Options().arguments.first).readAsStringSync());

  print(namespace);
}

JsonNamespace parse(String jsonText) {
  // pre-filter to remove line comments -
  List<String> lines = new LineSplitter().convert(jsonText);
  Iterable newLines = lines.map((String line) {
    int index = line.indexOf('//');

    // If we find // foo, we remove it from the line, unless it looks like
    // :// foo (as in, http://cheese.com).

    if (index == -1) {
      return line;
    } else if (index == 0 || line.codeUnitAt(index - 1) != 58) { // 58 == ':'
      return line.substring(0, index);
    } else {
      return line;
    }
  });

  return _parseJson(JSON.decode(newLines.join('\n')));
}

JsonNamespace _parseJson(dynamic json) {
  Map m = json[0];

  return new JsonNamespace(json[0]);
}

abstract class JsonObject {
  dynamic json;

  JsonObject(this.json);

  String get description => json['description'];

  bool _bool(String key) => json[key] == true || json[key] == 'true';
}

class JsonNamespace extends JsonObject {
  List<JsonProperty> properties;
  List<JsonFunction> functions;
  List<JsonEvent> events;
  List<JsonDeclaredType> types;

  JsonNamespace(json): super(json) {
    properties = JsonProperty.parse(json['properties']);
    functions = JsonFunction.parse(json['functions']);
    events = JsonEvent.parse(json['events']);
    types = JsonDeclaredType.parse(json['types']);
  }

  String get namespace => json['namespace'];

  String toString() => "${runtimeType.toString()} ${namespace}";
}

class JsonProperty extends JsonObject {
  String name;
  JsonReturnType type;

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

  String toString() => "${runtimeType.toString()} ${name}";
}

class JsonFunction extends JsonObject {
  List<JsonParamType> parameters;
  JsonReturnType returns;

  static List<JsonFunction> parse(List jsons) {
    return (jsons == null ? [] : jsons.map((j) => new JsonFunction(j)).toList());
  }

  JsonFunction(json): super(json) {
    parameters = JsonParamType.parse(json['parameters']);
    if (json.containsKey('returns')) {
      returns = new JsonReturnType(json['returns']);
    }
  }

  String get name => json['name'];
  String get type => json['type'];
  bool get nocompile => _bool('nocompile');

  String toString() => "${runtimeType.toString()} ${name}()";
}

class JsonType extends JsonObject {
  List<JsonParamType> parameters;
  List<JsonProperty> properties;

  JsonType(json): super(json) {
    parameters = JsonParamType.parse(json['parameters']);
    properties = JsonProperty.parse(json['properties']);
  }

  String get name => null;

  String get type => json['type'];
  String get ref => json[r'$ref'];
  String get isInstanceOf => json['isInstanceOf'];
  List<String> get enumOptions => json['enum'];
  bool get optional => _bool('optional');
  bool get nocompile => _bool('nocompile');

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
  ChromeLibrary library = new ChromeLibrary();
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
  } else {
    // TODO:
    type.type = "var";
  }

  // TODO: properties

  type.parameters = t.parameters.map(_convertType).toList();

  return type;
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
