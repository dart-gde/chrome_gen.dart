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
  static final JsObject _storage = context['chrome']['storage'];

  ChromeStorage._();

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

  final ChromeStreamController<dynamic> _onChanged =
      new ChromeStreamController<dynamic>.oneArg(_storage['onChanged'], selfConverter);
}

/**
 * `oldValue` The old value of the item, if there was an old value.
 * 
 * `newValue` The new value of the item, if there is a new value.
 */
class StorageChange extends ChromeObject {
  static StorageChange create(JsObject proxy) => new StorageChange(proxy);

  StorageChange(JsObject proxy): super(proxy);

  /**
   * The old value of the item, if there was an old value.
   */
  dynamic get oldValue => proxy['oldValue'];

  /**
   * The new value of the item, if there is a new value.
   */
  dynamic get newValue => proxy['newValue'];
}

class StorageArea extends ChromeObject {
  static StorageArea create(JsObject proxy) => new StorageArea(proxy);

  StorageArea(JsObject proxy): super(proxy);
}
