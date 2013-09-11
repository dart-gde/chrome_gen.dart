// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from page_capture.json - do not edit */

/// Use the `chrome.pageCapture` API to save a tab as MHTML.
library chrome.page_capture;

import '../src/common.dart';

/// Accessor for the `chrome.page_capture` namespace.
final ChromePageCapture page_capture = new ChromePageCapture._();

class ChromePageCapture {
  ChromePageCapture._();

  /**
   * Saves the content of the tab with given id as MHTML.
   * 
   * [callback] Called when the MHTML has been generated.
   */
  Future saveAsMHTML(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['page_capture'].callMethod('saveAsMHTML', [details, completer.callback]);
    return completer.future;
  }
}
