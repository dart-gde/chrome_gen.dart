
library idl_model;

class IDLNamespace {
  String name;
  String description;
  List<IDLFunction> functions = [];
  List<IDLEvent> events = [];
  List<IDLProperty> properties = [];
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

  bool get returns {
    if (usesCallback) {
      return false;
    }
    return calculateReturnType() != 'void';
  }

  String calculateReturnType() {
    if (usesCallback) {
      return 'Future';
    } else {
      return returnType.dartName;
    }
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

  bool get isCallback => name == 'callback';

  String toString() => "${type.dartName} ${name}";
}

class IDLProperty {
  String name;
  String description;
  IDLType returnType;

  IDLProperty(this.name);

  String calculateReturnType() {
    return returnType != null ? returnType.dartName : "dynamic";
  }
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
