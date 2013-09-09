/// A library to generate Dart source code.
library dart_gen;

import 'utility.dart';

// TODO: handle auto-indenting by counting non-comment braces

class Generator {
  String libraryName;

  String _indent = "";
  StringBuffer _buf = new StringBuffer();

  Generator();

  void writeDocs(String docs, {bool preferSingle: false}) {
    if (docs == null) {
      return;
    }

    docs = wrap(docs.trim(), 80 - _indent.length - 3);

    if (!docs.contains('\n') && preferSingle) {
      writeln("/// ${docs}");
    } else {
      writeln("/**");
      writeln(" * ${docs.replaceAll("\n", "\n * ")}");
      writeln(" */");
    }
  }

  void writeln([String str = ""]) => write("${str}\n");

  void write(String str) {
    _buf.write(str.replaceAll("\n", "\n${_indent}"));
  }

  String toString() => _buf.toString();

}
