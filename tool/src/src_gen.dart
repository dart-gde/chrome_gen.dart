// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/// A library to generate Dart source code.
library src_gen;

final int RUNE_SPACE = 32;
final int RUNE_EOL = 10;
final int RUNE_LEFT_CURLY = 123;
final int RUNE_RIGHT_CURLY = 125;

/**
 * A class used to generate Dart source code. This class facilitates writing out
 * dartdoc comments, automatically manages indent by counting curly braces, and
 * automatically wraps doc comments on 80 char column boundaries.
 */
class DartGenerator {
  static const DEFAULT_COLUMN_BOUNDARY = 80;

  String libraryName;
  final int colBoundary;

  String _indent = "";
  StringBuffer _buf = new StringBuffer();

  bool _previousWasEol = false;

  DartGenerator({this.colBoundary: DEFAULT_COLUMN_BOUNDARY});

  /**
   * Write out the given dartdoc text, wrapping lines as necessary to flow
   * along the column boundary. If [preferSingle] is true, and the docs would
   * fit on a single line, use `///` dartdoc style.
   */
  void writeDocs(String docs, {bool preferSingle: false}) {
    if (docs == null) {
      return;
    }

    docs = wrap(docs.trim(), colBoundary - _indent.length - 3);

    if (!docs.contains('\n') && preferSingle) {
      _writeln("/// ${docs}", true);
    } else {
      _writeln("/**", true);
      _writeln(" * ${docs.replaceAll("\n", "\n * ")}", true);
      _writeln(" */", true);
    }
  }

  /**
   * Write out the given Dart statement and terminate it with an eol. If the
   * statement will overflow the column boundary, attemp to wrap it at
   * reasonable places.
   */
  void writeStatement(String str) {
    if (_indent.length + str.length > colBoundary) {
      // Split the line on the first '('. Currently, we don't do anything
      // fancier then that. This takes the edge off the long lines.
      int index = str.indexOf('(');

      if (index == -1) {
        writeln(str);
      } else {
        writeln(str.substring(0, index + 1));
        writeln("    ${str.substring(index + 1)}");
      }
    } else {
      writeln(str);
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

/// Wrap a string ignoring newlines.
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
