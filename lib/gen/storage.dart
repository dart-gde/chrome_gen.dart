/* This file has been generated from storage.json - do not edit */

/**
 * Use the `chrome.storage` API to store, retrieve, and track changes to user
 * data.
 */
library chrome.storage;

import '../src/common.dart';

/// Accessor for the `chrome.storage` namespace.
final ChromeStorage storage = ChromeStorage._storage == null ? apiNotAvailable('chrome.storage') : new ChromeStorage._();

class ChromeStorage {
  static final JsObject _storage = chrome['storage'];

  ChromeStorage._();

  /**
   * Items in the `sync` storage area are synced using Chrome Sync.
   */
  StorageArea get sync => _createStorageArea(_storage['sync']);

  /**
   * Items in the `local` storage area are local to each machine.
   */
  StorageArea get local => _createStorageArea(_storage['local']);

  /**
   * Fired when one or more items change.
   */
  Stream<StorageOnChangedEvent> get onChanged => _onChanged.stream;

  final ChromeStreamController<StorageOnChangedEvent> _onChanged =
      new ChromeStreamController<StorageOnChangedEvent>.twoArgs(_storage['onChanged'], _createStorageOnChangedEvent);
}

/**
 * Fired when one or more items change.
 */
class StorageOnChangedEvent {
  /**
   * Object mapping each key that changed to its corresponding [StorageChange]
   * for that item.
   */
  final Map changes;
  /**
   * The name of the storage area (`sync` or `local`) the changes are for.
   */
  final String areaName;

  StorageOnChangedEvent(this.changes, this.areaName);
}

class StorageChange extends ChromeObject {
  StorageChange({var oldValue, var newValue}) {
    if (oldValue != null) this.oldValue = oldValue;
    if (newValue != null) this.newValue = newValue;
  }

  StorageChange.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The old value of the item, if there was an old value.
   */
  dynamic get oldValue => proxy['oldValue'];
  set oldValue(var value) => proxy['oldValue'] = value;

  /**
   * The new value of the item, if there is a new value.
   */
  dynamic get newValue => proxy['newValue'];
  set newValue(var value) => proxy['newValue'] = value;
}

class StorageArea extends ChromeObject {
  StorageArea();

  StorageArea.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Gets one or more items from storage.
   * 
   * [keys] A single key to get, list of keys to get, or a dictionary specifying
   * default values (see description of the object).  An empty list or object
   * will return an empty result object.  Pass in `null` to get the entire
   * contents of storage.
   * 
   * Returns:
   * Object with items in their key-value mappings.
   */
  Future<Map<String, dynamic>> get([dynamic keys]) {
    var completer = new ChromeCompleter<Map<String, dynamic>>.oneArg(mapify);
    proxy.callMethod('get', [keys, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the amount of space (in bytes) being used by one or more items.
   * 
   * [keys] A single key or list of keys to get the total usage for. An empty
   * list will return 0. Pass in `null` to get the total usage of all of
   * storage.
   * 
   * Returns:
   * Amount of space being used in storage, in bytes.
   */
  Future<int> getBytesInUse([dynamic keys]) {
    var completer = new ChromeCompleter<int>.oneArg();
    proxy.callMethod('getBytesInUse', [keys, completer.callback]);
    return completer.future;
  }

  /**
   * Sets multiple items.
   * 
   * [items] Object specifying items to augment storage with. Values that cannot
   * be serialized (functions, etc) will be ignored.
   */
  Future set(Map<String, dynamic> items) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('set', [new JsObject.jsify(items), completer.callback]);
    return completer.future;
  }

  /**
   * Removes one or more items from storage.
   * 
   * [keys] A single key or a list of keys for items to remove.
   */
  Future remove(dynamic keys) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('remove', [keys, completer.callback]);
    return completer.future;
  }

  /**
   * Removes all items from storage.
   */
  Future clear() {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('clear', [completer.callback]);
    return completer.future;
  }
}

StorageArea _createStorageArea(JsObject proxy) => proxy == null ? null : new StorageArea.fromProxy(proxy);
StorageOnChangedEvent _createStorageOnChangedEvent(JsObject changes, String areaName) =>
    new StorageOnChangedEvent(mapify(changes), areaName);
