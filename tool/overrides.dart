
library overrides;

import 'dart:convert';
import 'dart:io';

// TODO: we need to handle declared class renames, to avoid conflicts where
// libraries share the same names of classes, and those classes are semantically
// different.

// serial, socket both define a slightly different ReadInfo
// bluetooth and usb define a different Device

// TODO: rename one class, both, or use a do something with qualified references?

class Overrides {
  Map _m;

  Overrides(): _m = {};

  Overrides.fromFile(File file) {
    _m = JSON.decode(file.readAsStringSync());
  }

  String getClassRename(String className) {
    Map renameMap = _m['classNames'];

    return renameMap == null ? null : renameMap[className];
  }

  bool ignoreDeclaredType(String libraryName, String typeName) {
    Map suppressMap = _m['suppress'];

    if (suppressMap != null) {
      List l = suppressMap[libraryName];

      if (l != null) {
        return l.contains(typeName);
      }
    }

    return false;
  }

}
