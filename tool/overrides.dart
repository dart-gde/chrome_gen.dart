
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
  Map renameNamespaceMap;

  List<String> suppressClassList;
  Map renameClassMap;

  Overrides() {
    _init({});
  }

  Overrides.fromFile(File file) {
    _init(JSON.decode(file.readAsStringSync()));
  }

  void _init(Map m) {
    renameNamespaceMap = m['renameNamespace'];
    if (renameNamespaceMap == null) {
      renameNamespaceMap = {};
    }

    suppressClassList = m['suppressClass'];
    if (suppressClassList == null) {
      suppressClassList = null;
    }

    renameClassMap = m['renameClass'];
    if (renameClassMap == null) {
      renameClassMap = {};
    }
  }

  String namespaceRename(String name) {
    return renameNamespaceMap[name] != null ? renameNamespaceMap[name] : null;
  }

  bool suppressClass(String libraryName, String name) {
    String qualifiedName = '${libraryName}.${name}';
    return suppressClassList.contains(qualifiedName);
  }

  String className(String libraryName, String name) {
    String qualifiedName = '${libraryName}.${name}';
    return renameClassMap[qualifiedName] != null ? renameClassMap[qualifiedName] : name;
  }
}
