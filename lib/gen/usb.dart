/* This file has been generated from usb.idl - do not edit */

library chrome.usb;

import '../src/common.dart';

/// Accessor for the `chrome.usb` namespace.
final ChromeUsb usb = new ChromeUsb._();

class ChromeUsb {
  static final JsObject _usb = context['chrome']['usb'];

  ChromeUsb._();

  Future getDevices(EnumerateDevicesOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('getDevices', [options, completer.callback]);
    return completer.future;
  }

  Future requestAccess(Device device, int interfaceId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('requestAccess', [device, interfaceId, completer.callback]);
    return completer.future;
  }

  Future openDevice(Device device) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('openDevice', [device, completer.callback]);
    return completer.future;
  }

  Future findDevices(EnumerateDevicesAndRequestAccessOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('findDevices', [options, completer.callback]);
    return completer.future;
  }

  Future closeDevice(ConnectionHandle handle) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('closeDevice', [handle, completer.callback]);
    return completer.future;
  }

  Future listInterfaces(ConnectionHandle handle) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('listInterfaces', [handle, completer.callback]);
    return completer.future;
  }

  Future claimInterface(ConnectionHandle handle, int interfaceNumber) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('claimInterface', [handle, interfaceNumber, completer.callback]);
    return completer.future;
  }

  Future releaseInterface(ConnectionHandle handle, int interfaceNumber) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('releaseInterface', [handle, interfaceNumber, completer.callback]);
    return completer.future;
  }

  Future setInterfaceAlternateSetting(ConnectionHandle handle, int interfaceNumber, int alternateSetting) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('setInterfaceAlternateSetting', [handle, interfaceNumber, alternateSetting, completer.callback]);
    return completer.future;
  }

  Future controlTransfer(ConnectionHandle handle, ControlTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('controlTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future bulkTransfer(ConnectionHandle handle, GenericTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('bulkTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future interruptTransfer(ConnectionHandle handle, GenericTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('interruptTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future isochronousTransfer(ConnectionHandle handle, IsochronousTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('isochronousTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future resetDevice(ConnectionHandle handle) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('resetDevice', [handle, completer.callback]);
    return completer.future;
  }
}

class Direction extends ChromeEnum {
  static const Direction IN = const Direction._('in');

  static List<Direction> _values = [IN];

  static List<Direction> get values => _values;

  static Direction create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const Direction._(String str): super(str);
}

class Recipient extends ChromeEnum {
  static const Recipient DEVICE = const Recipient._('device');

  static List<Recipient> _values = [DEVICE];

  static List<Recipient> get values => _values;

  static Recipient create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const Recipient._(String str): super(str);
}

class RequestType extends ChromeEnum {
  static const RequestType STANDARD = const RequestType._('standard');

  static List<RequestType> _values = [STANDARD];

  static List<RequestType> get values => _values;

  static RequestType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const RequestType._(String str): super(str);
}

class TransferType extends ChromeEnum {
  static const TransferType CONTROL = const TransferType._('control');

  static List<TransferType> _values = [CONTROL];

  static List<TransferType> get values => _values;

  static TransferType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const TransferType._(String str): super(str);
}

class SynchronizationType extends ChromeEnum {
  static const SynchronizationType ASYNCHRONOUS = const SynchronizationType._('asynchronous');

  static List<SynchronizationType> _values = [ASYNCHRONOUS];

  static List<SynchronizationType> get values => _values;

  static SynchronizationType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const SynchronizationType._(String str): super(str);
}

class UsageType extends ChromeEnum {
  static const UsageType DATA = const UsageType._('data');

  static List<UsageType> _values = [DATA];

  static List<UsageType> get values => _values;

  static UsageType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const UsageType._(String str): super(str);
}

class Device extends ChromeObject {
  static Device create(JsObject proxy) => proxy == null ? null : new Device(proxy);

  Device(JsObject proxy): super(proxy);
}

class ConnectionHandle extends ChromeObject {
  static ConnectionHandle create(JsObject proxy) => proxy == null ? null : new ConnectionHandle(proxy);

  ConnectionHandle(JsObject proxy): super(proxy);
}

class EndpointDescriptor extends ChromeObject {
  static EndpointDescriptor create(JsObject proxy) => proxy == null ? null : new EndpointDescriptor(proxy);

  EndpointDescriptor(JsObject proxy): super(proxy);
}

class InterfaceDescriptor extends ChromeObject {
  static InterfaceDescriptor create(JsObject proxy) => proxy == null ? null : new InterfaceDescriptor(proxy);

  InterfaceDescriptor(JsObject proxy): super(proxy);
}

class ControlTransferInfo extends ChromeObject {
  static ControlTransferInfo create(JsObject proxy) => proxy == null ? null : new ControlTransferInfo(proxy);

  ControlTransferInfo(JsObject proxy): super(proxy);
}

class GenericTransferInfo extends ChromeObject {
  static GenericTransferInfo create(JsObject proxy) => proxy == null ? null : new GenericTransferInfo(proxy);

  GenericTransferInfo(JsObject proxy): super(proxy);
}

class IsochronousTransferInfo extends ChromeObject {
  static IsochronousTransferInfo create(JsObject proxy) => proxy == null ? null : new IsochronousTransferInfo(proxy);

  IsochronousTransferInfo(JsObject proxy): super(proxy);
}

class TransferResultInfo extends ChromeObject {
  static TransferResultInfo create(JsObject proxy) => proxy == null ? null : new TransferResultInfo(proxy);

  TransferResultInfo(JsObject proxy): super(proxy);
}

class EnumerateDevicesOptions extends ChromeObject {
  static EnumerateDevicesOptions create(JsObject proxy) => proxy == null ? null : new EnumerateDevicesOptions(proxy);

  EnumerateDevicesOptions(JsObject proxy): super(proxy);
}

class EnumerateDevicesAndRequestAccessOptions extends ChromeObject {
  static EnumerateDevicesAndRequestAccessOptions create(JsObject proxy) => proxy == null ? null : new EnumerateDevicesAndRequestAccessOptions(proxy);

  EnumerateDevicesAndRequestAccessOptions(JsObject proxy): super(proxy);
}
