library chrome_idl_parser;

// TODO: create seperate model file.

import 'package:parsers/parsers.dart';

// note: choose between using reserved names or keywords
final reservedNames = [];
final keywords = [];
final typeMapping = {};

// namespace
class IDLNamespaceDeclaration {
  /**
   * [name] of the declared namespace.
   */
  final String name;

  /**
   *
   */
  final IDLAttributeDeclaration attribute;

  /**
   * The body will contain one of the following types:
   * IDLFunctionDeclaration,
   * List<IDLTypeDeclaration>,
   * IDLEventDeclaration,
   * List<IDLCallbackDeclaration>,
   * List<IDLEnumDeclaration>.
   */
  final List body;

  /**
   * Namespace documentation
   */
  final List<String> documentation;
  IDLNamespaceDeclaration(this.name, this.attribute, this.body,
      this.documentation);

  String toString() =>
      "IDLNamespaceDeclaration($name, $attribute, $body, $documentation)";
}

// interface Functions
class IDLFunctionDeclaration {
  final String name = "Functions";
  final List<IDLMethod> methods;
  final List<String> documentation;
  String toString() => "IDLFunctionDeclaration()";
}

// dictionary definition
class IDLTypeDeclaration {
  final List<IDLMember> members;
  final List<String> documentation;
  String toString() => "IDLTypeDeclaration()";
}

// interface Events
class IDLEventDeclaration {
  final String name = "Events";
  final List<IDLMethod> methods;
  final List<String> documentation;
  String toString() => "IDLEventDeclaration()";
}

// callback definition
class IDLCallbackDeclaration {
  final String name;
  // TODO: fill out the rest of the callback signature
  final List<String> documentation;
  String toString() => "IDLCallbackDeclaration()";
}

// enum definition
class IDLEnumDeclaration {
  final String name;
  final List<IDLEnumValue> enums;
  final List<String> documentation;
  String toString() => "IDLEnumDeclaration()";
}

class IDLAttributeDeclaration {
  final List<IDLAttribute> attributes;
  IDLAttributeDeclaration(this.attributes);
  String toString() => "IDLAttributeDeclaration($attributes)";
}

class IDLMethod {
  final String name;
  final List<IDLParameter> parameters;
  final IDLType returnType;
  final List<String> documentation;
  String toString() => "IDLMethod()";
}

class IDLMember {
  final String name;
  final IDLType type;
  final List<String> documentation;
  String toString() => "IDLMember()";
}

class IDLParameter {
  final String name;
  final IDLType type;
  final bool optional;
  final bool isArray;
  String toString() => "IDLParameter()";
}

/**
 * Enumeration of the different types of attributes used in the chrome apps
 * idls.
 */
class IDLAttributeTypeEnum {

  final String type;

  const IDLAttributeTypeEnum._(this.type);

  static const List<IDLAttributeTypeEnum> values = const [INSTANCE_OF,
    SUPPORTS_FILTER, INLINE_DOC, NODOC, NOCOMPILE, LEGAL_VALUES, PERMISSIONS,
    MAX_LISTENERS];

  /**
   * Example:
   *
   *  [instanceOf=Window]
   */
  static const INSTANCE_OF = const IDLAttributeTypeEnum._("instanceOf");

  /**
   * Example:
   *
   *   [supportsFilters=true]
   */
  static const SUPPORTS_FILTER =
      const IDLAttributeTypeEnum._("supportsFilters");

  /**
   * Example:
   *
   *   [inline_doc]
   */
  static const INLINE_DOC = const IDLAttributeTypeEnum._("inline_doc");

  /**
   * Example:
   *
   *   [nodoc]
   */
  static const NODOC = const IDLAttributeTypeEnum._("nodoc");

  /**
   * Example:
   *
   *   [nocompile]
   *
   * also sometimes paired with [nocompile, nodoc]
   */
  static const NOCOMPILE = const IDLAttributeTypeEnum._("nocompile");

  /**
   * Example:
   *
   *   [legalValues=(16,32)]
   */
  static const LEGAL_VALUES = const IDLAttributeTypeEnum._("legalValues");

  /**
   * Example:
   *
   *   [permissions=downloads]
   */
  static const PERMISSIONS = const IDLAttributeTypeEnum._("permissions");

  /**
   * Example:
   *
   *   [maxListeners=1]
   */
  static const MAX_LISTENERS = const IDLAttributeTypeEnum._("maxListeners");
}

class IDLAttribute {
  /**
   * The type of attribute.
   */
  final IDLAttributeTypeEnum attributeType;
  /**
   * The possible value used on assignment to the attribute.
   */
  final String attributeValue;

  /**
   * The possible [List] of values used on assignment to the attribute.
   */
  final List attributeValues;

  IDLAttribute(this.attributeType, {this.attributeValue, this.attributeValues});

  String toString() => "IDLAttribute()";
}

class IDLEnumValue {
  final String name;
  final String value;

  String toString() => "IDLEnumValue()";
}

class IDLType {
  final String name;
  String toString() => "IDLType()";
}


/**
 * Map the namespace declaration parse to a [IDLNamespaceDeclaration]
 */
IDLNamespaceDeclaration idlNamespaceDeclarationMapping(
  List<String> doc, attribute, _, String name, List body, __) =>
new IDLNamespaceDeclaration(name, attribute, body, doc);

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
 * Attribute declaration
 */
IDLAttributeDeclaration attributeDeclarationMapping(List attributes) =>
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
   * Parse the namespace
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
   * Parse the interface Functions
   */
  Parser get functionDeclaration => methods.many;
  Parser get methods => _methods;
  Parser get _methods => null;

  /**
   * Parse the dictionary definitions
   */
  Parser get typeDeclaration => null;
  Parser get typeBody => fieldDeclared.many;
  Parser get fieldDeclared => null;

  /**
   * Parse the interface Events
   */
  Parser get eventDeclaration => methods.many;

  /**
   * Parse the callback definitions
   */
  Parser get callbackDeclaration => null;

  /**
   * Parse the enum declarations
   */
  Parser get enumDeclaration => null;
  Parser get enumBody => enumValue;
  Parser get enumValue => null;

  /**
   * Parse the attribute declaration.
   */
  Parser get attributeDeclaration =>
      brackets(attribute.sepBy(comma)) ^ attributeDeclarationMapping;

  /**
   * Parse the attribute
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
  Parser get docString => lexeme(_docString.many);
  Parser get _docString =>
        everythingBetween(string('//'), string('\n'))
      | everythingBetween(string('/**'), string('*/'))
      | everythingBetween(string('/*'), string('*/'));

  Parser get parameter => null;
  Parser type() => null;
}