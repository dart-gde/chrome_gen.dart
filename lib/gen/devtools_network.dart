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

/// Accessor for the `chrome.devtools_network` namespace.
final ChromeDevtoolsNetwork devtools_network = new ChromeDevtoolsNetwork._();

class ChromeDevtoolsNetwork {
  ChromeDevtoolsNetwork._();

  /**
   * Returns HAR log that contains all known network requests.
   * 
   * [callback] A function that receives the HAR log when the request completes.
   */
  Future getHAR() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['devtools_network'].callMethod('getHAR', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a network request is finished and all request data are
   * available.
   */
  Stream get onRequestFinished => null;

  /**
   * Fired when the inspected window navigates to a new page.
   */
  Stream get onNavigated => null;
}
