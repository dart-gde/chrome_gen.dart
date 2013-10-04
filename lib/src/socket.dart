
// The code here has been copied from package:chrome; we should port over the
// rest of the higher level socket API as well (i.e. the manually written
// classes on top of the raw Chrome API).

library chrome.src.socket;

import 'package:logging/logging.dart';

import 'common.dart';
import '../gen/socket.dart';

class TcpClient {
  Logger _logger = new Logger("TcpClient");

  String host;
  int port;

  Timer _intervalHandle;

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  SocketType _socketType;
  CreateInfo _createInfo;
  int get socketId => _createInfo.socketId;

  TcpClient(this.host, this.port);

//  TcpClient.fromSocketId(
//      int socketId,
//      { OnAcceptedCallback connected: null,
//        OnReadTcpSocket this.onRead: null,
//        OnReceived this.receive: null}) {
//
//    _createInfo = new CreateInfo(socketId);
//    state.then((SocketInfo socketInfo) {
//      port = socketInfo.peerPort;
//      host = socketInfo.peerAddress;
//
//      _isConnected = true;
//      _setupDataPoll();
//
//      if (connected != null) {
//        _logger.fine("connected != null, socketInfo = $socketInfo");
//        connected(this, socketInfo);
//      }
//    });
//  }

  Future<SocketInfo> get state => socket.getInfo(socketId);

  Future<bool> connect() {
    var completer = new Completer();
    _socketType = SocketType.TCP;
    socket.create(_socketType).then((CreateInfo createInfo) {
      _logger.fine("Socket.create.then = ${createInfo}");
      _createInfo = createInfo;
      socket.connect(_createInfo.socketId, host, port).then((int result) {
        if (result < 0) {
          completer.complete(false);
        } else {
          _isConnected = true;
          //_setupDataPoll();
          completer.complete(_isConnected);
        }
      });
    });
    return completer.future;
  }

  void disconnect() {
    if (_createInfo != null) {
      socket.disconnect(_createInfo.socketId);
    }

    if (_intervalHandle != null) {
      _intervalHandle.cancel();
    }

    _isConnected = false;
  }

  Future<SocketWriteInfo> send(String message) {
    return socket.write(
        _createInfo.socketId, new ArrayBuffer.fromString(message));
  }

//  void _setupDataPoll() {
//    _intervalHandle =
//        new Timer.periodic(const Duration(milliseconds: 500), _read);
//  }

//  OnReceived receive; // passed a String
//  OnReadTcpSocket onRead; // passed a SocketReadInfo
//
//  void _read(Timer timer) {
//    _logger.fine("enter: read()");
//    socket.read(_createInfo.socketId).then((SocketReadInfo readInfo) {
//      if (readInfo == null) {
//        return;
//      }
//
//      _logger.fine("then: read()");
//      if (onRead != null) {
//        onRead(readInfo);
//      }
//
//      if (receive != null) {
//        // Convert back to string and invoke receive
//        // Might want to add this kind of method
//        // onto SocketReadInfo
//        /*
//        var blob =
//            new html.Blob([new html.Uint8Array.fromBuffer(readInfo.data)]);
//        var fileReader = new html.FileReader();
//        fileReader.on.load.add((html.Event event) {
//          _logger.fine("fileReader.result = ${fileReader.result}");
//          receive(fileReader.result);
//        });
//        fileReader.readAsText(blob);
//        */
//        _logger.fine(readInfo.data.toString());
//        var str = new String.fromCharCodes(
//            new typed_data.Uint8List.view(readInfo.data));
//        //_logger.fine("receive(str) = ${str}");
//        receive(str, this);
//      }
//    });
//  }

}

class TcpServer {
  Logger _logger = new Logger("TcpServer");

  List<TcpClient> _openConnections = []; // list of open sockets
  CreateInfo _createInfo; // socketid data

  String address;
  int port;
  int backlog;
  var options;

  bool _isListening = false;
  bool get isListening => _isListening;

  TcpServer(this.address, this.port, {this.backlog: 5, this.options});

  OnReceived receive;
  _onReceived(String message, TcpClient client) {
    _logger.fine("message: ${message}");
    if (receive != null) {
      receive(message, client);
    }
  }

  OnReadTcpSocket onRead;
  _onReadTcpSocket(SocketReadInfo readInfo) {
    _logger.fine("readInfo: ${readInfo}");
    if (onRead != null) {
      onRead(readInfo);
    }
  }

  OnAcceptedCallback onAccept;
  _onAccept(AcceptInfo acceptInfo) {
    _logger.fine("acceptInfo = ${acceptInfo}");

    // continue to accept other connections.
    socket.accept(_createInfo.socketId).then(_onAccept);

    _logger.fine("moved onto new connection");

    if (acceptInfo.resultCode == 0) {
      // successful
      var tcpConnection = new TcpClient.fromSocketId(
          acceptInfo.socketId,
          connected: onAccept,
          onRead: _onReadTcpSocket,
          receive: _onReceived);

      _openConnections.add(tcpConnection);

    } else {
      // error
      _logger.shout("accept(): resultCode = ${acceptInfo.resultCode}");
    }
  }

  Future<bool> listen() {
    var completer = new Completer();
    socket.create(SocketType.TCP).then((CreateInfo createInfo) {
      _createInfo = createInfo;
      _logger.fine("listen(): socket.create(): _createInfo = ${_createInfo}");

      socket.listen(_createInfo.socketId, address, port, backlog)
      .then((int resultCode) {
        _logger.fine("listen(): socket.listen() resultCode = ${resultCode}");
        if (resultCode == 0) {
          socket.accept(_createInfo.socketId).then(_onAccept);
        } else {
          // error
          _logger.shout("listen(): resultCode = ${resultCode}");
        }
      });

      _isListening = true;
      completer.complete(isListening);
    });

    return completer.future;
  }

  connect() {}

  void disconnect() {
    if (_createInfo != null) {
      socket.disconnect(_createInfo.socketId);
    }

    _openConnections.forEach((TcpClient client) => client.disconnect());
    _openConnections.clear();
    _createInfo = null;
  }

  // receive() {}
  send() {}
}
