// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library translation;

import 'idl_model.dart';
import 'utils.dart';

class TranslationContext {
  Map overrides = {};

  TranslationContext();

  TranslationContext.fromOverrides(this.overrides);

  String getLibraryName(IDLNamespace namespace) {
    return fromCamelCase(namespace.name);
  }

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

abstract class Translator {
  TranslationContext ctx;

  Translator(this.ctx);

  String translate(IDLNamespace namespace, {String license, String sourceFilePath});
}
