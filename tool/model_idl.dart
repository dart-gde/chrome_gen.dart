// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library model_idl;

import 'model_chrome.dart';

// TODO: this model needs to be re-written in-line with the needs of the web_idl_parser.

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
  IDLNamespace idlNamespace;
  namespace(l) => l; // Must return type passed for parser to continue.
  interface(l) => l; // Must return type passed for parser to continue.
  interfaceMember(l) => l; // Must return type passed for parser to continue.
  dictionary(l) => l; // Must return type passed for parser to continue.
  dictionaryMember(l) => l; // Must return type passed for parser to continue.
  enumStatement(l) => l; // Must return type passed for parser to continue.
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
  return new ChromeLibrary()..name = "notImplemented";
}

_convertDeclaredType() {
  throw "Not Implemented";
}

_convertMethod() {
  throw "Not Implemented";
}

_convertEvent() {
  throw "Not Implemented";
}