// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from idle.json - do not edit */

/**
 * Use the `chrome.idle` API to detect when the machine's idle state changes.
 */
library chrome.idle;

import '../src/common.dart';

/// Accessor for the `chrome.idle` namespace.
final ChromeIdle idle = new ChromeIdle._();

class ChromeIdle {
  JsObject _idle;

  ChromeIdle._() {
    _idle = context['chrome']['idle'];
  }

  /**
   * Returns "locked" if the system is locked, "idle" if the user has not
   * generated any input for a specified number of seconds, or "active"
   * otherwise.
   * 
   * [detectionIntervalInSeconds] The system is considered idle if
   * detectionIntervalInSeconds seconds have elapsed since the last user input
   * detected.
   */
  Future<String> queryState(int detectionIntervalInSeconds) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _idle.callMethod('queryState', [detectionIntervalInSeconds, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the interval, in seconds, used to determine when the system is in an
   * idle state for onStateChanged events. The default interval is 60 seconds.
   * 
   * [intervalInSeconds] Threshold, in seconds, used to determine when the
   * system is in an idle state.
   */
  void setDetectionInterval(int intervalInSeconds) {
    _idle.callMethod('setDetectionInterval', [intervalInSeconds]);
  }

  /**
   * Fired when the system changes to an active, idle or locked state. The event
   * fires with "locked" if the screen is locked or the screensaver activates,
   * "idle" if the system is unlocked and the user has not generated any input
   * for a specified number of seconds, and "active" when the user generates
   * input on an idle system.
   */
  Stream<dynamic> get onStateChanged => _onStateChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onStateChanged = null;
}
