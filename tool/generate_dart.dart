// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/// A library to generate Dart source code.
library generate_dart;

final int RUNE_SPACE = 32;
final int RUNE_EOL = 10;
final int RUNE_LEFT_CURLY = 123;
final int RUNE_RIGHT_CURLY = 125;

class DartGenerator {
  String libraryName;

  String _indent = "";
  StringBuffer _buf = new StringBuffer();

  bool _previousWasEol = false;

  DartGenerator();

  void writeDocs(String docs, {bool preferSingle: false}) {
    if (docs == null) {
      return;
    }

    docs = wrap(docs.trim(), 80 - _indent.length - 3);

    if (!docs.contains('\n') && preferSingle) {
      _writeln("/// ${docs}", true);
    } else {
      _writeln("/**", true);
      _writeln(" * ${docs.replaceAll("\n", "\n * ")}", true);
      _writeln(" */", true);
    }
  }

  void writeln([String str = ""]) => _write("${str}\n");

  void write(String str) => _write(str);

  void _writeln([String str = "", bool ignoreCurlies = false]) =>
      _write("${str}\n", ignoreCurlies);

  void _write(String str, [bool ignoreCurlies = false]) {
    for (final int rune in str.runes) {
      if (!ignoreCurlies) {
        if (rune == RUNE_LEFT_CURLY) {
          _indent = "${_indent}  ";
        } else if (rune == RUNE_RIGHT_CURLY && _indent.length >= 2) {
          _indent = _indent.substring(2);
        }
      }

      if (_previousWasEol && rune != RUNE_EOL) {
        _buf.write(_indent);
      }

      _buf.write(new String.fromCharCode(rune));

      _previousWasEol = rune == RUNE_EOL;
    }

    //_buf.write(str.replaceAll("\n", "\n${_indent}"));
  }

  String toString() => _buf.toString();
}

/// Wrap a string on column boundaries.
String wrap(String str, [int col = 80]) {
  // The given string could contain newlines.
  // TODO: this need to do a better job of not wrapping things like
  // [foo bar](index.html).
  List lines = str.split('\n');
  return lines.map((l) => _simpleWrap(l, col)).join('\n');
}

/// Wrap a string without newlines.
String _simpleWrap(String str, [int col = 80]) {
  List<String> lines = [];

  while (str.length > col) {
    int index = col;

    while (index > 0 && str.codeUnitAt(index) != RUNE_SPACE) {
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
