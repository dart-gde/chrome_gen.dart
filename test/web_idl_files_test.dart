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

  bool packagesRemoveTest(FileSystemEntity fileSystemEntity) =>
      fileSystemEntity.path.endsWith("packages");

  bool chromeNonIdlFilesRemoveTest(FileSystemEntity fileSystemEntity) =>
      fileSystemEntity.path.endsWith(".json") ||
      fileSystemEntity.path.endsWith("devtools");

  List<FileSystemEntity> validFileEntities = new Directory(
      '${testDir.path}/idl/valid').listSync(recursive: false, followLinks: false);
  validFileEntities.removeWhere(packagesRemoveTest);

  List<FileSystemEntity> invalidFileEntities = new Directory(
      '${testDir.path}/idl/invalid').listSync(recursive: false, followLinks: false);
  invalidFileEntities.removeWhere(packagesRemoveTest);

  List<FileSystemEntity> chromeIdlFileEntities = new Directory(
      '${testDir.path}/../idl').listSync(recursive: false, followLinks: false);
  chromeIdlFileEntities.removeWhere(packagesRemoveTest);
  chromeIdlFileEntities.removeWhere(chromeNonIdlFilesRemoveTest);

  if (includeWebIdl) {
    group('Test valid web idl files', () {
      // TODO: make async
      validFileEntities.forEach((FileSystemEntity fileEntity) {
        test('Testing ${fileEntity.path}', () {
          File file = new File(fileEntity.path);
          String webIdl = file.readAsStringSync();
          WebIdlParser webIdlParser = new WebIdlParser();
          webIdlParser.start.parse(webIdl);
        });
      });
    });
  }

  group('Test invalid web idl files', () {
    // TODO: make async
    invalidFileEntities.forEach((FileSystemEntity fileEntity) {
      test('Testing ${fileEntity.path}', () {
        File file = new File(fileEntity.path);
        String webIdl = file.readAsStringSync();
        WebIdlParser webIdlParser = new WebIdlParser();
        expect(()=> webIdlParser.start.parse(webIdl), throws);
      });
    });
  });

  group('Test chrome idl files', () {
    // TODO: make async
    chromeIdlFileEntities.forEach((FileSystemEntity fileEntity) {
      test('Testing ${fileEntity.path}', () {
        File file = new File(fileEntity.path);
        String webIdl = file.readAsStringSync();
        WebIdlParser webIdlParser = new WebIdlParser();
        webIdlParser.start.parse(webIdl);
      });
    });
  });
}
