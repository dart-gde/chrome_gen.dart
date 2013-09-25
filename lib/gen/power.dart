/* This file has been generated from power.idl - do not edit */

library chrome.power;

import '../src/common.dart';

/// Accessor for the `chrome.power` namespace.
final ChromePower power = new ChromePower._();

class ChromePower {
  static final JsObject _power = context['chrome']['power'];

  ChromePower._();

  void requestKeepAwake(Level level) {
    _power.callMethod('requestKeepAwake', [level]);
  }

  void releaseKeepAwake() {
    _power.callMethod('releaseKeepAwake');
  }
}

class Level extends ChromeEnum {
  /**
   * Prevent the system from sleeping in response to user inactivity.
   */
  static const Level SYSTEM = const Level._('system');

  /**
   * Prevent the display from being turned off or dimmed or the system from
   * sleeping in response to user inactivity.
   */
  static const Level DISPLAY = const Level._('display');

  static List _values = [SYSTEM, DISPLAY];

  const Level._(String str): super(str);

  static Level create(String str) =>_values.singleWhere((ChromeEnum e) => e.value == str);

  static List<Level> get values => _values;
}
