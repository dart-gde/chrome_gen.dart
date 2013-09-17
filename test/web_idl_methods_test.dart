// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library test_web_idl_methods;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

void main() {
  group("methods", () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('', () {
      String testCode ="""interface Dahut8 {
    void           doIt1 ();
    DOMString      doIt2 ();
    unsigned short doIt3 ();
    void           doIt4 (Dahut7 foo);
    void           noIn (DahutSansIn foo);
    void           doIt5 (DOMString foo, unsigned short bar);
    [NameSetter]
    Dahut7         doIt6 ([Optional] Dahut5 foo, [Optional, TreastAsNull] unsigned short bar);
    void           extended (DOMString foo, [Optional, TreastAsNull] unsigned short another);
};
""";
      List expected =
          [
           EMPTY,
           [
            'interface',
            'Dahut8',
            EMPTY,
            [
             EMPTY,
             [EMPTY, ['void', 'doIt1', EMPTY, ';']],
             [
              EMPTY,
              [EMPTY, [['DOMString', EMPTY], 'doIt2', EMPTY, ';']],
              [
               EMPTY,
               [EMPTY, [[['unsigned', 'short'], EMPTY], 'doIt3', EMPTY, ';']],
               [
                EMPTY,
                [
                 EMPTY,
                 [
                  'void',
                  'doIt4',
                  [[EMPTY, [['Dahut7', EMPTY], EMPTY, 'foo']], EMPTY],
                  ';'
                  ]
                 ],
                 [
                  EMPTY,
                  [
                   EMPTY,
                   [
                    'void',
                    'noIn',
                    [
                     [EMPTY, [['DahutSansIn', EMPTY], EMPTY, 'foo']],
                     EMPTY
                     ],
                     ';'
                     ]
                   ],
                   [
                    EMPTY,
                    [
                     EMPTY,
                     [
                      'void',
                      'doIt5',
                      [
                       [EMPTY, [['DOMString', EMPTY], EMPTY, 'foo']],
                       [
                        ',',
                        [
                          EMPTY,
                          [[['unsigned', 'short'], EMPTY], EMPTY, 'bar']
                        ],
                        EMPTY
                      ]
                    ],
                    ';'
                  ]
                ],
                [
                  [['NameSetter', EMPTY], EMPTY],
                  [
                    EMPTY,
                    [
                      ['Dahut7', EMPTY],
                      'doIt6',
                      [
                        [
                          [['Optional', EMPTY], EMPTY],
                          [['Dahut5', EMPTY], EMPTY, 'foo']
                        ],
                        [
                          ',',
                          [
                            [
                              ['Optional', EMPTY],
                              [',', ['TreastAsNull', EMPTY], EMPTY]
                            ],
                            [[['unsigned', 'short'], EMPTY], EMPTY, 'bar']
                          ],
                          EMPTY
                        ]
                      ],
                      ';'
                    ]
                  ],
                  [
                    EMPTY,
                    [
                      EMPTY,
                      [
                        'void',
                        'extended',
                        [
                          [EMPTY, [['DOMString', EMPTY], EMPTY, 'foo']],
                          [
                            ',',
                            [
                              [
                                ['Optional', EMPTY],
                                [',', ['TreastAsNull', EMPTY], EMPTY]
                              ],
                              [
                                [['unsigned', 'short'], EMPTY],
                                EMPTY,
                                'another'
                              ]
                            ],
                            EMPTY
                          ]
                        ],
                        ';'
                      ]
                    ],
                    EMPTY
                  ]
                ]
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