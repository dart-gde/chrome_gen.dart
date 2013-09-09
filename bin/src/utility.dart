
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

String wrap(String str, [int col = 80]) {
  List<String> lines = [];

  while (str.length > col) {
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

  // TODO: $ref:runtime.onConnect ==> [runtime.onConnect]

  // TODO: <a href='content_scripts.html#pi'>programmatic injection</a>
  // ==> [foo](url)

  return str;
}
