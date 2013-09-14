// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from tab_capture.idl - do not edit */

library chrome.tab_capture;

import '../src/common.dart';

/// Accessor for the `chrome.tab.capture` namespace.
final ChromeTabCapture tab_capture = new ChromeTabCapture._();

class ChromeTabCapture {
  JsObject _tab_capture;

  ChromeTabCapture._() {
    _tab_capture = context['chrome']['tab']['capture'];
  }
}
