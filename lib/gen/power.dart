/* This file has been generated from power.idl - do not edit */

/**
 * 
 */
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
