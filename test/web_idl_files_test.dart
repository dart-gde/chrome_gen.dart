library test_web_idl_files;

import 'dart:io';
import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

// Tests taken from
// [widlproc](https://github.com/dontcallmedom/widlproc/tree/master/test)

void main() {
  defineTests();
}

// TODO: remove this includeWebIdl flag
void defineTests({bool includeWebIdl: true}) {
  Directory testDir = new Directory(
      Platform.script.substring(0, Platform.script.lastIndexOf('/')));

  bool idlFileExtTest(FileSystemEntity file) =>
      file.path.endsWith('.idl') || file.path.endsWith('.widl');

  Iterable<FileSystemEntity> validFileEntities = new Directory(
      '${testDir.path}/idl/valid')
    .listSync(recursive: false, followLinks: false).where(idlFileExtTest);

  Iterable<FileSystemEntity> invalidFileEntities = new Directory(
      '${testDir.path}/idl/invalid')
    .listSync(recursive: false, followLinks: false).where(idlFileExtTest);

  Iterable<FileSystemEntity> chromeIdlFileEntities = new Directory('idl')
    .listSync(recursive: false, followLinks: false).where(idlFileExtTest);

  if (includeWebIdl) {
    group('web_idl_parser valid', () {
      // TODO: make async
      validFileEntities.forEach((FileSystemEntity fileEntity) {
        test('${fileEntity.path}', () {
          File file = new File(fileEntity.path);
          String webIdl = file.readAsStringSync();
          WebIdlParser webIdlParser = new WebIdlParser();
          webIdlParser.start.parse(webIdl);
        });
      });
    });
  }

  group('web_idl_parser invalid', () {
    // TODO: make async
    invalidFileEntities.forEach((FileSystemEntity fileEntity) {
      test('${fileEntity.path}', () {
        File file = new File(fileEntity.path);
        String webIdl = file.readAsStringSync();
        WebIdlParser webIdlParser = new WebIdlParser();
        expect(()=> webIdlParser.start.parse(webIdl), throws);
      });
    });
  });

  group('web_idl_parser chrome', () {
    // TODO: make async
    chromeIdlFileEntities.forEach((FileSystemEntity fileEntity) {
      test('${fileEntity.path}', () {
        File file = new File(fileEntity.path);
        String webIdl = file.readAsStringSync();
        WebIdlParser webIdlParser = new WebIdlParser();
        webIdlParser.start.parse(webIdl);
      });
    });
  });
}
