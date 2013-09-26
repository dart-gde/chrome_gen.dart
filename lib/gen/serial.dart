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

  static List<DataBit> _values = [SEVENBIT];

  static List<DataBit> get values => _values;

  static DataBit create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const DataBit._(String str): super(str);
}

class ParityBit extends ChromeEnum {
  static const ParityBit NOPARITY = const ParityBit._('noparity');

  static List<ParityBit> _values = [NOPARITY];

  static List<ParityBit> get values => _values;

  static ParityBit create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const ParityBit._(String str): super(str);
}

class StopBit extends ChromeEnum {
  static const StopBit ONESTOPBIT = const StopBit._('onestopbit');

  static List<StopBit> _values = [ONESTOPBIT];

  static List<StopBit> get values => _values;

  static StopBit create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const StopBit._(String str): super(str);
}

class OpenOptions extends ChromeObject {
  static OpenOptions create(JsObject proxy) => proxy == null ? null : new OpenOptions(proxy);

  OpenOptions(JsObject proxy): super(proxy);
}

class OpenInfo extends ChromeObject {
  static OpenInfo create(JsObject proxy) => proxy == null ? null : new OpenInfo(proxy);

  OpenInfo(JsObject proxy): super(proxy);
}

class SerialSerialReadInfo extends ChromeObject {
  static SerialSerialReadInfo create(JsObject proxy) => proxy == null ? null : new SerialSerialReadInfo(proxy);

  SerialSerialReadInfo(JsObject proxy): super(proxy);
}

class SerialSerialWriteInfo extends ChromeObject {
  static SerialSerialWriteInfo create(JsObject proxy) => proxy == null ? null : new SerialSerialWriteInfo(proxy);

  SerialSerialWriteInfo(JsObject proxy): super(proxy);
}

class ControlSignalOptions extends ChromeObject {
  static ControlSignalOptions create(JsObject proxy) => proxy == null ? null : new ControlSignalOptions(proxy);

  ControlSignalOptions(JsObject proxy): super(proxy);
}
