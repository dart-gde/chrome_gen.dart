// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from types.json - do not edit */

/// The `chrome.types` API contains type declarations for Chrome.
library chrome.types;

import '../src/common.dart';

/// Accessor for the `chrome.types` namespace.
final ChromeTypes types = new ChromeTypes._();

class ChromeTypes {
  JsObject _types;

  ChromeTypes._() {
    _types = context['chrome']['types'];
  }
}
