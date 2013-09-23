/* This file has been generated from system_storage.idl - do not edit */

/**
 * 
 */
library chrome.system_storage;

import '../src/common.dart';

/// Accessor for the `chrome.system.storage` namespace.
final ChromeSystemStorage system_storage = new ChromeSystemStorage._();

class ChromeSystemStorage {
  static final JsObject _system_storage = context['chrome']['system']['storage'];

  ChromeSystemStorage._();

  Future getInfo() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_storage.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  Future ejectDevice(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_storage.callMethod('ejectDevice', [id, completer.callback]);
    return completer.future;
  }

  Stream<StorageUnitInfo> get onAttached => _onAttached.stream;

  final ChromeStreamController<StorageUnitInfo> _onAttached =
      new ChromeStreamController<StorageUnitInfo>.oneArg(_system_storage['onAttached'], selfConverter);

  Stream<String> get onDetached => _onDetached.stream;

  final ChromeStreamController<String> _onDetached =
      new ChromeStreamController<String>.oneArg(_system_storage['onDetached'], selfConverter);
}

class StorageUnitInfo extends ChromeObject {
  static StorageUnitInfo create(JsObject proxy) => new StorageUnitInfo(proxy);

  StorageUnitInfo(JsObject proxy): super(proxy);
}
