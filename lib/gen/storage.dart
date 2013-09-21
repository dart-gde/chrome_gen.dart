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
  StorageArea get sync => new StorageArea(_storage['sync']);

  /**
   * Items in the `local` storage area are local to each machine.
   */
  StorageArea get local => new StorageArea(_storage['local']);

  /**
   * Fired when one or more items change.
   */
  Stream<dynamic> get onChanged => _onChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onChanged = null;
}

class StorageChange extends ChromeObject {
  static StorageChange create(JsObject proxy) => new StorageChange(proxy);

  StorageChange(JsObject proxy): super(proxy);

  /**
   * The old value of the item, if there was an old value.
   */
  dynamic get oldValue => this.proxy['oldValue'];

  /**
   * The new value of the item, if there is a new value.
   */
  dynamic get newValue => this.proxy['newValue'];
}

class StorageArea extends ChromeObject {
  static StorageArea create(JsObject proxy) => new StorageArea(proxy);

  StorageArea(JsObject proxy): super(proxy);
}
