
library utility;

String convertJSLibNameToFileName(String jsLibName) {
  jsLibName = jsLibName.replaceAll('devtools.', 'devtools_');
  jsLibName = jsLibName.replaceAll('.', '_');

  jsLibName = jsLibName.replaceAllMapped(
      new RegExp(r"[A-Z]"),
      (Match m) => "_${m.group(0).toLowerCase()}");

  return jsLibName;
}

/// foo_bar ==> fooBar
String camelCase(String str) {
  return str.replaceAllMapped(
      new RegExp(r"_([a-z])"),
      (Match m) => "${m.group(1).toUpperCase()}");
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

  str = str.replaceAll('<strong>', '**');
  str = str.replaceAll('</strong>', '**');

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
