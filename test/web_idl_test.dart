library test_web_idl;

import 'package:unittest/unittest.dart';
import '../tool/web_idl_parser.dart';

/*
 * test cases can be found at
 * https://github.com/w3c/web-platform-tests/tree/master/WebIDL/tests/submissions/W3C
 * https://github.com/dontcallmedom/widlproc/tree/master/test
 * https://github.com/darobin/webidl.js/tree/master/t
 *
 * Refernce documentation
 * http://www.w3.org/TR/WebIDL
 * http://dev.w3.org/2009/dap/ReSpec.js/test-spec/webidl.html
 * http://www.chromium.org/blink/webidl
 * http://trac.webkit.org/wiki/WebKitIDL
 */

void main() {
  group('web_idl.dart', () {
    WebIdlParser webIdlParser;
    setUp(() {
      webIdlParser = new WebIdlParser();
    });

    test('extendedAttributeNoArgs', () {
      var id = webIdlParser.extendedAttributeNoArgs().parse("id");
      expect(id, equals("id"));
    });

    test('extendedAttributeIdent', () {
      var id = webIdlParser.extendedAttributeIdent().parse("id = di");
      expect(id, equals(["id", "=", "di"]));
    });

//    test('extendedAttributeNamedArgList', () {
//      // Test failed: Caught Stack Overflow
//      var id = webIdlParser.extendedAttributeNamedArgList().parse("id = di(1,2,3)");
//      //expect(id, equals(["id", "=", "di"]));
//    });

    test('extendedAttributeInner', () {
      var p = webIdlParser.extendedAttributeInner();
      var sp = p.parse("(1, 2, 3)");
      expect(sp, equals([[1, [',', [2, [',', [3, EMPTY]]]]], EMPTY]));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttributeRest

    test('extendedAttributeRest empty', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("");
      expect(sp, equals(EMPTY));
    });

    test('extendedAttributeRest takes no arguments', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[Replaceable]");
      expect(sp, equals([['Replaceable', EMPTY], EMPTY]));
    });

    test('extendedAttributeRest takes an argument list', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[Constructor(float x, float y)]");
      expect(sp, equals([['Constructor', [['float', ['x', [',', ['float', ['y', EMPTY]]]]], EMPTY]], EMPTY]));
    });

    test('extendedAttributeRest takes a named argument list', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[NamedConstructor = Image(DOMString src)]");
      expect(sp, equals([['NamedConstructor',['=', ['Image', [['DOMString', ['src', EMPTY]], EMPTY]]]],EMPTY]));
    });

    test('extendedAttributeRest takes an identifier', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[PutForwards = name]");
      expect(sp, equals([['PutForwards', ['=', ['name', EMPTY]]], EMPTY]));
    });

    test('extendedAttributeRest takes an identifier no spaces between "="', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[instanceOf =FileEntry] object entry;");
      expect(sp, equals([["instanceOf", ["=", ["FileEntry", EMPTY]]], ["object", ["entry", [";", EMPTY]]]]));
    });

    test('extendedAttributeRest takes an identifier no spaces between "="', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[instanceOf=FileEntry] object entry;");
      expect(sp, equals([["instanceOf", ["=", ["FileEntry", EMPTY]]], ["object", ["entry", [";", EMPTY]]]]));
    });

    test('extendedAttributeRest takes an identifier no spaces between "="', () {
      var p = webIdlParser.extendedAttributeRest();
      var sp = p.parse("[instanceOf= FileEntry] object entry;");
      expect(sp, equals([["instanceOf", ["=", ["FileEntry", EMPTY]]], ["object", ["entry", [";", EMPTY]]]]));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttribute
    test('extendedAttribute empty', () {
      var p = webIdlParser.extendedAttribute();
      expect(() => p.parse(""), throws);
    });

    test('extendedAttribute takes no arguments', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[Replaceable]");
      expect(sp, equals([['Replaceable', EMPTY], EMPTY]));
    });

    test('extendedAttribute takes an argument list', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[Constructor(float x, float y)]");
      expect(sp, equals([['Constructor', [['float', ['x', [',', ['float', ['y', EMPTY]]]]], EMPTY]], EMPTY]));
    });

    test('extendedAttribute takes a named argument list', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[NamedConstructor=Image(DOMString src)]");
      expect(sp, equals([["NamedConstructor", ["=", ["Image", [["DOMString", ["src", EMPTY]], EMPTY]]]], EMPTY]));
    });

    test('extendedAttribute takes an identifier', () {
      var p = webIdlParser.extendedAttribute();
      var sp = p.parse("[PutForwards=name]");
      expect(sp, equals([["PutForwards", ["=", ["name", EMPTY]]], EMPTY]));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttributes
    test('extendedAttributes empty', () {
      var p = webIdlParser.extendedAttributes();
      var sp = p.parse("");
      expect(sp, equals(EMPTY));
    });

    test('extendedAttributes', () {
      var p = webIdlParser.extendedAttributes();
      var sp = p.parse(", [Constructor(float x, float y)]");
      expect(sp, equals([',',[['Constructor', [['float', ['x', [',', ['float', ['y', EMPTY]]]]], EMPTY]],EMPTY],EMPTY]));
    });

    // http://www.w3.org/TR/WebIDL/#proddef-ExtendedAttributes
    test('extendedAttributeList empty', () {
      var p = webIdlParser.extendedAttributeList();
      var sp = p.parse("");
      expect(sp, equals(EMPTY));
    });

    test('extendedAttributeList list', () {
      var p = webIdlParser.extendedAttributeList();
      var sp = p.parse("[[Constructor1(float x, float y)], [Constructor2(float x, float y)]]");
      expect(sp, equals([
                         [
                          ['Constructor1', [['float', ['x', [',', ['float', ['y', EMPTY]]]]], EMPTY]],
                          EMPTY
                          ],
                          [
                           ',',
                           [
                            ['Constructor2', [['float', ['x', [',', ['float', ['y', EMPTY]]]]], EMPTY]],
                            EMPTY
                            ],
                            EMPTY
                            ]
                         ]));
    });

    test('general example test', () {
      var example = """// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Use the <code>chrome.alarms</code> API to schedule code to run
// periodically or at a specified time in the future.
namespace alarms {
  dictionary Alarm {
    // Name of this alarm.
    DOMString name;

    // Time at which this alarm was scheduled to fire, in milliseconds past the
    // epoch (e.g. <code>Date.now() + n</code>).  For performance reasons, the
    // alarm may have been delayed an arbitrary amount beyond this.
    double scheduledTime;

    // If not null, the alarm is a repeating alarm and will fire again in
    // <var>periodInMinutes</var> minutes.
    double? periodInMinutes;
  };

  // TODO(mpcomplete): rename to CreateInfo when http://crbug.com/123073 is
  // fixed.
  dictionary AlarmCreateInfo {
    // Time at which the alarm should fire, in milliseconds past the epoch
    // (e.g. <code>Date.now() + n</code>).
    double? when;

    // Length of time in minutes after which the <code>onAlarm</code> event
    // should fire.
    //
    // <!-- TODO: need minimum=0 -->
    double? delayInMinutes;

    // If set, the onAlarm event should fire every <var>periodInMinutes</var>
    // minutes after the initial event specified by <var>when</var> or
    // <var>delayInMinutes</var>.  If not set, the alarm will only fire once.
    //
    // <!-- TODO: need minimum=0 -->
    double? periodInMinutes;
  };

  callback AlarmCallback = void (Alarm alarm);
  callback AlarmListCallback = void (Alarm[] alarms);

  interface Functions {
    // Creates an alarm.  Near the time(s) specified by <var>alarmInfo</var>,
    // the <code>onAlarm</code> event is fired. If there is another alarm with
    // the same name (or no name if none is specified), it will be cancelled and
    // replaced by this alarm.
    //
    // In order to reduce the load on the user's machine, Chrome limits alarms
    // to at most once every 1 minute but may delay them an arbitrary amount
    // more.  That is, setting <code>delayInMinutes</code> or
    // <code>periodInMinutes</code> to less than <code>1</code> will not be
    // honored and will cause a warning.  <code>when</code> can be set to less
    // than 1 minute after "now" without warning but won't actually cause the
    // alarm to fire for at least 1 minute.
    //
    // To help you debug your app or extension, when you've loaded it unpacked,
    // there's no limit to how often the alarm can fire.
    //
    // |name|: Optional name to identify this alarm. Defaults to the empty
    // string.
    //
    // |alarmInfo|: Describes when the alarm should fire.  The initial time must
    // be specified by either <var>when</var> or <var>delayInMinutes</var> (but
    // not both).  If <var>periodInMinutes</var> is set, the alarm will repeat
    // every <var>periodInMinutes</var> minutes after the initial event.  If
    // neither <var>when</var> or <var>delayInMinutes</var> is set for a
    // repeating alarm, <var>periodInMinutes</var> is used as the default for
    // <var>delayInMinutes</var>.
    static void create(optional DOMString name, AlarmCreateInfo alarmInfo);

    // Retrieves details about the specified alarm.
    // |name|: The name of the alarm to get. Defaults to the empty string.
    static void get(optional DOMString name, AlarmCallback callback);

    // Gets an array of all the alarms.
    static void getAll(AlarmListCallback callback);

    // Clears the alarm with the given name.
    // |name|: The name of the alarm to clear. Defaults to the empty string.
    static void clear(optional DOMString name);

    // Clears all alarms.
    static void clearAll();
  };

  interface Events {
    // Fired when an alarm has elapsed. Useful for event pages.
    // |alarm|: The alarm that has elapsed.
    static void onAlarm(Alarm alarm);
  };
};""";
      var p = webIdlParser.start;
      var sp = p.parse(example);
      expect(sp, equals(
          [
    EMPTY,
    'namespace',
    ['alarms'],
    [
      EMPTY,
      [
        'dictionary',
        'Alarm',
        EMPTY,
        [
          EMPTY,
          [['DOMString', EMPTY], 'name', EMPTY, ';'],
          [
            EMPTY,
            [['double', EMPTY], 'scheduledTime', EMPTY, ';'],
            [
              EMPTY,
              [['double', ['?', EMPTY]], 'periodInMinutes', EMPTY, ';'],
              EMPTY
            ]
          ]
        ],
        ';'
      ],
      [
        EMPTY,
        [
          'dictionary',
          'AlarmCreateInfo',
          EMPTY,
          [
            EMPTY,
            [['double', ['?', EMPTY]], 'when', EMPTY, ';'],
            [
              EMPTY,
              [['double', ['?', EMPTY]], 'delayInMinutes', EMPTY, ';'],
              [
                EMPTY,
                [['double', ['?', EMPTY]], 'periodInMinutes', EMPTY, ';'],
                EMPTY
              ]
            ]
          ],
          ';'
        ],
        [
          EMPTY,
          [
            'callback',
            [
              'AlarmCallback',
              '=',
              'void',
              [[EMPTY, [['Alarm', EMPTY], EMPTY, 'alarm']], EMPTY],
              ';'
            ]
          ],
          [
            EMPTY,
            [
              'callback',
              [
                'AlarmListCallback',
                '=',
                'void',
                [
                  [EMPTY, [['Alarm', ['[', ']', EMPTY]], EMPTY, 'alarms']],
                  EMPTY
                ],
                ';'
              ]
            ],
            [
              EMPTY,
              [
                'interface',
                'Functions',
                EMPTY,
                [
                  EMPTY,
                  [
                    'static',
                    [
                      'void',
                      'create',
                      [
                        [
                          EMPTY,
                          ['optional', ['DOMString', EMPTY], 'name', EMPTY]
                        ],
                        [
                          ',',
                          [
                            EMPTY,
                            [['AlarmCreateInfo', EMPTY], EMPTY, 'alarmInfo']
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
                      'static',
                      [
                        'void',
                        'get',
                        [
                          [
                            EMPTY,
                            ['optional', ['DOMString', EMPTY], 'name', EMPTY]
                          ],
                          [
                            ',',
                            [
                              EMPTY,
                              [['AlarmCallback', EMPTY], EMPTY, 'callback']
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
                        'static',
                        [
                          'void',
                          'getAll',
                          [
                            [
                              EMPTY,
                              [
                                ['AlarmListCallback', EMPTY],
                                EMPTY,
                                'callback'
                              ]
                            ],
                            EMPTY
                          ],
                          ';'
                        ]
                      ],
                      [
                        EMPTY,
                        [
                          'static',
                          [
                            'void',
                            'clear',
                            [
                              [
                                EMPTY,
                                [
                                  'optional',
                                  ['DOMString', EMPTY],
                                  'name',
                                  EMPTY
                                ]
                              ],
                              EMPTY
                            ],
                            ';'
                          ]
                        ],
                        [
                          EMPTY,
                          ['static', ['void', 'clearAll', EMPTY, ';']],
                          EMPTY
                        ]
                      ]
                    ]
                  ]
                ],
                ';'
              ],
              [
                EMPTY,
                [
                  'interface',
                  'Events',
                  EMPTY,
                  [
                    EMPTY,
                    [
                      'static',
                      [
                        'void',
                        'onAlarm',
                        [
                          [EMPTY, [['Alarm', EMPTY], EMPTY, 'alarm']],
                          EMPTY
                        ],
                        ';'
                      ]
                    ],
                    EMPTY
                  ],
                  ';'
                ],
                EMPTY
              ]
            ]
          ]
        ]
      ]
    ],
    ';'
  ]
      ));
    });
  });
}
