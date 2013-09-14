
library idl_model;

class IDLNamespace {
  /// The IDL namespace name, generally something like 'commandLinePrivate'.
  String name;

  String description;

  List<IDLFunction> functions = [];
  List<IDLEvent> events = [];
  List<IDLProperty> properties = [];

  String toString() => name;
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

  bool get usesCallback => !parameters.isEmpty && parameters.last.isCallback;

  IDLParameter get callbackParamType => parameters.last;

  bool get returns {
    if (usesCallback) {
      return false;
    }

    return returnType != null;
  }

  String toString() => "${name}()";
}

class IDLEvent {
  String name;
  String description;
  List<IDLParameter> params = [];

  IDLEvent(this.name);

  String toString() => name;
}

class IDLParameter {
  String name;
  IDLType type = IDLType.VAR;
  String description;
  bool optional;

  List<IDLParameter> params = [];

  IDLParameter(this.name);

  bool get isCallback => name == 'callback' || name == 'responseCallback';

  String toString() => "${type} ${name}";
}

class IDLProperty {
  String name;
  String description;
  IDLType returnType;

  IDLProperty(this.name);

  String toString() => name;
}

class IDLType {
  static IDLType VAR = new IDLType('any');

  /// The type name, i.e. string, integer, boolean, object, ...
  String name;

  /// Additional type info, from the $ref field. e.g. 'runtime.Port'
  String refName;

  factory IDLType(String name) {
    if (name == null) {
      return null;
    } else {
      return new IDLType._(name);
    }
  }

  factory IDLType.fromMap(Map m) {
    if (!m.containsKey('type') && !m.containsKey(r'$ref')) {
      return null;
    } else if (m.containsKey(r'$ref')) {
      return new IDLType.fromRef(m[r'$ref']);
    } else {
      return new IDLType._(m['type']);
    }
  }

  IDLType.fromRef(this.refName) {
    name = 'object';
  }

  IDLType._(this.name);

  bool get isFunction => name == 'function';
  bool get isObject => name == 'object';
  bool get isArray => name == 'array';

  String toString() => name;
}
