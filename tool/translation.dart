// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library translation;

import 'idl_model.dart';
import 'src/utils.dart';

final Map _TYPE_NAME_MAP = {
  "string": "String",
  "integer": "int",
  "boolean": "bool"
};

/**
 * An aide to translating from IDL entites and references to Dart specific ones.
 */
class TranslationContext {
  Map overrides = {};

  TranslationContext();

  TranslationContext.fromOverrides(this.overrides);

  bool isAutoTransformType(IDLType type) {
    return type.name == 'integer' || type.name == 'boolean' || type.name == 'string';
  }

  String getContextReference(IDLNamespace namespace) {
    return "_${namespace.name.replaceAll('.', '_')}";
  }

  String getReturnType(IDLType type) {
    if (type == null) {
      return 'void';
    }

    if (_TYPE_NAME_MAP.containsKey(type.name)) {
      return _TYPE_NAME_MAP[type.name];
    }

    // TODO: function
    // TODO: object
    // TODO: array

    // TODO: or JsObject?
    return 'dynamic';
  }

  String getParamType(IDLType type) {
    if (_TYPE_NAME_MAP.containsKey(type.name)) {
      return _TYPE_NAME_MAP[type.name];
    }

    // TODO: function
    // TODO: object
    // TODO: array

    // TODO: or JsObject?
    return 'var';
  }

  /**
   * Returns something suitable for use as a Dart library name. Generally,
   * something like 'system_storage'.
   */
  String getLibraryName(IDLNamespace namespace) {
    return namespace.name.replaceAll('.', '_');
  }

  /**
   * Returns a class name like 'ChromeFooBar'.
   */
  String getClassName(IDLNamespace namespace) {
    if (overrides.containsKey('classNames')) {
      Map names = overrides['classNames'];

      if (names.containsKey(namespace.name)) {
        return "Chrome${names[namespace.name]}";
      }
    }

    return "Chrome${titleCase(toCamelCase(namespace.name))}";
  }
}

/**
 * An abstract superclass for anything that wants to translate from an IDL model
 * into source code.
 */
abstract class Translator {
  TranslationContext ctx;

  Translator(this.ctx);

  String translate(IDLNamespace namespace, {String license, String sourceFilePath});
}
