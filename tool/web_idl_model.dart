
library web_idl_model;

import 'chrome_model.dart';

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
  List namespace(List l, StringBuffer sb) => l; // Must return type passed for parser to continue.
  List interface(List l) => l; // Must return type passed for parser to continue.
  List interfaceMember(List l, StringBuffer sb) => l; // Must return type passed for parser to continue.
  List dictionary(List l) => l; // Must return type passed for parser to continue.
  List dictionaryMember(List l, StringBuffer sb) => l; // Must return type passed for parser to continue.
  List dictionaryMethod(List l, StringBuffer sb) => l; // Must return type passed for parser to continue.
  List enumStatement(List l, StringBuffer sb) => l; // Must return type passed for parser to continue.
  List callback(List l, StringBuffer sb) => l; // Must return type passed for parser to continue.
}

class IDLCollectorChrome implements IDLCollector {
  IDLNamespace idlNamespace = new IDLNamespace();
  List _functions = [];
  List _dictionaryMembers = [];
  List _dictionaryMethods = [];

  List namespace(l, StringBuffer sb) {
    idlNamespace.name = l[2].join('.');
    sb.clear();

    // Must return type passed for parser to continue.
    return l;
  }

  List interface(List l) {
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

  IDLFunction _functionParser(List l, doc) {
    var ret = l[1][0];
    var name = l[1][1];
    var arg = l[1][2];
    IDLFunction function = new IDLFunction(name, doc);

    List recursiveParams = [];

    if (arg != EMPTY) {
      var func = arg[0];
      IDLParameter param = _reduceParameter(func);
      function.parameters.add(param);

      if (arg.length > 1) {
        _parameterParser(arg[1], recursiveParams);
      }
    }

    if (!recursiveParams.isEmpty) {
      function.parameters.addAll(recursiveParams);
    }

    function.returnType = _reduceParameter([EMPTY, [[ret], null, null]]).type;

    return function;
  }

  List interfaceMember(List l, StringBuffer sb) {
    IDLFunction function = _functionParser(l, sb.toString());
    sb.clear();
    _functions.add(function);

    // Must return type passed for parser to continue.
    return l;
  }

  List dictionary(List l) {
    String name = l[1];
    IDLDeclaredType declaredType = new IDLDeclaredType(name);
    declaredType.members.addAll(_dictionaryMembers);
    _dictionaryMembers = [];

    declaredType.functions.addAll(_dictionaryMethods);
    _dictionaryMethods = [];

    idlNamespace.declaredTypes.add(declaredType);

    // Must return type passed for parser to continue.
    return l;
  }

  List dictionaryMember(List l, StringBuffer sb) {
    String name = l[1];
    IDLProperty member = new IDLProperty(name);
    sb.clear();
    var type = l[0][0];

    if (type is List) {
      type = type[0];
    }

    member.returnType = new IDLType(type);
    _dictionaryMembers.add(member);
    // Must return type passed for parser to continue.
    return l;
  }

  List dictionaryMethod(List l, StringBuffer sb) {
    IDLFunction function = _functionParser(l, sb.toString());
    sb.clear();
    _dictionaryMethods.add(function);

    // Must return type passed for parser to continue.
    return l;
  }

  List enumStatement(List l, StringBuffer sb) {
    // Example from usb [enum, Direction, [in, [,, out, EMPTY]], ;]
    //    print("enumStatement:");
    //    print(l);

    String enumName = l[1];
    var arg = l[2];
    IDLEnum idlEnum = new IDLEnum(enumName);
    idlEnum.description = sb.toString();
    sb.clear();

    valueParser(a) {
      var value;

      // Continue until EMPTY is hit
      if (a == EMPTY) return;

      if (a.length == 4) {
        // recursive
        value = a[2];
        // Create value type and add to list of IDLEnum
        //idlEnum.enumValues.add(value);
        IDLProperty idlValue = new IDLProperty(value);
        idlEnum.members.add(idlValue);

        if (a[3] != EMPTY) {
          valueParser(a[3]);
          return;
        } else {
          return;
        }
      }

      if (a.length == 5) {
        // recursive
        value = a[3];
        // Create value type and add to list of IDLEnum
        //idlEnum.enumValues.add(value);
        IDLProperty idlValue = new IDLProperty(value);
        idlEnum.members.add(idlValue);

        if (a[4] != EMPTY) {
          valueParser(a[4]);
          return;
        } else {
          return;
        }
      }

      // TODO: do we hit this type of condition or should we
      // just ignore and/or throw error.
      if (a.length == 3){
        value = a[2];
        IDLProperty idlValue = new IDLProperty(value);
      }
    };

    if (arg != EMPTY) {
      // Parse the first enum value
      var value = arg[1];
      IDLProperty idlValue = new IDLProperty(value);
      idlEnum.members.add(idlValue);

      if (arg[3] is List) {
        valueParser(arg[3]);
      } else {
        valueParser(arg[2]);
      }
    }

    idlNamespace.enumTypes.add(idlEnum);
    // Must return type passed for parser to continue.
    return l;
  }

  IDLParameter _reduceParameter(List func) {
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

      var idlType = IDLType.VAR;
      bool optional = null;

      if (type is List) {
        type = type[0];
        if (type is List) {
          type = type[0];
        }

        idlType = new IDLType(type);
        optional = false;
      } else if (type is String) {
        if (type == "optional") {
          optional = true;
        } else {
          optional = false;
        }

        if (func[1][1] is List) {
          var type = func[1][1][0];
          if (type is List) {
            type = type[0];
          }
          idlType = new IDLType(type);
        }
      }

      return new IDLParameter(name, optional, idlType);
    }
  }

  void _parameterParser(a, List recursiveParams) {
    var func;

    if (a == EMPTY) return;

    if (a.length == 3) {
      // recursive
      func = a[1];
      IDLParameter param = _reduceParameter(func);
      recursiveParams.add(param);

      if (a[2] != EMPTY) {
        _parameterParser(a[2], recursiveParams);
        return;
      } else {
        return;
      }
    }

    if (a.length == 2) {
      func = a[1];
    }
  }

  List callback(List l, StringBuffer sb) {
    IDLFunction function = new IDLFunction(l[0], sb.toString());
    sb.clear();
    var arg = l[3];
    List recursiveParams = [];

    if (arg != EMPTY) {
      IDLParameter param = _reduceParameter(arg[0]);
      function.parameters.add(param);

      if (arg.length > 1) {
        _parameterParser(arg[1], recursiveParams);
      }
    }

    // This occurs when a single callback has mutiple parameters, e.g.:
    //   GetInfoCallback(OutputDeviceInfo outputInfo, InputDeviceInfo inputInfo)
    //   EntriesCallback(object entry, object fileEntries)
    if (recursiveParams.isNotEmpty) {
      function.parameters.addAll(recursiveParams);
    }

    idlNamespace.callbacks.add(function);

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
  List<IDLEnum> enumTypes = []; // List of enums declared in IDL
  List<IDLFunction> callbacks = [];

  // Dont know what the use of properties is vs declaredTypes in terms of
  // WebIDL.
  //List<IDLProperty> properties = [];

  IDLFunction findCallback(String name) {
    return callbacks.firstWhere((c) => c.name == name, orElse: () => null);
  }

  String toString() => name;
}

/**
 * IDL enumeration class.
 */
class IDLEnum extends IDLDeclaredType {
  List<IDLProperty> get enumValues => this.members;
  void set enumValues(value) => this.members = value;
  IDLEnum(name) : super(name);
}

class IDLFunction {
  String name;
  String _description;
  List<IDLParameter> parameters = [];
  IDLType returnType;

  IDLFunction(this.name, [this._description]);

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
  List<IDLFunction> functions = [];

  IDLDeclaredType(this.name);

  String toString() => name;
}

class IDLParameter {
  final String name;
  final IDLType type;
  final String description = null;
  final bool optional;

  IDLParameter(this.name, this.optional, this.type) {
    assert(optional != null);

    // TODO: these asserts break tests...weird
    //assert(type != null);
    //assert(name != null);
  }

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
  static IDLType VAR = new IDLType('var');

  /// The type name, i.e. string, integer, boolean, object, ...
  final String name;

  /// Additional type info, from the $ref field. e.g. 'runtime.Port'
  final String refName;

  factory IDLType(String name) {
    if (name == null || name == 'void') {
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

  IDLType.fromRef(this.refName) :
    name = 'object';

  IDLType._(this.name) :
    refName = null;

  bool get isFunction => name == 'function';
  bool get isObject => name == 'object';
  bool get isArray => name == 'array';

  String toString() => refName != null ? "${name}:${refName}" : name;
}

/**
 * Convert idl -> chrome library
 */
ChromeLibrary convert(IDLCollector collector) {
  return new IDLConverter().convert(collector);
}

class IDLConverter {
  IDLNamespace namespace;

  ChromeLibrary convert(IDLCollector collector) {
    namespace = collector.idlNamespace;

    ChromeLibrary library =  new ChromeLibrary(namespace.name);
    library.documentation = cleanDocComments(namespace.description);

    library.types.addAll(namespace.declaredTypes.map(_convertDeclaredType));
    library.methods.addAll(namespace.functions.map(_convertMethod));
    library.events.addAll(namespace.events.map(_convertEvent));
    library.enumTypes.addAll(namespace.enumTypes.map(_convertEnum));

    return library;
  }

  List<ChromeMethod> _convertDeclaredTypeMethods(IDLDeclaredType idlDeclaredType) {
    var methods = idlDeclaredType.functions.map(_convertMethod).toList();
    return methods;
  }

  ChromeDeclaredType _convertDeclaredType(IDLDeclaredType idlDeclaredType) {
    ChromeDeclaredType chromeDeclaredType = new ChromeDeclaredType();

    chromeDeclaredType.name = idlDeclaredType.name;
    chromeDeclaredType.documentation = cleanDocComments(idlDeclaredType.description);
    chromeDeclaredType.properties = idlDeclaredType.members.map(_convertProperty).toList();
    chromeDeclaredType.methods = idlDeclaredType.functions.map(_convertMethod).toList();

    int index = chromeDeclaredType.name.lastIndexOf('.');

    if (index != -1) {
      chromeDeclaredType.qualifier = chromeDeclaredType.name.substring(0, index);
      chromeDeclaredType.name = chromeDeclaredType.name.substring(index + 1);
    }

    return chromeDeclaredType;
  }

  ChromeProperty _convertProperty(IDLProperty idlProperty) {
    ChromeProperty property = new ChromeProperty(idlProperty.name, _convertType(idlProperty.returnType));
    return property;
  }

  ChromeEnumType _convertEnum(IDLEnum idlProperty) {
    ChromeEnumType chromeEnumType = new ChromeEnumType();
    chromeEnumType.name = idlProperty.name;
    chromeEnumType.documentation = cleanDocComments(idlProperty.description);
    idlProperty.enumValues.forEach((IDLProperty value) {
      ChromeEnumEntry chromeEnumEntry = new ChromeEnumEntry();
      chromeEnumEntry.name = value.name;
      chromeEnumType.values.add(chromeEnumEntry);
    });
    return chromeEnumType;
  }

  ChromeMethod _convertMethod(IDLFunction idlMethod) {
    ChromeMethod chromeMethod = new ChromeMethod();
    chromeMethod.name = idlMethod.name;
    chromeMethod.documentation = cleanDocComments(idlMethod.description);
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

    List<ChromeType> params = chromeType.parameters;

    // Convert the named callback type into the actual callback definition.
    IDLFunction callback = namespace.findCallback(chromeType.refName);

    if (callback != null) {
      params = callback.parameters.map(_convertParameter).toList();
    }

    if (params.length == 1) {
      future.parameters.add(params.first);
      future.documentation = cleanDocComments(callback.description);
    } else if (params.length >= 2) {
      // TODO: we need to correctly handle mapping multiple parameters to a single
      // return, ala runtime.requestUpdateCheck() and devtools.inspectedWindow.eval().
      future.parameters.add(ChromeType.JS_OBJECT);
      future.documentation = params.map(
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
    param.refName = idlToDartRefName(parameter.type);
    param.optional = (parameter.optional == null) ? false : parameter.optional;
    return param;
  }

  ChromeType _convertType(IDLType idlType) {
    if (idlType == null) {
      return null;
    } else {
      ChromeType chromeType = new ChromeType();
      chromeType.type = idlToDartType(idlType.name);
      chromeType.refName = idlToDartRefName(idlType);
      return chromeType;
    }
  }
}

final TYPE_MAP = {
  'DOMString': 'String',
  'boolean': 'bool',
  'double': 'double',
  'long': 'int'
};

String idlToDartType(String type) {
  if (TYPE_MAP.containsKey(type)) {
    return TYPE_MAP[type];
  } else {
    return 'var';
  }
}

String idlToDartRefName(IDLType type) {
  if (TYPE_MAP.containsKey(type.name)) {
    return null;
  } else if (type.refName != null) {
    return type.refName;
  } if (type.name == 'object') {
    return null;
  } else {
    return type.name;
  }
}

String cleanDocComments(String str) {
  if (str == null) {
    return null;
  }

  str = str.trim();

  if (str.isEmpty) {
    return null;
  }

  str = str.replaceAll('\n ', ' ');
  str = str.replaceAll(new RegExp('\n\n+'), '\n');

  //  |foo| ==> [foo]
  str = str.replaceAllMapped(
      new RegExp(r" \|([\.\w]*)\|"),
      (Match m) => "\n[${m.group(1)}]");


  str = str.replaceAll('<code>', '`');
  str = str.replaceAll('</code>', '`');

  str = str.replaceAll('<em>', '_');
  str = str.replaceAll('</em>', '_');

  str = str.replaceAll('<strong>', '*');
  str = str.replaceAll('</strong>', '*');

  str = str.replaceAll('<var>', '[');
  str = str.replaceAll('</var>', ']');

  str = str.replaceAll('&mdash;', '-');

  return str.replaceAll('/*', '/');
}
