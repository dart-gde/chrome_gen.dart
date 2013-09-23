/* This file has been generated from socket.idl - do not edit */

/**
 * 
 */
library chrome.socket;

import '../src/common.dart';

/// Accessor for the `chrome.socket` namespace.
final ChromeSocket socket = new ChromeSocket._();

class ChromeSocket {
  static final JsObject _socket = context['chrome']['socket'];

  ChromeSocket._();

  Future create(SocketType type, [CreateOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('create', [type, options, completer.callback]);
    return completer.future;
  }

  void destroy(int socketId) {
    _socket.callMethod('destroy', [socketId]);
  }

  Future connect(int socketId, String hostname, int port) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('connect', [socketId, hostname, port, completer.callback]);
    return completer.future;
  }

  Future bind(int socketId, String address, int port) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('bind', [socketId, address, port, completer.callback]);
    return completer.future;
  }

  void disconnect(int socketId) {
    _socket.callMethod('disconnect', [socketId]);
  }

  Future read(int socketId, [int bufferSize]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('read', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  Future write(int socketId, ArrayBuffer data) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('write', [socketId, data, completer.callback]);
    return completer.future;
  }

  Future recvFrom(int socketId, [int bufferSize]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('recvFrom', [socketId, bufferSize, completer.callback]);
    return completer.future;
  }

  Future sendTo(int socketId, ArrayBuffer data, String address, int port) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('sendTo', [socketId, data, address, port, completer.callback]);
    return completer.future;
  }

  Future listen(int socketId, String address, int port, [int backlog]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('listen', [socketId, address, port, backlog, completer.callback]);
    return completer.future;
  }

  Future accept(int socketId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('accept', [socketId, completer.callback]);
    return completer.future;
  }

  Future setKeepAlive(int socketId, bool enable, [int delay]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setKeepAlive', [socketId, enable, delay, completer.callback]);
    return completer.future;
  }

  Future setNoDelay(int socketId, bool noDelay) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setNoDelay', [socketId, noDelay, completer.callback]);
    return completer.future;
  }

  Future getInfo(int socketId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('getInfo', [socketId, completer.callback]);
    return completer.future;
  }

  Future getNetworkList() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('getNetworkList', [completer.callback]);
    return completer.future;
  }

  Future joinGroup(int socketId, String address) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('joinGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  Future leaveGroup(int socketId, String address) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('leaveGroup', [socketId, address, completer.callback]);
    return completer.future;
  }

  Future setMulticastTimeToLive(int socketId, int ttl) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setMulticastTimeToLive', [socketId, ttl, completer.callback]);
    return completer.future;
  }

  Future setMulticastLoopbackMode(int socketId, bool enabled) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('setMulticastLoopbackMode', [socketId, enabled, completer.callback]);
    return completer.future;
  }

  Future getJoinedGroups(int socketId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _socket.callMethod('getJoinedGroups', [socketId, completer.callback]);
    return completer.future;
  }
}

class CreateOptions extends ChromeObject {
  static CreateOptions create(JsObject proxy) => new CreateOptions(proxy);

  CreateOptions(JsObject proxy): super(proxy);
}

class CreateInfo extends ChromeObject {
  static CreateInfo create(JsObject proxy) => new CreateInfo(proxy);

  CreateInfo(JsObject proxy): super(proxy);
}

class AcceptInfo extends ChromeObject {
  static AcceptInfo create(JsObject proxy) => new AcceptInfo(proxy);

  AcceptInfo(JsObject proxy): super(proxy);
}

class ReadInfo extends ChromeObject {
  static ReadInfo create(JsObject proxy) => new ReadInfo(proxy);

  ReadInfo(JsObject proxy): super(proxy);
}

class WriteInfo extends ChromeObject {
  static WriteInfo create(JsObject proxy) => new WriteInfo(proxy);

  WriteInfo(JsObject proxy): super(proxy);
}

class RecvFromInfo extends ChromeObject {
  static RecvFromInfo create(JsObject proxy) => new RecvFromInfo(proxy);

  RecvFromInfo(JsObject proxy): super(proxy);
}

class SocketInfo extends ChromeObject {
  static SocketInfo create(JsObject proxy) => new SocketInfo(proxy);

  SocketInfo(JsObject proxy): super(proxy);
}

class NetworkInterface extends ChromeObject {
  static NetworkInterface create(JsObject proxy) => new NetworkInterface(proxy);

  NetworkInterface(JsObject proxy): super(proxy);
}
