// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from sync_file_system.idl - do not edit */

library chrome.sync_file_system;

import '../src/common.dart';

/// Accessor for the `chrome.sync.file.system` namespace.
final ChromeSyncFileSystem sync_file_system = new ChromeSyncFileSystem._();

class ChromeSyncFileSystem {
  JsObject _sync_file_system;

  ChromeSyncFileSystem._() {
    _sync_file_system = context['chrome']['sync']['file']['system'];
  }
}
