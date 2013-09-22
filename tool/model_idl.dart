// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library model_idl;

import 'model_chrome.dart';

// TODO: this model needs to be re-written in-line with the needs of the web_idl_parser.

class EMPTY {
  // EPSILON
  const EMPTY();
  toString() => "EMPTY";
}

/**
 * Collects the definitions for the WebIDL parser.
 */
class IDLCollector {
  IDLNamespace idlNamespace;
  namespace(l) => l; // Must return type passed for parser to continue.
  interface(l) => l; // Must return type passed for parser to continue.
  interfaceMember(l) => l; // Must return type passed for parser to continue.
  dictionary(l) => l; // Must return type passed for parser to continue.
  dictionaryMember(l) => l; // Must return type passed for parser to continue.
  enumStatement(l) => l; // Must return type passed for parser to continue.
}

class IDLCollectorChrome implements IDLCollector {
  IDLNamespace idlNamespace = new IDLNamespace();
  List _functions = [];
  List _dictionaryMembers = [];

  namespace(l) {
    idlNamespace.name = l[2].join('.');

    // Must return type passed for parser to continue.
    return l;
  }

  interface(l) {
    if (l[1] == "Functions") {
      idlNamespace.functions.addAll(_functions);
      _functions = [];
    } else if (l[1] == "Events") {
      _toEvent(IDLFunction f) {
        IDLEvent event = new IDLEvent(f.name);
        event.params.addAll(f.parameters);
        return event;
      };
      idlNamespace.events.addAll(_functions.map(_toEvent).toList());
      _functions = [];
    }

    // Must return type passed for parser to continue.
    return l;
  }

  interfaceMember(l) {
    var name = l[1][1];
    var arg = l[1][2];
    IDLFunction function = new IDLFunction(name, "");

    List recursiveParams = [];

    IDLParameter reduceParameter(a) {
      var func = a;

      if (func[1] is List) {
        var type = func[1][0];
        var name;
        if (func[1][2] != EMPTY) {
          name = func[1][2];
        } else if (func[1][3] != EMPTY) {
          name = func[1][3];
        } else {
          // throw does not know how to parse.
        }

        IDLParameter param = new IDLParameter(name);

        if (type is List) {
          type = type[0];
          if (type is List) {
            type = type[0];
          }

          param.type = new IDLType(type);
          param.optional = false;
        } else if (type is String) {
          if (type == "optional") {
            param.optional = true;
          } else {
            param.optional = false;
          }

          if (func[1][1] is List) {
            var type = func[1][1][0];
            if (type is List) {
              type = type[0];
            }
            param.type = new IDLType(type);
          }
        }

        return param;
      }
    };

    void parameterParser(a) {
      var func;

      if (a == EMPTY) return;

      if (a.length == 3) {
        // recursive
        func = a[1];
        IDLParameter param = reduceParameter(func);
        recursiveParams.add(param);

        if (a[2] != EMPTY) {
          parameterParser(a[2]);
          return;
        } else {
          return;
        }
      }

      if (a.length == 2) {
        func = a[1];
      }
    };

    if (arg != EMPTY) {
      var func = arg[0];
      IDLParameter param = reduceParameter(func);
      function.parameters.add(param);

      if (arg.length > 1) {
        parameterParser(arg[1]);
      }
    }

    if (!recursiveParams.isEmpty) {
      function.parameters.addAll(recursiveParams);
    }

    _functions.add(function);

    // Must return type passed for parser to continue.
    return l;
  }

  dictionary(l) {
    String name = l[1];
    IDLDeclaredType declaredType = new IDLDeclaredType(name);
    declaredType.members.addAll(_dictionaryMembers);
    _dictionaryMembers = [];

    // Must return type passed for parser to continue.
    return l;
  }

  dictionaryMember(l) {
    String name = l[1];
    IDLProperty member = new IDLProperty(name);
    var type = l[0][0];

    if (type is List) {
      type = type[0];
    }

    member.returnType = new IDLType(type);
    _dictionaryMembers.add(member);
    // Must return type passed for parser to continue.
    return l;
  }

  enumStatement(l) {
    // Must return type passed for parser to continue.
    return l;
  }
}

class IDLNamespace {
  /// The IDL namespace name, generally something like 'commandLinePrivate'.
  String name;

  String description;

  List<IDLFunction> functions = [];
  List<IDLEvent> events = [];
  List<IDLDeclaredType> declaredTypes = [];
  // Dont know what the use of properties is vs declaredTypes in terms of
  // WebIDL.
  //List<IDLProperty> properties = [];

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

/**
 * Declared type is a type that is defined by a WebIDL dictionary.
 */
class IDLDeclaredType {
  String name;
  String description;
  List<IDLProperty> members = [];

  IDLDeclaredType(this.name);

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

/**
 * Convert idl -> chrome library
 */
ChromeLibrary convert(IDLCollector collector) {
  ChromeLibrary chromeLibrary =  new ChromeLibrary();
  chromeLibrary.name = collector.idlNamespace.name;
  chromeLibrary.documentation = "";

  chromeLibrary.types =
      collector.idlNamespace.declaredTypes.map(_convertDeclaredType).toList();
  chromeLibrary.methods =
      collector.idlNamespace.functions.map(_convertMethod).toList();
  chromeLibrary.events =
      collector.idlNamespace.events.map(_convertEvent).toList();

  return chromeLibrary;
}

ChromeDeclaredType _convertDeclaredType(IDLDeclaredType idlDeclaredType) {
  ChromeDeclaredType chromeDeclaredType = new ChromeDeclaredType();

  chromeDeclaredType.name = idlDeclaredType.name;
  chromeDeclaredType.parameters = idlDeclaredType.members.map(_convertProperty).toList();

  int index = chromeDeclaredType.name.lastIndexOf('.');

  if (index != -1) {
    chromeDeclaredType.qualifier = chromeDeclaredType.name.substring(0, index);
    chromeDeclaredType.name = chromeDeclaredType.name.substring(index + 1);
  }

  return chromeDeclaredType;
}

ChromeType _convertProperty(IDLProperty idlProperty) {
  ChromeType chromeType = new ChromeType();
  chromeType.name = idlProperty.name;
  chromeType.type = idlProperty.returnType.name;
  return chromeType;
}

ChromeMethod _convertMethod(IDLFunction idlMethod) {
  ChromeMethod chromeMethod = new ChromeMethod();
  chromeMethod.name = idlMethod.name;
  chromeMethod.returns = _convertType(idlMethod.returnType);
  chromeMethod.params = idlMethod.parameters.map(_convertParameter).toList();

  if (chromeMethod.returns == null) {
    if (!idlMethod.parameters.isEmpty && idlMethod.parameters.last.isCallback) {
      ChromeType chromeType = chromeMethod.params.removeLast();
      chromeMethod.returns = _convertToFuture(chromeType);
    } else {
      chromeMethod.returns = ChromeType.VOID;
    }
  }

  return chromeMethod;
}

ChromeType _convertToFuture(ChromeType chromeType) {
  ChromeType future = new ChromeType();
  future.type = "Future";
  if (chromeType.parameters.length == 1) {
    future.parameters.add(chromeType.parameters.first);
    future.documentation = "";
  } else if (chromeType.parameters.length >= 2) {
    // TODO: we need to correctly handle mapping multiple parameters to a single
    // return
    // runtime.requestUpdateCheck()
    // devtools.inspectedWindow.eval()
    future.parameters.add(ChromeType.JS_OBJECT);
    future.documentation = chromeType.parameters.map(
        (p) => "[${p.name}] ${p.documentation}").join('\n');
  }
  return future;
}

ChromeEvent _convertEvent(IDLEvent idlEvent) {
  ChromeEvent chromeEvent = new ChromeEvent();
  chromeEvent.name = idlEvent.name;
  chromeEvent.type = ChromeType.VAR.type;
  chromeEvent.parameters = idlEvent.params.map(_convertParameter).toList();
  return chromeEvent;
}

ChromeType _convertParameter(IDLParameter parameter) {
  ChromeType param = new ChromeType();
  param.name = parameter.name;
  param.type = idlToDartType(parameter.type.name);
  param.optional = (parameter.optional == null) ? false : parameter.optional;
  return param;
}

ChromeType _convertType(IDLType idlType) {
  if (idlType == null) {
    return null;
  } else {
    ChromeType chromeType = new ChromeType();
    chromeType.name = idlType.name;
    return chromeType;
  }
}

final TYPE_MAP = {
  'DOMString': 'String',
  'object': 'var',
  'boolean': 'bool',
  'long': 'int'
};

String idlToDartType(String type) {
  if (TYPE_MAP.containsKey(type)) {
    return TYPE_MAP[type];
  } else {
    return type;
  }
}
