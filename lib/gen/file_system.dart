// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from file_system.idl - do not edit */

library chrome.file_system;

import '../src/common.dart';

/// Accessor for the `chrome.file.system` namespace.
final ChromeFileSystem file_system = new ChromeFileSystem._();

class ChromeFileSystem {
  JsObject _file_system;

  ChromeFileSystem._() {
    _file_system = context['chrome']['file']['system'];
  }
}
