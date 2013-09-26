/* This file has been generated from serial.idl - do not edit */

library chrome.serial;

import '../src/common.dart';

/// Accessor for the `chrome.serial` namespace.
final ChromeSerial serial = new ChromeSerial._();

class ChromeSerial {
  static final JsObject _serial = context['chrome']['serial'];

  ChromeSerial._();

  Future getPorts() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('getPorts', [completer.callback]);
    return completer.future;
  }

  Future open(String port, [OpenOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('open', [port, options, completer.callback]);
    return completer.future;
  }

  Future close(int connectionId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('close', [connectionId, completer.callback]);
    return completer.future;
  }

  Future read(int connectionId, int bytesToRead) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('read', [connectionId, bytesToRead, completer.callback]);
    return completer.future;
  }

  Future write(int connectionId, ArrayBuffer data) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('write', [connectionId, data, completer.callback]);
    return completer.future;
  }

  Future flush(int connectionId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('flush', [connectionId, completer.callback]);
    return completer.future;
  }

  Future getControlSignals(int connectionId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('getControlSignals', [connectionId, completer.callback]);
    return completer.future;
  }

  Future setControlSignals(int connectionId, ControlSignalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _serial.callMethod('setControlSignals', [connectionId, options, completer.callback]);
    return completer.future;
  }
}

class DataBit extends ChromeEnum {
  static const DataBit SEVENBIT = const DataBit._('sevenbit');
  static const DataBit EIGHTBIT = const DataBit._('eightbit');

  static List<DataBit> _values = [SEVENBIT, EIGHTBIT];

  static List<DataBit> get values => _values;

  static DataBit create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const DataBit._(String str): super(str);
}

class ParityBit extends ChromeEnum {
  static const ParityBit NOPARITY = const ParityBit._('noparity');
  static const ParityBit ODDPARITY = const ParityBit._('oddparity');
  static const ParityBit EVENPARITY = const ParityBit._('evenparity');

  static List<ParityBit> _values = [NOPARITY, ODDPARITY, EVENPARITY];

  static List<ParityBit> get values => _values;

  static ParityBit create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const ParityBit._(String str): super(str);
}

class StopBit extends ChromeEnum {
  static const StopBit ONESTOPBIT = const StopBit._('onestopbit');
  static const StopBit TWOSTOPBIT = const StopBit._('twostopbit');

  static List<StopBit> _values = [ONESTOPBIT, TWOSTOPBIT];

  static List<StopBit> get values => _values;

  static StopBit create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const StopBit._(String str): super(str);
}

class OpenOptions extends ChromeObject {
  static OpenOptions create(JsObject proxy) => proxy == null ? null : new OpenOptions.fromProxy(proxy);

  OpenOptions({int bitrate, DataBit dataBit, ParityBit parityBit, StopBit stopBit}) {
    if (bitrate != null) this.bitrate = bitrate;
    if (dataBit != null) this.dataBit = dataBit;
    if (parityBit != null) this.parityBit = parityBit;
    if (stopBit != null) this.stopBit = stopBit;
  }

  OpenOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bitrate => proxy['bitrate'];
  set bitrate(int value) => proxy['bitrate'] = value;

  DataBit get dataBit => DataBit.create(proxy['dataBit']);
  set dataBit(DataBit value) => proxy['dataBit'] = value;

  ParityBit get parityBit => ParityBit.create(proxy['parityBit']);
  set parityBit(ParityBit value) => proxy['parityBit'] = value;

  StopBit get stopBit => StopBit.create(proxy['stopBit']);
  set stopBit(StopBit value) => proxy['stopBit'] = value;
}

class OpenInfo extends ChromeObject {
  static OpenInfo create(JsObject proxy) => proxy == null ? null : new OpenInfo.fromProxy(proxy);

  OpenInfo({int connectionId}) {
    if (connectionId != null) this.connectionId = connectionId;
  }

  OpenInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get connectionId => proxy['connectionId'];
  set connectionId(int value) => proxy['connectionId'] = value;
}

class SerialReadInfo extends ChromeObject {
  static SerialReadInfo create(JsObject proxy) => proxy == null ? null : new SerialReadInfo.fromProxy(proxy);

  SerialReadInfo({int bytesRead, ArrayBuffer data}) {
    if (bytesRead != null) this.bytesRead = bytesRead;
    if (data != null) this.data = data;
  }

  SerialReadInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bytesRead => proxy['bytesRead'];
  set bytesRead(int value) => proxy['bytesRead'] = value;

  ArrayBuffer get data => ArrayBuffer.create(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class SerialWriteInfo extends ChromeObject {
  static SerialWriteInfo create(JsObject proxy) => proxy == null ? null : new SerialWriteInfo.fromProxy(proxy);

  SerialWriteInfo({int bytesWritten}) {
    if (bytesWritten != null) this.bytesWritten = bytesWritten;
  }

  SerialWriteInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get bytesWritten => proxy['bytesWritten'];
  set bytesWritten(int value) => proxy['bytesWritten'] = value;
}

class ControlSignalOptions extends ChromeObject {
  static ControlSignalOptions create(JsObject proxy) => proxy == null ? null : new ControlSignalOptions.fromProxy(proxy);

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
