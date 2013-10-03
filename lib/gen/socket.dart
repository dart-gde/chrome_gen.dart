/* This file has been generated from socket.idl - do not edit */

library chrome.socket;

import '../src/common.dart';

/// Accessor for the `chrome.socket` namespace.
final ChromeSocket socket = new ChromeSocket._();

class ChromeSocket {
  static final JsObject _socket = context['chrome']['socket'];

  ChromeSocket._();

  Future<CreateInfo> create(SocketType type, [CreateOptions options]) {
    var completer = new ChromeCompleter<CreateInfo>.oneArg(_createCreateInfo);
    _socket.callMethod('create', [type, options, completer.callback]);
    return completer.future;
  }

  void destroy(int socketId) {
    _socket.callMethod('destroy', [socketId]);
  }

  Future<int> connect(int socketId, String hostname, int port) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('connect', [socketId, hostname, port, completer.callback]);
    return completer.future;
  }

  Future<int> bind(int socketId, String address, int port) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('bind', [socketId, address, port, completer.callback]);
    return completer.future;
  }

  void disconnect(int socketId) {
    _socket.callMethod('disconnect', [socketId]);
  }

  Future<SocketReadInfo> read(int socketId, [int bufferSize]) {
    var completer = new ChromeCompleter<SocketReadInfo>.oneArg(_createSocketReadInfo);
    _socket.callMethod('read', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  Future<SocketWriteInfo> write(int socketId, ArrayBuffer data) {
    var completer = new ChromeCompleter<SocketWriteInfo>.oneArg(_createSocketWriteInfo);
    _socket.callMethod('write', [socketId, data, completer.callback]);
    return completer.future;
  }

  Future<RecvFromInfo> recvFrom(int socketId, [int bufferSize]) {
    var completer = new ChromeCompleter<RecvFromInfo>.oneArg(_createRecvFromInfo);
    _socket.callMethod('recvFrom', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  Future<SocketWriteInfo> sendTo(int socketId, ArrayBuffer data, String address, int port) {
    var completer = new ChromeCompleter<SocketWriteInfo>.oneArg(_createSocketWriteInfo);
    _socket.callMethod('sendTo', [socketId, data, address, port, completer.callback]);
    return completer.future;
  }

  Future<int> listen(int socketId, String address, int port, [int backlog]) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('listen', [socketId, address, port, backlog, completer.callback]);
    return completer.future;
  }

  Future<AcceptInfo> accept(int socketId) {
    var completer = new ChromeCompleter<AcceptInfo>.oneArg(_createAcceptInfo);
    _socket.callMethod('accept', [socketId, completer.callback]);
    return completer.future;
  }

  Future<bool> setKeepAlive(int socketId, bool enable, [int delay]) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _socket.callMethod('setKeepAlive', [socketId, enable, delay, completer.callback]);
    return completer.future;
  }

  Future<bool> setNoDelay(int socketId, bool noDelay) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _socket.callMethod('setNoDelay', [socketId, noDelay, completer.callback]);
    return completer.future;
  }

  Future<SocketInfo> getInfo(int socketId) {
    var completer = new ChromeCompleter<SocketInfo>.oneArg(_createSocketInfo);
    _socket.callMethod('getInfo', [socketId, completer.callback]);
    return completer.future;
  }

  Future<NetworkInterface> getNetworkList() {
    var completer = new ChromeCompleter<NetworkInterface>.oneArg(_createNetworkInterface);
    _socket.callMethod('getNetworkList', [completer.callback]);
    return completer.future;
  }

  Future<int> joinGroup(int socketId, String address) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('joinGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  Future<int> leaveGroup(int socketId, String address) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('leaveGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  Future<int> setMulticastTimeToLive(int socketId, int ttl) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('setMulticastTimeToLive', [socketId, ttl, completer.callback]);
    return completer.future;
  }

  Future<int> setMulticastLoopbackMode(int socketId, bool enabled) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('setMulticastLoopbackMode', [socketId, enabled, completer.callback]);
    return completer.future;
  }

  Future<String> getJoinedGroups(int socketId) {
    var completer = new ChromeCompleter<String>.oneArg();
    _socket.callMethod('getJoinedGroups', [socketId, completer.callback]);
    return completer.future;
  }
}

class SocketType extends ChromeEnum {
  static const SocketType TCP = const SocketType._('tcp');
  static const SocketType UDP = const SocketType._('udp');

  static const List<SocketType> VALUES = const[TCP, UDP];

  const SocketType._(String str): super(str);
}

class CreateOptions extends ChromeObject {

  CreateOptions();

  CreateOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

class CreateInfo extends ChromeObject {

  CreateInfo({int socketId}) {
    if (socketId != null) this.socketId = socketId;
  }

  CreateInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get socketId => proxy['socketId'];
  set socketId(int value) => proxy['socketId'] = value;
}

class AcceptInfo extends ChromeObject {

  AcceptInfo({int resultCode, int socketId}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (socketId != null) this.socketId = socketId;
  }

  AcceptInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  int get socketId => proxy['socketId'];
  set socketId(int value) => proxy['socketId'] = value;
}

class SocketReadInfo extends ChromeObject {

  SocketReadInfo({int resultCode, ArrayBuffer data}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (data != null) this.data = data;
  }

  SocketReadInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class SocketWriteInfo extends ChromeObject {

  SocketWriteInfo({int bytesWritten}) {
    if (bytesWritten != null) this.bytesWritten = bytesWritten;
  }

  SocketWriteInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bytesWritten => proxy['bytesWritten'];
  set bytesWritten(int value) => proxy['bytesWritten'] = value;
}

class RecvFromInfo extends ChromeObject {

  RecvFromInfo({int resultCode, ArrayBuffer data, String address, int port}) {
    if (resultCode != null) this.resultCode = resultCode;
    if (data != null) this.data = data;
    if (address != null) this.address = address;
    if (port != null) this.port = port;
  }

  RecvFromInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get resultCode => proxy['resultCode'];
  set resultCode(int value) => proxy['resultCode'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;

  int get port => proxy['port'];
  set port(int value) => proxy['port'] = value;
}

class SocketInfo extends ChromeObject {

  SocketInfo({SocketType socketType, bool connected, String peerAddress, int peerPort, String localAddress, int localPort}) {
    if (socketType != null) this.socketType = socketType;
    if (connected != null) this.connected = connected;
    if (peerAddress != null) this.peerAddress = peerAddress;
    if (peerPort != null) this.peerPort = peerPort;
    if (localAddress != null) this.localAddress = localAddress;
    if (localPort != null) this.localPort = localPort;
  }

  SocketInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  SocketType get socketType => _createSocketType(proxy['socketType']);
  set socketType(SocketType value) => proxy['socketType'] = value;

  bool get connected => proxy['connected'];
  set connected(bool value) => proxy['connected'] = value;

  String get peerAddress => proxy['peerAddress'];
  set peerAddress(String value) => proxy['peerAddress'] = value;

  int get peerPort => proxy['peerPort'];
  set peerPort(int value) => proxy['peerPort'] = value;

  String get localAddress => proxy['localAddress'];
  set localAddress(String value) => proxy['localAddress'] = value;

  int get localPort => proxy['localPort'];
  set localPort(int value) => proxy['localPort'] = value;
}

class NetworkInterface extends ChromeObject {

  NetworkInterface({String name, String address}) {
    if (name != null) this.name = name;
    if (address != null) this.address = address;
  }

  NetworkInterface.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;
}

CreateInfo _createCreateInfo(JsObject proxy) => proxy == null ? null : new CreateInfo.fromProxy(proxy);
SocketReadInfo _createSocketReadInfo(JsObject proxy) => proxy == null ? null : new SocketReadInfo.fromProxy(proxy);
SocketWriteInfo _createSocketWriteInfo(JsObject proxy) => proxy == null ? null : new SocketWriteInfo.fromProxy(proxy);
RecvFromInfo _createRecvFromInfo(JsObject proxy) => proxy == null ? null : new RecvFromInfo.fromProxy(proxy);
AcceptInfo _createAcceptInfo(JsObject proxy) => proxy == null ? null : new AcceptInfo.fromProxy(proxy);
SocketInfo _createSocketInfo(JsObject proxy) => proxy == null ? null : new SocketInfo.fromProxy(proxy);
NetworkInterface _createNetworkInterface(JsObject proxy) => proxy == null ? null : new NetworkInterface.fromProxy(proxy);
ArrayBuffer _createArrayBuffer(JsObject proxy) => proxy == null ? null : new ArrayBuffer.fromProxy(proxy);
SocketType _createSocketType(String value) => SocketType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
