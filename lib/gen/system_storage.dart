// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from system_storage.idl - do not edit */

library chrome.system_storage;

import '../src/common.dart';

/// Accessor for the `chrome.system.storage` namespace.
final ChromeSystemStorage system_storage = new ChromeSystemStorage._();

class ChromeSystemStorage {
  JsObject _system_storage;

  ChromeSystemStorage._() {
    _system_storage = context['chrome']['system']['storage'];
  }
}
