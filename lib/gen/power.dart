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
  static const Level SYSTEM = const Level._('system');

  static List<Level> _values = [SYSTEM];

  static List<Level> get values => _values;

  static Level create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const Level._(String str): super(str);
}
