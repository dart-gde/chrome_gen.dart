/* This file has been generated from serial.idl - do not edit */

library chrome.serial;

import '../src/common.dart';

/// Accessor for the `chrome.serial` namespace.
final ChromeSerial serial = ChromeSerial._serial == null ? apiNotAvailable('chrome.serial') : new ChromeSerial._();

class ChromeSerial {
  static final JsObject _serial = chrome['serial'];

  ChromeSerial._();

  /**
   * Returns names of valid ports on this machine, each of which is likely to be
   * valid to pass as the port argument to open(). The list is regenerated each
   * time this method is called, as port validity is dynamic.
   * 
   * [callback]: Called with the list of ports.
   * 
   * Returns:
   * Copyright (c) 2012 The Chromium Authors. All rights reserved. Use of this
   * source code is governed by a BSD-style license that can be found in the
   * LICENSE file. Use the `chrome.serial` API to read from and write to a
   * device connected to a serial port.
   */
  Future<String> getPorts() {
    var completer = new ChromeCompleter<String>.oneArg();
    _serial.callMethod('getPorts', [completer.callback]);
    return completer.future;
  }

  /**
   * Opens a connection to the given serial port.
   * [port]: The name of the serial port to open.
   * [options]: Connection options.
   * [callback]: Called when the connection has been opened.
   */
  Future<OpenInfo> open(String port, [OpenOptions options]) {
    var completer = new ChromeCompleter<OpenInfo>.oneArg(_createOpenInfo);
    _serial.callMethod('open', [port, options, completer.callback]);
    return completer.future;
  }

  /**
   * Closes an open connection.
   * [connectionId]: The id of the opened connection.
   * [callback]: Called when the connection has been closed.
   * 
   * Returns:
   * Returns true if operation was successful.
   */
  Future<bool> close(int connectionId) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _serial.callMethod('close', [connectionId, completer.callback]);
    return completer.future;
  }

  /**
   * Reads a byte from the given connection.
   * [connectionId]: The id of the connection.
   * [bytesToRead]: The number of bytes to read.
   * [callback]: Called when all the requested bytes have been read or when the
   * read blocks.
   */
  Future<SerialReadInfo> read(int connectionId, int bytesToRead) {
    var completer = new ChromeCompleter<SerialReadInfo>.oneArg(_createSerialReadInfo);
    _serial.callMethod('read', [connectionId, bytesToRead, completer.callback]);
    return completer.future;
  }

  /**
   * Writes a string to the given connection.
   * [connectionId]: The id of the connection.
   * [data]: The string to write.
   * [callback]: Called when the string has been written.
   */
  Future<SerialWriteInfo> write(int connectionId, ArrayBuffer data) {
    var completer = new ChromeCompleter<SerialWriteInfo>.oneArg(_createSerialWriteInfo);
    _serial.callMethod('write', [connectionId, data, completer.callback]);
    return completer.future;
  }

  /**
   * Flushes all bytes in the given connection's input and output buffers.
   * [connectionId]: The id of the connection.
   * [callback]: Called when the flush is complete.
   * 
   * Returns:
   * Returns true if operation was successful.
   */
  Future<bool> flush(int connectionId) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _serial.callMethod('flush', [connectionId, completer.callback]);
    return completer.future;
  }

  Future<ControlSignalOptions> getControlSignals(int connectionId) {
    var completer = new ChromeCompleter<ControlSignalOptions>.oneArg(_createControlSignalOptions);
    _serial.callMethod('getControlSignals', [connectionId, completer.callback]);
    return completer.future;
  }

  Future<bool> setControlSignals(int connectionId, ControlSignalOptions options) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _serial.callMethod('setControlSignals', [connectionId, options, completer.callback]);
    return completer.future;
  }
}

class DataBit extends ChromeEnum {
  static const DataBit SEVENBIT = const DataBit._('sevenbit');
  static const DataBit EIGHTBIT = const DataBit._('eightbit');

  static const List<DataBit> VALUES = const[SEVENBIT, EIGHTBIT];

  const DataBit._(String str): super(str);
}

class ParityBit extends ChromeEnum {
  static const ParityBit NOPARITY = const ParityBit._('noparity');
  static const ParityBit ODDPARITY = const ParityBit._('oddparity');
  static const ParityBit EVENPARITY = const ParityBit._('evenparity');

  static const List<ParityBit> VALUES = const[NOPARITY, ODDPARITY, EVENPARITY];

  const ParityBit._(String str): super(str);
}

class StopBit extends ChromeEnum {
  static const StopBit ONESTOPBIT = const StopBit._('onestopbit');
  static const StopBit TWOSTOPBIT = const StopBit._('twostopbit');

  static const List<StopBit> VALUES = const[ONESTOPBIT, TWOSTOPBIT];

  const StopBit._(String str): super(str);
}

class OpenOptions extends ChromeObject {
  OpenOptions({int bitrate, DataBit dataBit, ParityBit parityBit, StopBit stopBit}) {
    if (bitrate != null) this.bitrate = bitrate;
    if (dataBit != null) this.dataBit = dataBit;
    if (parityBit != null) this.parityBit = parityBit;
    if (stopBit != null) this.stopBit = stopBit;
  }

  OpenOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bitrate => proxy['bitrate'];
  set bitrate(int value) => proxy['bitrate'] = value;

  DataBit get dataBit => _createDataBit(proxy['dataBit']);
  set dataBit(DataBit value) => proxy['dataBit'] = value;

  ParityBit get parityBit => _createParityBit(proxy['parityBit']);
  set parityBit(ParityBit value) => proxy['parityBit'] = value;

  StopBit get stopBit => _createStopBit(proxy['stopBit']);
  set stopBit(StopBit value) => proxy['stopBit'] = value;
}

class OpenInfo extends ChromeObject {
  OpenInfo({int connectionId}) {
    if (connectionId != null) this.connectionId = connectionId;
  }

  OpenInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get connectionId => proxy['connectionId'];
  set connectionId(int value) => proxy['connectionId'] = value;
}

class SerialReadInfo extends ChromeObject {
  SerialReadInfo({int bytesRead, ArrayBuffer data}) {
    if (bytesRead != null) this.bytesRead = bytesRead;
    if (data != null) this.data = data;
  }

  SerialReadInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bytesRead => proxy['bytesRead'];
  set bytesRead(int value) => proxy['bytesRead'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class SerialWriteInfo extends ChromeObject {
  SerialWriteInfo({int bytesWritten}) {
    if (bytesWritten != null) this.bytesWritten = bytesWritten;
  }

  SerialWriteInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bytesWritten => proxy['bytesWritten'];
  set bytesWritten(int value) => proxy['bytesWritten'] = value;
}

class ControlSignalOptions extends ChromeObject {
  ControlSignalOptions({bool dtr, bool rts, bool dcd, bool cts}) {
    if (dtr != null) this.dtr = dtr;
    if (rts != null) this.rts = rts;
    if (dcd != null) this.dcd = dcd;
    if (cts != null) this.cts = cts;
  }

  ControlSignalOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get dtr => proxy['dtr'];
  set dtr(bool value) => proxy['dtr'] = value;

  bool get rts => proxy['rts'];
  set rts(bool value) => proxy['rts'] = value;

  bool get dcd => proxy['dcd'];
  set dcd(bool value) => proxy['dcd'] = value;

  bool get cts => proxy['cts'];
  set cts(bool value) => proxy['cts'] = value;
}

OpenInfo _createOpenInfo(JsObject proxy) => proxy == null ? null : new OpenInfo.fromProxy(proxy);
SerialReadInfo _createSerialReadInfo(JsObject proxy) => proxy == null ? null : new SerialReadInfo.fromProxy(proxy);
SerialWriteInfo _createSerialWriteInfo(JsObject proxy) => proxy == null ? null : new SerialWriteInfo.fromProxy(proxy);
ControlSignalOptions _createControlSignalOptions(JsObject proxy) => proxy == null ? null : new ControlSignalOptions.fromProxy(proxy);
DataBit _createDataBit(String value) => DataBit.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ParityBit _createParityBit(String value) => ParityBit.VALUES.singleWhere((ChromeEnum e) => e.value == value);
StopBit _createStopBit(String value) => StopBit.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ArrayBuffer _createArrayBuffer(JsObject proxy) => proxy == null ? null : new ArrayBuffer.fromProxy(proxy);

