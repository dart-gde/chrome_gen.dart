
library test_web_idl_exception_definitions;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("exception_definitions", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('6. Exception Definitions', () {
      String testCode ="""[NoInterfaceObject]
exception BoomBoomBoomBoom {
    const unsigned short SUIT_UP_ERR = 0;
    const unsigned short LEGENDARY_ERR = 1;
    const DOMString      DENIED_ERR = "DE-waitforit-NIED!!!!";
    unsigned short xxx;
    unsigned short yyy;
    [Ook, Oook]
    unsigned short ook;
};
""";
      List expected =
[
 [['NoInterfaceObject', EMPTY], EMPTY],
 [
  'exception',
  'BoomBoomBoomBoom',
  EMPTY,
  [
   EMPTY,
   ['const', [['unsigned', 'short'], EMPTY], 'SUIT_UP_ERR', '=', 0, ';'],
   [
    EMPTY,
    [
     'const',
     [['unsigned', 'short'], EMPTY],
     'LEGENDARY_ERR',
     '=',
     1,
     ';'
     ],
     [
      EMPTY,
      [
       'const',
       ['DOMString', EMPTY],
       'DENIED_ERR',
       '=',
       'DE-waitforit-NIED!!!!',
       ';'
       ],
       [
        EMPTY,
        [[['unsigned', 'short'], EMPTY], 'xxx', ';'],
        [
         EMPTY,
         [[['unsigned', 'short'], EMPTY], 'yyy', ';'],
         [
          [['Ook', EMPTY], [',', ['Oook', EMPTY], EMPTY]],
          [[['unsigned', 'short'], EMPTY], 'ook', ';'],
          EMPTY
          ]
         ]
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