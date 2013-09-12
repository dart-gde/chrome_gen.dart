library test_web_idl;

import 'dart:io';
import 'package:unittest/unittest.dart';
import 'web_idl_parser.dart';

// Tests taken from
// [widlproc](https://github.com/dontcallmedom/widlproc/tree/master/test)

void main() {

  List<FileSystemEntity> validFileEntities = new Directory('idl/valid')
  .listSync(recursive: false, followLinks: false);

  List<FileSystemEntity> invalidFileEntities = new Directory('idl/invalid')
  .listSync(recursive: false, followLinks: false);

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

  group('Test invalid web idl files', () {
    // TODO: make async
    invalidFileEntities.forEach((FileSystemEntity fileEntity) {
      test('Testing ${fileEntity.path}', () {
        File file = new File(fileEntity.path);
        String webIdl = file.readAsStringSync();
        WebIdlParser webIdlParser = new WebIdlParser();
        webIdlParser.start.parse(webIdl);
      });
    });
  });
}