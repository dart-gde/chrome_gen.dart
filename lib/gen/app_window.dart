// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from app_window.idl - do not edit */

library chrome.app_window;

import '../src/common.dart';

/// Accessor for the `chrome.app.window` namespace.
final ChromeAppWindow app_window = new ChromeAppWindow._();

class ChromeAppWindow {
  JsObject _app_window;

  ChromeAppWindow._() {
    _app_window = context['chrome']['app']['window'];
  }
}
