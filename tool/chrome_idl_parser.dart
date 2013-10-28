library chrome_idl_parser;

import 'package:parsers/parsers.dart';
import 'package:persistent/persistent.dart';

import 'chrome_idl_model.dart';

final reservedNames = ["enum", "callback", "optional", "object",
                       "static", "dictionary"];

/**
 * Map the namespace declaration parse to a [IDLNamespaceDeclaration]
 */
// TODO: not finished mapping.
IDLNamespaceDeclaration idlNamespaceDeclarationMapping(
  List<String> doc, attribute, _, String name, List body, __) =>
    new IDLNamespaceDeclaration(name, attribute, body, doc);

/**
 * Mapping of callback declaration.
 */
IDLCallbackDeclaration idlCallbackDeclarationMapping(
  List<String> documentation, _, String name, __,
  List<IDLParameter> parameters, ___) =>
    new IDLCallbackDeclaration(name, parameters, documentation: documentation);

IDLTypeDeclaration idlTypeDeclarationMapping(List<String> documentation,
  Option attributeMaybe, _, String name, List body, __)  {
  IDLAttributeDeclaration attribute =
      attributeMaybe.isDefined ? attributeMaybe.value : null;
  final List<IDLField> members = body.where((e) => e is IDLField).toList();
  final List<IDLMethod> methods = body.where((e) => e is IDLMethod).toList();
  return new IDLTypeDeclaration(name, members, methods: methods,
      attribute: attribute, documentation: documentation);
}

IDLMethod idlMethodParameterMapping(List<String> documentation,
  Option<IDLAttributeDeclaration> attribute, _, IDLType type, String name,
  List<IDLParameter> parameters, ___) =>
    new IDLMethod(name, type, parameters,
        attribute: attribute.isDefined ? attribute.value : null,
        documentation: documentation);

/**
 * Mapping of parameter with optional flag.
 */
IDLParameter idlParameterMapping(String name, IDLType type,
  bool isOptional) =>
    new IDLParameter(name, type, isOptional: isOptional);

/*
 * Mapping the type of an attribute.
 */
IDLType _idlAttributeTypeMapping(IDLAttributeDeclaration attribute) {
  IDLAttributeTypeEnum t = attribute.attributes[0].attributeType;
  if (t != IDLAttributeTypeEnum.INSTANCE_OF) {
    throw new ArgumentError(
        "attribute was not IDLAttributeTypeEnum.INSTANCE_OF");
  }
  return new IDLType(attribute.attributes[0].attributeValue);
}

/**
 * Mapping of parameter with attribute based type specificed.
 */
IDLParameter idlParameterAttributeBasedTypeMapping(String name,
  IDLAttributeDeclaration attribute) {
  return new IDLParameter(name,
      _idlAttributeTypeMapping(attribute),
      attribute: attribute);
}

/**
 * Mapping of field based type specificed.
 */
IDLField idlFieldBasedTypeMapping(List<String> documentation,
  Option attributeMaybe, IDLType type, Option<String> optional, String name,
  _) => new IDLField(name, type, isOptional: optional.isDefined,
        documentation: documentation,
        attribute: attributeMaybe.isDefined ? attributeMaybe.value : null);

/**
 * Mapping of field with attribute based type specificed.
 */
IDLField idlFieldAttributeBasedTypeMapping(List<String> documentation,
  IDLAttributeDeclaration attribute, __, String name, ___) =>
      new IDLField(name, _idlAttributeTypeMapping(attribute),
          attribute: attribute, documentation: documentation);
/**
 * Mapping of type.
 */
IDLType idlTypeMapping(String name, bool isArray) =>
    new IDLType(name, isArray: isArray);

/**
 * Method to help find IDLAttributeTypeEnum by String name.
 */
IDLAttributeTypeEnum _resolveEnum(String name) {
  var attributeEnum = IDLAttributeTypeEnum.values.singleWhere(
      (IDLAttributeTypeEnum e) {
        return e.type == name;
      });

  if (attributeEnum == null) {
    throw new ArgumentError("$name cannot be resolved IDLAttributeTypeEnum");
  }

  return attributeEnum;
}

/**
 * Enum declaration
 */
IDLEnumDeclaration idlEnumDeclarationMapping(List<String> documentation,
  Option attribute, _, String name, List<IDLEnumValue> enumValues, __) =>
      new IDLEnumDeclaration(name, enumValues,
          attribute: attribute.isDefined ? attribute.value : null,
          documentation: documentation);

/**
 * Enum value
 */
IDLEnumValue idlEnumValueMapping(List<String> documentation, String name) =>
    new IDLEnumValue(name, documentation: documentation);

/**
 * Attribute declaration
 */
IDLAttributeDeclaration idlAttributeDeclarationMapping(List attributes) =>
  new IDLAttributeDeclaration(attributes);

/**
 *  Attribute where [name=value]
 */
IDLAttribute idlAttributeAssignedValueMapping(String name, _, String value) =>
    new IDLAttribute(_resolveEnum(name), attributeValue: value);

/**
 *  Attribute where [name=(1,2)]
 */
IDLAttribute idlAttributeAssignedMultiValueMapping(
                                           String name, _, List<int> values) =>
    new IDLAttribute(_resolveEnum(name), attributeValues: values);

/**
 * Attribute where [name]
 */
IDLAttribute idlAttributeMapping(String name) =>
    new IDLAttribute(_resolveEnum(name));

class ChromeIDLParser extends LanguageParsers {
  ChromeIDLParser() : super(reservedNames: reservedNames,
                      /**
                       * Dont handle comments, instead let the parser
                       * hande them with [docString]
                       */
                      commentStart: "",
                      commentEnd: "",
                      commentLine: "");

  /**
   * Parse the namespace.
   */
  Parser get namespaceDeclaration =>
      docString
      + attributeDeclaration
      + reserved["namespace"]
      + identifier
      + braces(namespaceBody)
      + semi
      ^ idlNamespaceDeclarationMapping;

  /**
   * The body of the namespace. This could include function, type, event,
   * callback and enum declarations.
   */
  Parser get namespaceBody => _namespaceBody.many;

  Parser get _namespaceBody => functionDeclaration
                             | typeDeclaration
                             | eventDeclaration
                             | callbackDeclaration
                             | enumDeclaration;

  /**
   * Parse the interface Functions.
   */
  Parser get functionDeclaration => methods.many;
  Parser get methods => _methods;
  Parser get _methods => null;

  /**
   * Parse the interface Events.
   */
  Parser get eventDeclaration => methods.many;

  /**
   * Parse the dictionary definitions.
   */
  // Note: Also need to parse methods within a type declaration.
  // This happens in IDL such as app_window.idl.
  // What we should do is in the mapping method
  // check the runtime type and put seperate them
  // between methods and members.
  Parser get typeDeclaration =>
      docString
      + attributeDeclaration.maybe
      + reserved["dictionary"]
      + identifier
      + braces(typeBody)
      + semi ^ idlTypeDeclarationMapping;

  Parser get typeBody => _typeBody.many;

  Parser get _typeBody =>
      // [instanceOf=FileEntry] object entry;
      (docString + attributeDeclaration + reserved["object"] + identifier + semi
          ^ idlFieldAttributeBasedTypeMapping)
      |
      // LaunchItem[]? items; or DOMString type;
      (docString + attributeDeclaration.maybe + fieldType + symbol('?').maybe + identifier + semi
          ^ idlFieldBasedTypeMapping)
      |
      // static void resizeTo(long width, long height);
      // [nocompile] static Bounds getBounds();
      // Return type IDLMethod
      (docString
          + attributeDeclaration.maybe
          + reserved["static"]
          + fieldType
          + identifier
          + parens(fieldMethodParameters.sepBy(comma))
          + semi
          ^ idlMethodParameterMapping);

  Parser get fieldMethodParameters =>
      // [instanceOf=Entry] object entry
      (attributeDeclaration + reserved["object"] + identifier
        ^ (attribute, _, name) =>
            idlParameterAttributeBasedTypeMapping(name, attribute))
        |
        // DOMString responseUrl or DOMString[] urls
        (fieldType + identifier ^ (type, name) =>
            idlParameterMapping(name, type, false));

  // TODO: refactor with callbackParameterType
  Parser get fieldType =>
      // Device[]
      (identifier + symbol('[') + symbol(']') ^ (name, __, ___) =>
          idlTypeMapping(name, true))
      |
      // Device
      (identifier ^ (name) => idlTypeMapping(name, false));

  /**
   * Parse the callback definitions.
   */
  Parser get callbackDeclaration => _callbackDeclaration.many;

  /**
   * Parse a callback definition.
   */
  Parser get _callbackDeclaration =>
      docString
      + reserved["callback"]
      + identifier
      + symbol("=")
      + callbackMethod
      + semi ^ idlCallbackDeclarationMapping;

  Parser get callbackMethod =>
      // TODO: rename callbackParameters to callbackParameter?
      // NOTE: we used void as a symbol instead of a reserved keyword
      // for shortcut on other parsers. Proper parser should reserve
      // "void".
      // void (StorageUnitInfo[] info)
      symbol("void") + parens(callbackParameters.sepBy(comma))
      ^ (_, parameters) => parameters;

  Parser get callbackParameters =>
      // [instanceOf=Entry] object entry
      (attributeDeclaration + reserved["object"] + identifier
          ^ (attribute, __, name) =>
              idlParameterAttributeBasedTypeMapping(name, attribute))
      |
      // optional DOMString responseUrl
      (reserved["optional"] + callbackParameterType + identifier
          ^ (_, type, name) => idlParameterMapping(name, type, true))
      |
      //  Device device or Device[] result
      (callbackParameterType + identifier
          ^ (type, name) => idlParameterMapping(name, type, false));

  Parser get callbackParameterType =>
      // Device[]
      (identifier + symbol('[') + symbol(']') ^ (name, __, ___) =>
          idlTypeMapping(name, true))
      |
      // Device
      (identifier ^ (name) => idlTypeMapping(name, false));

  /**
   * Parse the enum declarations.
   */
  Parser get enumDeclaration =>
      docString
      + attributeDeclaration.maybe
      + reserved["enum"]
      + identifier
      + braces(enumBody.sepBy(comma))
      + semi
      ^ idlEnumDeclarationMapping;

  /**
   * Parse the enum values.
   */
  Parser get enumBody =>
      docString + identifier ^ idlEnumValueMapping;

  /**
   * Parse the attribute declaration.
   */
  Parser get attributeDeclaration =>
      brackets(attribute.sepBy(comma)) ^ idlAttributeDeclarationMapping;

  /**
   * Parse the attribute.
   */
  Parser get attribute =>
      // Attribute where name=value
      (identifier + symbol('=') + identifier
      ^ idlAttributeAssignedValueMapping)
      // Attribute where [name=(1,2)]
      | (identifier + symbol('=') + parens(intLiteral.sepBy(comma))
      ^ idlAttributeAssignedMultiValueMapping)
      // Attribute where [name]
      | (identifier ^ idlAttributeMapping);

  /**
   * Parser all documentation strings and spaces between.
   */
  Parser get docString => lexeme(_docString).many;
  Parser get _docString =>
        everythingBetween(string('//'), string('\n'))
      | everythingBetween(string('/**'), string('*/'))
      | everythingBetween(string('/*'), string('*/'));
}
