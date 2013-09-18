
library overrides;

import 'dart:convert';
import 'dart:io';

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
