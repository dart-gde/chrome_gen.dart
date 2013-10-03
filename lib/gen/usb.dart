/* This file has been generated from usb.idl - do not edit */

library chrome.usb;

import '../src/common.dart';

/// Accessor for the `chrome.usb` namespace.
final ChromeUsb usb = new ChromeUsb._();

class ChromeUsb {
  static final JsObject _usb = context['chrome']['usb'];

  ChromeUsb._();

  Future<Device> getDevices(EnumerateDevicesOptions options) {
    var completer = new ChromeCompleter<Device>.oneArg(_createDevice);
    _usb.callMethod('getDevices', [options, completer.callback]);
    return completer.future;
  }

  Future<bool> requestAccess(Device device, int interfaceId) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _usb.callMethod('requestAccess', [device, interfaceId, completer.callback]);
    return completer.future;
  }

  Future<ConnectionHandle> openDevice(Device device) {
    var completer = new ChromeCompleter<ConnectionHandle>.oneArg(_createConnectionHandle);
    _usb.callMethod('openDevice', [device, completer.callback]);
    return completer.future;
  }

  Future<ConnectionHandle> findDevices(EnumerateDevicesAndRequestAccessOptions options) {
    var completer = new ChromeCompleter<ConnectionHandle>.oneArg(_createConnectionHandle);
    _usb.callMethod('findDevices', [options, completer.callback]);
    return completer.future;
  }

  Future closeDevice(ConnectionHandle handle) {
    var completer = new ChromeCompleter.noArgs();
    _usb.callMethod('closeDevice', [handle, completer.callback]);
    return completer.future;
  }

  Future<InterfaceDescriptor> listInterfaces(ConnectionHandle handle) {
    var completer = new ChromeCompleter<InterfaceDescriptor>.oneArg(_createInterfaceDescriptor);
    _usb.callMethod('listInterfaces', [handle, completer.callback]);
    return completer.future;
  }

  Future claimInterface(ConnectionHandle handle, int interfaceNumber) {
    var completer = new ChromeCompleter.noArgs();
    _usb.callMethod('claimInterface', [handle, interfaceNumber, completer.callback]);
    return completer.future;
  }

  Future releaseInterface(ConnectionHandle handle, int interfaceNumber) {
    var completer = new ChromeCompleter.noArgs();
    _usb.callMethod('releaseInterface', [handle, interfaceNumber, completer.callback]);
    return completer.future;
  }

  Future setInterfaceAlternateSetting(ConnectionHandle handle, int interfaceNumber, int alternateSetting) {
    var completer = new ChromeCompleter.noArgs();
    _usb.callMethod('setInterfaceAlternateSetting', [handle, interfaceNumber, alternateSetting, completer.callback]);
    return completer.future;
  }

  Future<TransferResultInfo> controlTransfer(ConnectionHandle handle, ControlTransferInfo transferInfo) {
    var completer = new ChromeCompleter<TransferResultInfo>.oneArg(_createTransferResultInfo);
    _usb.callMethod('controlTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future<TransferResultInfo> bulkTransfer(ConnectionHandle handle, GenericTransferInfo transferInfo) {
    var completer = new ChromeCompleter<TransferResultInfo>.oneArg(_createTransferResultInfo);
    _usb.callMethod('bulkTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future<TransferResultInfo> interruptTransfer(ConnectionHandle handle, GenericTransferInfo transferInfo) {
    var completer = new ChromeCompleter<TransferResultInfo>.oneArg(_createTransferResultInfo);
    _usb.callMethod('interruptTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future<TransferResultInfo> isochronousTransfer(ConnectionHandle handle, IsochronousTransferInfo transferInfo) {
    var completer = new ChromeCompleter<TransferResultInfo>.oneArg(_createTransferResultInfo);
    _usb.callMethod('isochronousTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future<bool> resetDevice(ConnectionHandle handle) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _usb.callMethod('resetDevice', [handle, completer.callback]);
    return completer.future;
  }
}

class Direction extends ChromeEnum {
  static const Direction IN = const Direction._('in');
  static const Direction OUT = const Direction._('out');

  static const List<Direction> VALUES = const[IN, OUT];

  const Direction._(String str): super(str);
}

class Recipient extends ChromeEnum {
  static const Recipient DEVICE = const Recipient._('device');
  static const Recipient _INTERFACE = const Recipient._('_interface');
  static const Recipient ENDPOINT = const Recipient._('endpoint');
  static const Recipient OTHER = const Recipient._('other');

  static const List<Recipient> VALUES = const[DEVICE, _INTERFACE, ENDPOINT, OTHER];

  const Recipient._(String str): super(str);
}

class RequestType extends ChromeEnum {
  static const RequestType STANDARD = const RequestType._('standard');
  static const RequestType CLASS = const RequestType._('class');
  static const RequestType VENDOR = const RequestType._('vendor');
  static const RequestType RESERVED = const RequestType._('reserved');

  static const List<RequestType> VALUES = const[STANDARD, CLASS, VENDOR, RESERVED];

  const RequestType._(String str): super(str);
}

class TransferType extends ChromeEnum {
  static const TransferType CONTROL = const TransferType._('control');
  static const TransferType INTERRUPT = const TransferType._('interrupt');
  static const TransferType ISOCHRONOUS = const TransferType._('isochronous');
  static const TransferType BULK = const TransferType._('bulk');

  static const List<TransferType> VALUES = const[CONTROL, INTERRUPT, ISOCHRONOUS, BULK];

  const TransferType._(String str): super(str);
}

class SynchronizationType extends ChromeEnum {
  static const SynchronizationType ASYNCHRONOUS = const SynchronizationType._('asynchronous');
  static const SynchronizationType ADAPTIVE = const SynchronizationType._('adaptive');
  static const SynchronizationType SYNCHRONOUS = const SynchronizationType._('synchronous');

  static const List<SynchronizationType> VALUES = const[ASYNCHRONOUS, ADAPTIVE, SYNCHRONOUS];

  const SynchronizationType._(String str): super(str);
}

class UsageType extends ChromeEnum {
  static const UsageType DATA = const UsageType._('data');
  static const UsageType FEEDBACK = const UsageType._('feedback');
  static const UsageType EXPLICITFEEDBACK = const UsageType._('explicitFeedback');

  static const List<UsageType> VALUES = const[DATA, FEEDBACK, EXPLICITFEEDBACK];

  const UsageType._(String str): super(str);
}

class Device extends ChromeObject {

  Device({int device, int vendorId, int productId}) {
    if (device != null) this.device = device;
    if (vendorId != null) this.vendorId = vendorId;
    if (productId != null) this.productId = productId;
  }

  Device.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get device => proxy['device'];
  set device(int value) => proxy['device'] = value;

  int get vendorId => proxy['vendorId'];
  set vendorId(int value) => proxy['vendorId'] = value;

  int get productId => proxy['productId'];
  set productId(int value) => proxy['productId'] = value;
}

class ConnectionHandle extends ChromeObject {

  ConnectionHandle({int handle, int vendorId, int productId}) {
    if (handle != null) this.handle = handle;
    if (vendorId != null) this.vendorId = vendorId;
    if (productId != null) this.productId = productId;
  }

  ConnectionHandle.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get handle => proxy['handle'];
  set handle(int value) => proxy['handle'] = value;

  int get vendorId => proxy['vendorId'];
  set vendorId(int value) => proxy['vendorId'] = value;

  int get productId => proxy['productId'];
  set productId(int value) => proxy['productId'] = value;
}

class EndpointDescriptor extends ChromeObject {

  EndpointDescriptor({int address, TransferType type, Direction direction, int maximumPacketSize, SynchronizationType synchronization, UsageType usage, int pollingInterval}) {
    if (address != null) this.address = address;
    if (type != null) this.type = type;
    if (direction != null) this.direction = direction;
    if (maximumPacketSize != null) this.maximumPacketSize = maximumPacketSize;
    if (synchronization != null) this.synchronization = synchronization;
    if (usage != null) this.usage = usage;
    if (pollingInterval != null) this.pollingInterval = pollingInterval;
  }

  EndpointDescriptor.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get address => proxy['address'];
  set address(int value) => proxy['address'] = value;

  TransferType get type => _createTransferType(proxy['type']);
  set type(TransferType value) => proxy['type'] = value;

  Direction get direction => _createDirection(proxy['direction']);
  set direction(Direction value) => proxy['direction'] = value;

  int get maximumPacketSize => proxy['maximumPacketSize'];
  set maximumPacketSize(int value) => proxy['maximumPacketSize'] = value;

  SynchronizationType get synchronization => _createSynchronizationType(proxy['synchronization']);
  set synchronization(SynchronizationType value) => proxy['synchronization'] = value;

  UsageType get usage => _createUsageType(proxy['usage']);
  set usage(UsageType value) => proxy['usage'] = value;

  int get pollingInterval => proxy['pollingInterval'];
  set pollingInterval(int value) => proxy['pollingInterval'] = value;
}

class InterfaceDescriptor extends ChromeObject {

  InterfaceDescriptor({int interfaceNumber, int alternateSetting, int interfaceClass, int interfaceSubclass, int interfaceProtocol, String description, EndpointDescriptor endpoints}) {
    if (interfaceNumber != null) this.interfaceNumber = interfaceNumber;
    if (alternateSetting != null) this.alternateSetting = alternateSetting;
    if (interfaceClass != null) this.interfaceClass = interfaceClass;
    if (interfaceSubclass != null) this.interfaceSubclass = interfaceSubclass;
    if (interfaceProtocol != null) this.interfaceProtocol = interfaceProtocol;
    if (description != null) this.description = description;
    if (endpoints != null) this.endpoints = endpoints;
  }

  InterfaceDescriptor.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get interfaceNumber => proxy['interfaceNumber'];
  set interfaceNumber(int value) => proxy['interfaceNumber'] = value;

  int get alternateSetting => proxy['alternateSetting'];
  set alternateSetting(int value) => proxy['alternateSetting'] = value;

  int get interfaceClass => proxy['interfaceClass'];
  set interfaceClass(int value) => proxy['interfaceClass'] = value;

  int get interfaceSubclass => proxy['interfaceSubclass'];
  set interfaceSubclass(int value) => proxy['interfaceSubclass'] = value;

  int get interfaceProtocol => proxy['interfaceProtocol'];
  set interfaceProtocol(int value) => proxy['interfaceProtocol'] = value;

  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;

  EndpointDescriptor get endpoints => _createEndpointDescriptor(proxy['endpoints']);
  set endpoints(EndpointDescriptor value) => proxy['endpoints'] = value;
}

class ControlTransferInfo extends ChromeObject {

  ControlTransferInfo({Direction direction, Recipient recipient, RequestType requestType, int request, int value, int index, int length, ArrayBuffer data}) {
    if (direction != null) this.direction = direction;
    if (recipient != null) this.recipient = recipient;
    if (requestType != null) this.requestType = requestType;
    if (request != null) this.request = request;
    if (value != null) this.value = value;
    if (index != null) this.index = index;
    if (length != null) this.length = length;
    if (data != null) this.data = data;
  }

  ControlTransferInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Direction get direction => _createDirection(proxy['direction']);
  set direction(Direction value) => proxy['direction'] = value;

  Recipient get recipient => _createRecipient(proxy['recipient']);
  set recipient(Recipient value) => proxy['recipient'] = value;

  RequestType get requestType => _createRequestType(proxy['requestType']);
  set requestType(RequestType value) => proxy['requestType'] = value;

  int get request => proxy['request'];
  set request(int value) => proxy['request'] = value;

  int get value => proxy['value'];
  set value(int value) => proxy['value'] = value;

  int get index => proxy['index'];
  set index(int value) => proxy['index'] = value;

  int get length => proxy['length'];
  set length(int value) => proxy['length'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class GenericTransferInfo extends ChromeObject {

  GenericTransferInfo({Direction direction, int endpoint, int length, ArrayBuffer data}) {
    if (direction != null) this.direction = direction;
    if (endpoint != null) this.endpoint = endpoint;
    if (length != null) this.length = length;
    if (data != null) this.data = data;
  }

  GenericTransferInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Direction get direction => _createDirection(proxy['direction']);
  set direction(Direction value) => proxy['direction'] = value;

  int get endpoint => proxy['endpoint'];
  set endpoint(int value) => proxy['endpoint'] = value;

  int get length => proxy['length'];
  set length(int value) => proxy['length'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class IsochronousTransferInfo extends ChromeObject {

  IsochronousTransferInfo({GenericTransferInfo transferInfo, int packets, int packetLength}) {
    if (transferInfo != null) this.transferInfo = transferInfo;
    if (packets != null) this.packets = packets;
    if (packetLength != null) this.packetLength = packetLength;
  }

  IsochronousTransferInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  GenericTransferInfo get transferInfo => _createGenericTransferInfo(proxy['transferInfo']);
  set transferInfo(GenericTransferInfo value) => proxy['transferInfo'] = value;

  int get packets => proxy['packets'];
  set packets(int value) => proxy['packets'] = value;

  int get packetLength => proxy['packetLength'];
  set packetLength(int value) => proxy['packetLength'] = value;
}

class TransferResultInfo extends ChromeObject {

  TransferResultInfo({int resultCode, ArrayBuffer data}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (data != null) this.data = data;
  }

  TransferResultInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class EnumerateDevicesOptions extends ChromeObject {

  EnumerateDevicesOptions({int vendorId, int productId}) {
    if (vendorId != null) this.vendorId = vendorId;
    if (productId != null) this.productId = productId;
  }

  EnumerateDevicesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get vendorId => proxy['vendorId'];
  set vendorId(int value) => proxy['vendorId'] = value;

  int get productId => proxy['productId'];
  set productId(int value) => proxy['productId'] = value;
}

class EnumerateDevicesAndRequestAccessOptions extends ChromeObject {

  EnumerateDevicesAndRequestAccessOptions({int vendorId, int productId, int interfaceId}) {
    if (vendorId != null) this.vendorId = vendorId;
    if (productId != null) this.productId = productId;
    if (interfaceId != null) this.interfaceId = interfaceId;
  }

  EnumerateDevicesAndRequestAccessOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get vendorId => proxy['vendorId'];
  set vendorId(int value) => proxy['vendorId'] = value;

  int get productId => proxy['productId'];
  set productId(int value) => proxy['productId'] = value;

  int get interfaceId => proxy['interfaceId'];
  set interfaceId(int value) => proxy['interfaceId'] = value;
}

Device _createDevice(JsObject proxy) => proxy == null ? null : new Device.fromProxy(proxy);
ConnectionHandle _createConnectionHandle(JsObject proxy) => proxy == null ? null : new ConnectionHandle.fromProxy(proxy);
InterfaceDescriptor _createInterfaceDescriptor(JsObject proxy) => proxy == null ? null : new InterfaceDescriptor.fromProxy(proxy);
TransferResultInfo _createTransferResultInfo(JsObject proxy) => proxy == null ? null : new TransferResultInfo.fromProxy(proxy);
TransferType _createTransferType(String value) => TransferType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
Direction _createDirection(String value) => Direction.VALUES.singleWhere((ChromeEnum e) => e.value == value);
SynchronizationType _createSynchronizationType(String value) => SynchronizationType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
UsageType _createUsageType(String value) => UsageType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
EndpointDescriptor _createEndpointDescriptor(JsObject proxy) => proxy == null ? null : new EndpointDescriptor.fromProxy(proxy);
Recipient _createRecipient(String value) => Recipient.VALUES.singleWhere((ChromeEnum e) => e.value == value);
RequestType _createRequestType(String value) => RequestType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ArrayBuffer _createArrayBuffer(JsObject proxy) => proxy == null ? null : new ArrayBuffer.fromProxy(proxy);
GenericTransferInfo _createGenericTransferInfo(JsObject proxy) => proxy == null ? null : new GenericTransferInfo.fromProxy(proxy);
