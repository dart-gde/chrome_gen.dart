// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from power.idl - do not edit */

library chrome.power;

import '../src/common.dart';

/// Accessor for the `chrome.power` namespace.
final ChromePower power = new ChromePower._();

class ChromePower {
  JsObject _power;

  ChromePower._() {
    _power = context['chrome']['power'];
  }
}
