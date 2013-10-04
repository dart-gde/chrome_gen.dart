/* This file has been generated from power.idl - do not edit */

library chrome.power;

import '../src/common.dart';

/// Accessor for the `chrome.power` namespace.
final ChromePower power = ChromePower._power == null ? apiNotAvailable('chrome.power') : new ChromePower._();

class ChromePower {
  static final JsObject _power = chrome['power'];

  ChromePower._();

  /**
   * Requests that power management be temporarily disabled.
   * [level] describes the degree to which power management should be disabled.
   * If a request previously made by the same app is still active, it will be
   * replaced by the new request.
   */
  void requestKeepAwake(Level level) {
    _power.callMethod('requestKeepAwake', [level]);
  }

  /**
   * Releases a request previously made via requestKeepAwake().
   */
  void releaseKeepAwake() {
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
