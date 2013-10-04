/* This file has been generated from socket.idl - do not edit */

library chrome.socket;

import '../src/common.dart';

/// Accessor for the `chrome.socket` namespace.
final ChromeSocket socket = ChromeSocket._socket == null ? apiNotAvailable('chrome.socket') : new ChromeSocket._();

class ChromeSocket {
  static final JsObject _socket = context['chrome']['socket'];

  ChromeSocket._();

  /**
   * Creates a socket of the specified type that will connect to the specified
   * remote machine.
   * [type]: The type of socket to create. Must be `tcp` or `udp`.
   * [options]: The socket options.
   * [callback]: Called when the socket has been created.
   */
  Future<CreateInfo> create(SocketType type, [CreateOptions options]) {
    var completer = new ChromeCompleter<CreateInfo>.oneArg(_createCreateInfo);
    _socket.callMethod('create', [type, options, completer.callback]);
    return completer.future;
  }

  /**
   * Destroys the socket. Each socket created should be destroyed after use.
   * [socketId]: The socketId.
   */
  void destroy(int socketId) {
    _socket.callMethod('destroy', [socketId]);
  }

  /**
   * Connects the socket to the remote machine (for a `tcp` socket). For a `udp`
   * socket, this sets the default address which packets are sent to and read
   * from for `read()` and `write()` calls.
   * [socketId]: The socketId.
   * [hostname]: The hostname or IP address of the remote machine.
   * [port]: The port of the remote machine.
   * [callback]: Called when the connection attempt is complete.
   */
  Future<int> connect(int socketId, String hostname, int port) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('connect', [socketId, hostname, port, completer.callback]);
    return completer.future;
  }

  /**
   * Binds the local address for socket. Currently, it does not support TCP
   * socket.
   * [socketId]: The socketId.
   * [address]: The address of the local machine.
   * [port]: The port of the local machine.
   * [callback]: Called when the bind attempt is complete.
   */
  Future<int> bind(int socketId, String address, int port) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('bind', [socketId, address, port, completer.callback]);
    return completer.future;
  }

  /**
   * Disconnects the socket. For UDP sockets, `disconnect` is a non-operation
   * but is safe to call.
   * [socketId]: The socketId.
   */
  void disconnect(int socketId) {
    _socket.callMethod('disconnect', [socketId]);
  }

  /**
   * Reads data from the given connected socket.
   * [socketId]: The socketId.
   * [bufferSize]: The read buffer size.
   * [callback]: Delivers data that was available to be read without blocking.
   */
  Future<SocketReadInfo> read(int socketId, [int bufferSize]) {
    var completer = new ChromeCompleter<SocketReadInfo>.oneArg(_createSocketReadInfo);
    _socket.callMethod('read', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  /**
   * Writes data on the given connected socket.
   * [socketId]: The socketId.
   * [data]: The data to write.
   * [callback]: Called when the write operation completes without blocking or
   * an error occurs.
   */
  Future<SocketWriteInfo> write(int socketId, ArrayBuffer data) {
    var completer = new ChromeCompleter<SocketWriteInfo>.oneArg(_createSocketWriteInfo);
    _socket.callMethod('write', [socketId, data, completer.callback]);
    return completer.future;
  }

  /**
   * Receives data from the given UDP socket.
   * [socketId]: The socketId.
   * [bufferSize]: The receive buffer size.
   * [callback]: Returns result of the recvFrom operation.
   */
  Future<RecvFromInfo> recvFrom(int socketId, [int bufferSize]) {
    var completer = new ChromeCompleter<RecvFromInfo>.oneArg(_createRecvFromInfo);
    _socket.callMethod('recvFrom', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  /**
   * Sends data on the given UDP socket to the given address and port.
   * [socketId]: The socketId.
   * [data]: The data to write.
   * [address]: The address of the remote machine.
   * [port]: The port of the remote machine.
   * [callback]: Called when the send operation completes without blocking or an
   * error occurs.
   */
  Future<SocketWriteInfo> sendTo(int socketId, ArrayBuffer data, String address, int port) {
    var completer = new ChromeCompleter<SocketWriteInfo>.oneArg(_createSocketWriteInfo);
    _socket.callMethod('sendTo', [socketId, data, address, port, completer.callback]);
    return completer.future;
  }

  /**
   * This method applies to TCP sockets only. Listens for connections on the
   * specified port and address. This effectively makes this a server socket,
   * and client socket functions (connect, read, write) can no longer be used on
   * this socket.
   * [socketId]: The socketId.
   * [address]: The address of the local machine.
   * [port]: The port of the local machine.
   * [backlog]: Length of the socket's listen queue.
   * [callback]: Called when listen operation completes.
   */
  Future<int> listen(int socketId, String address, int port, [int backlog]) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('listen', [socketId, address, port, backlog, completer.callback]);
    return completer.future;
  }

  /**
   * This method applies to TCP sockets only. Registers a callback function to
   * be called when a connection is accepted on this listening server socket.
   * Listen must be called first. If there is already an active accept callback,
   * this callback will be invoked immediately with an error as the resultCode.
   * [socketId]: The socketId.
   * [callback]: The callback is invoked when a new socket is accepted.
   */
  Future<AcceptInfo> accept(int socketId) {
    var completer = new ChromeCompleter<AcceptInfo>.oneArg(_createAcceptInfo);
    _socket.callMethod('accept', [socketId, completer.callback]);
    return completer.future;
  }

  /**
   * Enables or disables the keep-alive functionality for a TCP connection.
   * [socketId]: The socketId.
   * [enable]: If true, enable keep-alive functionality.
   * [delay]: Set the delay seconds between the last data packet received and
   * the first keepalive probe. Default is 0.
   * [callback]: Called when the setKeepAlive attempt is complete.
   */
  Future<bool> setKeepAlive(int socketId, bool enable, [int delay]) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _socket.callMethod('setKeepAlive', [socketId, enable, delay, completer.callback]);
    return completer.future;
  }

  /**
   * Sets or clears `TCP_NODELAY` for a TCP connection. Nagle's algorithm will
   * be disabled when `TCP_NODELAY` is set.
   * [socketId]: The socketId.
   * [noDelay]: If true, disables Nagle's algorithm.
   * [callback]: Called when the setNoDelay attempt is complete.
   */
  Future<bool> setNoDelay(int socketId, bool noDelay) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _socket.callMethod('setNoDelay', [socketId, noDelay, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the state of the given socket.
   * [socketId]: The socketId.
   * [callback]: Called when the state is available.
   */
  Future<SocketInfo> getInfo(int socketId) {
    var completer = new ChromeCompleter<SocketInfo>.oneArg(_createSocketInfo);
    _socket.callMethod('getInfo', [socketId, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about local adapters on this system.
   * [callback]: Called when local adapter information is available.
   */
  Future<NetworkInterface> getNetworkList() {
    var completer = new ChromeCompleter<NetworkInterface>.oneArg(_createNetworkInterface);
    _socket.callMethod('getNetworkList', [completer.callback]);
    return completer.future;
  }

  /**
   * Join the multicast group and start to receive packets from that group. The
   * socket must be of UDP type and must be bound to a local port before calling
   * this method.
   * [socketId]: The socketId.
   * [address]: The group address to join. Domain names are not supported.
   * [callback]: Called when the join group operation is done with an integer
   * parameter indicating the platform-independent error code.
   */
  Future<int> joinGroup(int socketId, String address) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('joinGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  /**
   * Leave the multicast group previously joined using `joinGroup`. It's not
   * necessary to leave the multicast group before destroying the socket or
   * exiting. This is automatically called by the OS.
   * 
   * Leaving the group will prevent the router from sending multicast datagrams
   * to the local host, presuming no other process on the host is still joined
   * to the group.
   * 
   * [socketId]: The socketId.
   * [address]: The group address to leave. Domain names are not supported.
   * [callback]: Called when the leave group operation is done with an integer
   * parameter indicating the platform-independent error code.
   */
  Future<int> leaveGroup(int socketId, String address) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('leaveGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  /**
   * Set the time-to-live of multicast packets sent to the multicast group.
   * 
   * Calling this method does not require multicast permissions.
   * 
   * [socketId]: The socketId.
   * [ttl]: The time-to-live value.
   * [callback]: Called when the configuration operation is done.
   */
  Future<int> setMulticastTimeToLive(int socketId, int ttl) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('setMulticastTimeToLive', [socketId, ttl, completer.callback]);
    return completer.future;
  }

  /**
   * Set whether multicast packets sent from the host to the multicast group
   * will be looped back to the host.
   * 
   * Note: the behavior of `setMulticastLoopbackMode` is slightly different
   * between Windows and Unix-like systems. The inconsistency happens only when
   * there is more than one application on the same host joined to the same
   * multicast group while having different settings on multicast loopback mode.
   * On Windows, the applications with loopback off will not RECEIVE the
   * loopback packets; while on Unix-like systems, the applications with
   * loopback off will not SEND the loopback packets to other applications on
   * the same host. See MSDN: http://goo.gl/6vqbj
   * 
   * Calling this method does not require multicast permissions.
   * 
   * [socketId]: The socketId.
   * [enabled]: Indicate whether to enable loopback mode.
   * [callback]: Called when the configuration operation is done.
   */
  Future<int> setMulticastLoopbackMode(int socketId, bool enabled) {
    var completer = new ChromeCompleter<int>.oneArg();
    _socket.callMethod('setMulticastLoopbackMode', [socketId, enabled, completer.callback]);
    return completer.future;
  }

  /**
   * Get the multicast group addresses the socket is currently joined to.
   * [socketId]: The socketId.
   * [callback]: Called with an array of strings of the result.
   */
  Future<String> getJoinedGroups(int socketId) {
    var completer = new ChromeCompleter<String>.oneArg();
    _socket.callMethod('getJoinedGroups', [socketId, completer.callback]);
    return completer.future;
  }
}

/**
 * Copyright (c) 2012 The Chromium Authors. All rights reserved. Use of this
 * source code is governed by a BSD-style license that can be found in the
 * LICENSE file. Use the `chrome.socket` API to send and receive data over the
 * network using TCP and UDP connections.
 */
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
