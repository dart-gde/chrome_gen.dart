// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from identity.idl - do not edit */

library chrome.identity;

import '../src/common.dart';

/// Accessor for the `chrome.identity` namespace.
final ChromeIdentity identity = new ChromeIdentity._();

class ChromeIdentity {
  JsObject _identity;

  ChromeIdentity._() {
    _identity = context['chrome']['identity'];
  }
}
