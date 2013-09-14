// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from system_memory.idl - do not edit */

library chrome.system_memory;

import '../src/common.dart';

/// Accessor for the `chrome.system.memory` namespace.
final ChromeSystemMemory system_memory = new ChromeSystemMemory._();

class ChromeSystemMemory {
  JsObject _system_memory;

  ChromeSystemMemory._() {
    _system_memory = context['chrome']['system']['memory'];
  }
}
