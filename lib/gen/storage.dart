// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from storage.json - do not edit */

/**
 * Use the `chrome.storage` API to store, retrieve, and track changes to user
 * data.
 */
library chrome.storage;

import '../src/common.dart';

/// Accessor for the `chrome.storage` namespace.
final ChromeStorage storage = new ChromeStorage._();

class ChromeStorage {
  JsObject _storage;

  ChromeStorage._() {
    _storage = context['chrome']['storage'];
  }

  /**
   * Items in the `sync` storage area are synced using Chrome Sync.
   */
  dynamic get sync => _storage['sync'];

  /**
   * Items in the `local` storage area are local to each machine.
   */
  dynamic get local => _storage['local'];

  /**
   * Items in the `managed` storage area are set by the domain administrator,
   * and are read-only by the extension; trying to modify this namespace results
   * in an error.
   */
  dynamic get managed => _storage['managed'];

  /**
   * Fired when one or more items change.
   */
  Stream<dynamic> get onChanged => _onChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onChanged = null;
}

class StorageChange extends ChromeObject {
  StorageChange(JsObject proxy): super(proxy);
  // TODO:
}

class StorageArea extends ChromeObject {
  StorageArea(JsObject proxy): super(proxy);
  // TODO:
}
