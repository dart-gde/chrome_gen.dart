
library generate_dart_test;

import 'package:unittest/unittest.dart';

import '../bin/src/generate_dart.dart';

// TODO: test DartGenerator

main() {
  group('generate_dart.dart', () {
    test('camelCase', () {
      expect(wrap('foo\nbarbar baz'), 'foo\nbarbar baz');
      expect(wrap('foo\nbarbar baz', 4), 'foo\nbarbar\nbaz');
    });
  });
}
