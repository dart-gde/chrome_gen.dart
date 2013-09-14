// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from location.idl - do not edit */

library chrome.location;

import '../src/common.dart';

/// Accessor for the `chrome.location` namespace.
final ChromeLocation location = new ChromeLocation._();

class ChromeLocation {
  JsObject _location;

  ChromeLocation._() {
    _location = context['chrome']['location'];
  }
}
