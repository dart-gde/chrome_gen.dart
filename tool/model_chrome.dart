
/**
 * A set of model classes used to represent Chrome libraries, classes, and
 * methods.
 */
library model_chrome;

class ChromeElement {
  String documentation;
}

class ChromeLibrary extends ChromeElement {
  /// This is straight from the json/idl namespace name. I.e., app.window,
  /// system.display, terminalPrivate, devtools.inspectedWindow.
  String name;

  List<ChromeMethod> methods = [];
  List<ChromeProperty> properties = [];
  List<ChromeDeclaredType> types = [];
  List<ChromeEvent> events = [];

  List<String> imports = [];

  void addImport(String str) {
    if (str != null && str != name && !imports.contains(str)) {
      imports.add(str);
      imports.sort();
    }
  }
}

class ChromeProperty extends ChromeElement {
  ChromeType type;
  String name;
  bool nodoc;
}

class ChromeMethod extends ChromeElement {
  ChromeType returns;
  String name;
  List<ChromeType> params = [];

  bool get usesCallback => returns.isFuture;

  // TODO: we depend on all required params being defined before any optional ones
  Iterable<ChromeType> get requiredParams => params.where((p) => !p.optional);
  Iterable<ChromeType> get optionalParams => params.where((p) => p.optional);

  String get description {
    if (documentation == null) {
      return documentation;
    }

    StringBuffer buf = new StringBuffer(documentation);
    buf.write('\n');

    params.forEach((p) {
      if (p.documentation != null) {
        buf.write('\n');
        buf.write("[${p.name}] ${p.documentation}\n");
      }
    });

    if (returns.documentation != null) {
      buf.write("\nReturns:\n${returns.documentation}");
    }

    return buf.toString();
  }

  String toString() => "${name}()";
}

class ChromeEvent extends ChromeType {

}

class ChromeDeclaredType extends ChromeType {
  /// For a class like 'declarativeWebRequest.EditRequestCookie', this
  /// represents the 'declarativeWebRequest' part.
  String qualifier;
}

class ChromeType extends ChromeElement {
  static final ChromeType ANY = new ChromeType(type: 'any');
  static final ChromeType VOID = new ChromeType(type: 'void');
  static final ChromeType JS_OBJECT = new ChromeType(type: 'JsObject');

  String name;
  String type;
  String refName;
  bool optional;
  List<ChromeType> parameters = [];
  List<ChromeProperty> properties = [];

  ChromeType({this.type});

  bool get isAny => type == 'var';
  bool get isReferencedType => isAny && refName != null;
  bool get isVoid => type == 'void';
  bool get isFuture => type == 'Future';
  bool get isList => type == 'List';
  bool get isMap => type == 'Map';
  bool get isString => type == 'String';
  bool get isInt => type == 'int';
  bool get isBool => type == 'bool';

  String toParamString() {
    if (isAny && !isReferencedType) {
      return type;
    } else if (parameters.isEmpty) {
      return refName != null ? refName : type;
    } else {
      return "${type}<${parameters.map((t) => t.toParamString()).join(', ')}>";
    }
  }

  String toReturnString() {
    if (isReferencedType) {
      return refName;
    } else if (isAny) {
      return 'dynamic';
    } else if (parameters.isEmpty) {
       return type;
    } else {
      return "${type}<${parameters.map((t) => t.toReturnString()).join(', ')}>";
    }
  }

  String toString() => toParamString();
}
