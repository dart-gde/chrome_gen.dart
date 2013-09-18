// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from sessions.json - do not edit */

/**
 * Use the `chrome.sessions` API to query and restore tabs and windows from a
 * browsing session.
 */
library chrome.sessions;

import '../src/common.dart';

/// Accessor for the `chrome.sessions` namespace.
final ChromeSessions sessions = new ChromeSessions._();

class ChromeSessions {
  JsObject _sessions;

  ChromeSessions._() {
    _sessions = context['chrome']['sessions'];
  }

  /**
   * The maximum number of [Session] that will be included in a requested list.
   */
  int get MAX_SESSION_RESULTS => _sessions['MAX_SESSION_RESULTS'];

  /**
   * Gets the list of recently closed tabs and/or windows.
   * 
   * Returns:
   * The list of closed entries in reverse order that they were closed (the most
   * recently closed tab or window will be at index `0`).The entries may contain
   * either tabs or windows.
   */
  Future<dynamic> getRecentlyClosed(var filter) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _sessions.callMethod('getRecentlyClosed', [filter, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves all devices with synced sessions.
   * 
   * Returns:
   * The list of [Device] objects for each synced session, sorted in order from
   * device with most recently modified session to device with least recently
   * modified session. [tabs.Tab] objects are sorted by recency in the
   * [windows.Window] of the [Session] objects.
   */
  Future<dynamic> getDevices(var filter) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _sessions.callMethod('getDevices', [filter, completer.callback]);
    return completer.future;
  }

  /**
   * Reopens a [windows.Window] or [tabs.Tab], with an optional callback to run
   * when the entry has been restored.
   * 
   * [sessionId] The [windows.Window.sessionId], or [tabs.Tab.sessionId] to
   * restore.
   * 
   * Returns:
   * A [Session] containing the restored [windows.Window] or [tabs.Tab] object.
   */
  Future<dynamic> restore(String sessionId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _sessions.callMethod('restore', [sessionId, completer.callback]);
    return completer.future;
  }
}

class Filter extends ChromeObject {
  Filter(JsObject proxy): super(proxy);
  // TODO:
}

class Session extends ChromeObject {
  Session(JsObject proxy): super(proxy);
  // TODO:
}

class Device extends ChromeObject {
  Device(JsObject proxy): super(proxy);
  // TODO:
}
