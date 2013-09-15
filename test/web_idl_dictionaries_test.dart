library test_web_idl_dictionaries;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("dictionaries", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('4.1 Simplest', () {
      String testCode ="""dictionary Dico1 {
};
""";
      List expected = [EMPTY, ['dictionary', 'Dico1', EMPTY, EMPTY, ';'], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      expect(result, equals(expected));
    });

    test('4.2 Inheritance', () {
      String testCode ="""dictionary Dico1 : Dico0 {
};
""";
      List expected = [EMPTY, ['dictionary', 'Dico1', [':', 'Dico0'], EMPTY, ';'], EMPTY];
      var result = webIdlParser.start.parse(testCode);
      expect(result, equals(expected));
    });

    test('4.3 With members', () {
      String testCode ="""dictionary Dico2 {
    DOMString      foo;
    unsigned short xxx;
    DOMString?     fillPattern = "black";
    DOMString?     strokePattern = null;
};
""";
      List expected = [
                       EMPTY,
                       [
                        'dictionary',
                        'Dico2',
                        EMPTY,
                        [
                         EMPTY,
                         [['DOMString', EMPTY], 'foo', EMPTY, ';'],
                         [
                          EMPTY,
                          [[['unsigned', 'short'], EMPTY], 'xxx', EMPTY, ';'],
                          [
                           EMPTY,
                           [['DOMString', ['?', EMPTY]], 'fillPattern', ['=', 'black'], ';'],
                           [
                            EMPTY,
                            [['DOMString', ['?', EMPTY]], 'strokePattern', ['=', 'null'], ';'],
                            EMPTY
                            ]
                           ]
                          ]
                         ],
                         ';'
                         ],
                         EMPTY
                         ];
      var result = webIdlParser.start.parse(testCode);
      expect(result, equals(expected));
    });
  });
}