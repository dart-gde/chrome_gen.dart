/* This file has been generated from system_storage.idl - do not edit */

library chrome.system_storage;

import '../src/common.dart';

/// Accessor for the `chrome.system.storage` namespace.
final ChromeSystemStorage system_storage = new ChromeSystemStorage._();

class ChromeSystemStorage {
  static final JsObject _system_storage = context['chrome']['system']['storage'];

  ChromeSystemStorage._();

  Future<StorageUnitInfo> getInfo() {
    var completer = new ChromeCompleter<StorageUnitInfo>.oneArg(StorageUnitInfo.create);
    _system_storage.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  Future<EjectDeviceResultCode> ejectDevice(String id) {
    var completer = new ChromeCompleter<EjectDeviceResultCode>.oneArg(EjectDeviceResultCode.create);
    _system_storage.callMethod('ejectDevice', [id, completer.callback]);
    return completer.future;
  }

  Stream<StorageUnitInfo> get onAttached => _onAttached.stream;

  final ChromeStreamController<StorageUnitInfo> _onAttached =
      new ChromeStreamController<StorageUnitInfo>.oneArg(_system_storage['onAttached'], StorageUnitInfo.create);

  Stream<String> get onDetached => _onDetached.stream;

  final ChromeStreamController<String> _onDetached =
      new ChromeStreamController<String>.oneArg(_system_storage['onDetached'], selfConverter);
}

class StorageUnitType extends ChromeEnum {
  static const StorageUnitType FIXED = const StorageUnitType._('fixed');
  static const StorageUnitType REMOVABLE = const StorageUnitType._('removable');
  static const StorageUnitType UNKNOWN = const StorageUnitType._('unknown');

  static const List<StorageUnitType> VALUES = const[FIXED, REMOVABLE, UNKNOWN];

  static StorageUnitType create(String str) =>
      VALUES.singleWhere((ChromeEnum e) => e.value == str);

  const StorageUnitType._(String str): super(str);
}

class EjectDeviceResultCode extends ChromeEnum {
  static const EjectDeviceResultCode SUCCESS = const EjectDeviceResultCode._('success');
  static const EjectDeviceResultCode IN_USE = const EjectDeviceResultCode._('in_use');
  static const EjectDeviceResultCode NO_SUCH_DEVICE = const EjectDeviceResultCode._('no_such_device');
  static const EjectDeviceResultCode FAILURE = const EjectDeviceResultCode._('failure');

  static const List<EjectDeviceResultCode> VALUES = const[SUCCESS, IN_USE, NO_SUCH_DEVICE, FAILURE];

  static EjectDeviceResultCode create(String str) =>
      VALUES.singleWhere((ChromeEnum e) => e.value == str);

  const EjectDeviceResultCode._(String str): super(str);
}

class StorageUnitInfo extends ChromeObject {
  static StorageUnitInfo create(JsObject proxy) => proxy == null ? null : new StorageUnitInfo.fromProxy(proxy);

  StorageUnitInfo({String id, String name, StorageUnitType type, double capacity}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (type != null) this.type = type;
    if (capacity != null) this.capacity = capacity;
  }

  StorageUnitInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  StorageUnitType get type => StorageUnitType.create(proxy['type']);
  set type(StorageUnitType value) => proxy['type'] = value;

  double get capacity => proxy['capacity'];
  set capacity(double value) => proxy['capacity'] = value;
}
