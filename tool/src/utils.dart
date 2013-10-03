
library utility;

import 'dart:io';


/** A pair of values. */
class Pair<E, F> {
  E first;
  F last;

  Pair(this.first, this.last);

  String toString() => '($first, $last)';

  bool operator==(other) {
    if (other is! Pair) return false;
    return other.first == first && other.last == last;
  }

  int get hashCode => first.hashCode ^ last.hashCode;
}

String convertJSLibNameToFileName(String jsLibName) {
  jsLibName = jsLibName.replaceAll('devtools.', 'devtools_');
  jsLibName = jsLibName.replaceAll('.', '_');

  jsLibName = jsLibName.replaceAllMapped(
      new RegExp(r"[A-Z]"),
      (Match m) => "_${m.group(0).toLowerCase()}");

  return jsLibName;
}

/// foo.bar ==> fooBar
String toCamelCase(String str) {
  return str.replaceAllMapped(
      new RegExp(r"\.([a-z])"),
      (Match m) => "${m.group(1).toUpperCase()}");
}

/// fooBar ==> foo_bar
String fromCamelCase(String str) {
  return str.replaceAllMapped(
      new RegExp(r"[A-Z]"),
      (Match m) => "_${m.group(0).toLowerCase()}");
}

/// foo ==> Foo
String titleCase(String str) {
  return str.substring(0, 1).toUpperCase() + str.substring(1);
}

String convertHtmlToDartdoc(String str) {
  if (str == null) {
    return null;
  }

  str = str.replaceAll('<code>', '`');
  str = str.replaceAll('</code>', '`');

  str = str.replaceAll('<em>', '_');
  str = str.replaceAll('</em>', '_');

  str = str.replaceAll('<strong>', '*');
  str = str.replaceAll('</strong>', '*');

  str = str.replaceAll('<var>', '[');
  str = str.replaceAll('</var>', ']');

  str = str.replaceAll('&mdash;', '-');

  // $ref:runtime.onConnect ==> [runtime.onConnect]
  str = str.replaceAllMapped(
      new RegExp(r"\$ref:([\.\w]*)"),
      (Match m) => "[${m.group(1)}]");

  // <a href='content_scripts.html#pi'>programmatic injection</a> ==> [foo](url)
  str = str.replaceAllMapped(
      new RegExp(r"""<a href=['"](\S*)['"]>([\w ]*)</a>"""),
      (Match m) => "[${m.group(2)}](${m.group(1)})");

  return str;
}

String getFileName(FileSystemEntity entity) {
  String name = entity.path;
  int index = name.lastIndexOf(Platform.pathSeparator);
  if (index != -1) {
    name = name.substring(index + 1);
  }
  return name;
}
