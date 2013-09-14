// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from network.json - do not edit */

/**
 * Use the `chrome.devtools.network` API to retrieve the information about
 * network requests displayed by the Developer Tools in the Network panel.
 */
library chrome.devtools_network;

import '../src/common.dart';

/// Accessor for the `chrome.devtools.network` namespace.
final ChromeDevtoolsNetwork devtools_network = new ChromeDevtoolsNetwork._();

class ChromeDevtoolsNetwork {
  JsObject _devtools_network;

  ChromeDevtoolsNetwork._() {
    _devtools_network = context['chrome']['devtools']['network'];
  }

  /**
   * Returns HAR log that contains all known network requests.
   * 
   * [callback] A function that receives the HAR log when the request completes.
   */
  Future<dynamic> getHAR() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _devtools_network.callMethod('getHAR', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a network request is finished and all request data are
   * available.
   */
  Stream get onRequestFinished => _onRequestFinished.stream;

  final ChromeStreamController _onRequestFinished = null;

  /**
   * Fired when the inspected window navigates to a new page.
   */
  Stream get onNavigated => _onNavigated.stream;

  final ChromeStreamController _onNavigated = null;
}
