library test_chrome_idl_files;

import 'dart:io';
import 'dart:platform';
import 'package:unittest/unittest.dart';

import '../tool/chrome_idl_parser.dart';

void main() {
  group('ChromeIDLParser', () {
    String testDirStr =
        script.path.substring(0, script.path.lastIndexOf('/'));
    Directory testDir = new Directory(testDirStr);

    bool idlFileExtTest(FileSystemEntity file) => file.path.endsWith('.idl');

    Iterable<FileSystemEntity> chromeIdlFileEntities = new Directory('idl')
    .listSync(recursive: false, followLinks: false).where(idlFileExtTest);

    // TODO: make async
    chromeIdlFileEntities.forEach((FileSystemEntity fileEntity) {
      test('${fileEntity.path}', () {
        File file = new File(fileEntity.path);
        String webIdl = file.readAsStringSync();
        ChromeIDLParser chromeIDLParser = new ChromeIDLParser();
        chromeIDLParser.namespaceDeclaration.parse(webIdl);
      });
    });
  });
}
