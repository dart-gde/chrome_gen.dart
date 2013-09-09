/// A library to generate Dart source code.
library dart_gen;

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

    docs = _wrap(docs.trim(), 80 - _indent.length - 3);

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

// TODO: this needs to do a better job of preserving existing newlines
String _wrap(String str, [int col = 80]) {
  List<String> lines = [];

  while (str.length > col) {
    int eolIndex = str.indexOf('\n');
    if (eolIndex != -1 && eolIndex <= col) {
      lines.add(str.substring(0, eolIndex).trim());
      str = str.substring(eolIndex).trim();
      continue;
    }

    int index = col;

    while (index > 0 && str.codeUnitAt(index) != 32) {
      index--;
    }

    if (index == 0) {
      index = str.indexOf(' ');

      if (index == -1) {
        lines.add(str);
        str = '';
      } else {
        lines.add(str.substring(0, index).trim());
        str = str.substring(index).trim();
      }
    } else {
      lines.add(str.substring(0, index).trim());
      str = str.substring(index).trim();
    }
  }

  if (str.length > 0) {
    lines.add(str);
  }

  return lines.join('\n');
}
