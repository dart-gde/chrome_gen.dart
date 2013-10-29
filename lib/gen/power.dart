/* This file has been generated from power.idl - do not edit */

library chrome.power;

import '../src/common.dart';

/**
 * Accessor for the `chrome.power` namespace.
 */
final ChromePower power = new ChromePower._();

class ChromePower extends ChromeApi {
  static final JsObject _power = chrome['power'];

  ChromePower._();

  bool get available => _power != null;

  /**
   * Requests that power management be temporarily disabled. [level] describes
   * the degree to which power management should be disabled. If a request
   * previously made by the same app is still active, it will be replaced by the
   * new request.
   */
  void requestKeepAwake(Level level) {
    if (_power == null) throw new UnsupportedError("'chrome.power' is not available");

    _power.callMethod('requestKeepAwake', [jsify(level)]);
  }

  /**
   * Releases a request previously made via requestKeepAwake().
   */
  void releaseKeepAwake() {
    if (_power == null) throw new UnsupportedError("'chrome.power' is not available");

    _power.callMethod('releaseKeepAwake');
  }
}

/**
 * Copyright (c) 2013 The Chromium Authors. All rights reserved. Use of this
 * source code is governed by a BSD-style license that can be found in the
 * LICENSE file. Use the `chrome.power` API to override the system's power
 * management features. Prevent the system from sleeping in response to user
 * inactivity. Prevent the display from being turned off or dimmed or the system
 * from sleeping in response to user inactivity.
 */
class Level extends ChromeEnum {
  static const Level SYSTEM = const Level._('system');
  static const Level DISPLAY = const Level._('display');

  static const List<Level> VALUES = const[SYSTEM, DISPLAY];

  const Level._(String str): super(str);
}
