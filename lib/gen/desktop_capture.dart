// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from desktop_capture.idl - do not edit */

library chrome.desktop_capture;

import '../src/common.dart';

/// Accessor for the `chrome.desktop.capture` namespace.
final ChromeDesktopCapture desktop_capture = new ChromeDesktopCapture._();

class ChromeDesktopCapture {
  JsObject _desktop_capture;

  ChromeDesktopCapture._() {
    _desktop_capture = context['chrome']['desktop']['capture'];
  }
}
