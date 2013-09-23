/* This file has been generated from audio.idl - do not edit */

/**
 * 
 */
library chrome.audio;

import '../src/common.dart';

/// Accessor for the `chrome.audio` namespace.
final ChromeAudio audio = new ChromeAudio._();

class ChromeAudio {
  static final JsObject _audio = context['chrome']['audio'];

  ChromeAudio._();

  Future getInfo() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _audio.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  Future setActiveDevices(String ids) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _audio.callMethod('setActiveDevices', [ids, completer.callback]);
    return completer.future;
  }

  Future setProperties(String id, DeviceProperties properties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _audio.callMethod('setProperties', [id, properties, completer.callback]);
    return completer.future;
  }

  Stream get onDeviceChanged => _onDeviceChanged.stream;

  final ChromeStreamController _onDeviceChanged =
      new ChromeStreamController.noArgs(_audio['onDeviceChanged']);
}

class OutputDeviceInfo extends ChromeObject {
  static OutputDeviceInfo create(JsObject proxy) => new OutputDeviceInfo(proxy);

  OutputDeviceInfo(JsObject proxy): super(proxy);
}

class InputDeviceInfo extends ChromeObject {
  static InputDeviceInfo create(JsObject proxy) => new InputDeviceInfo(proxy);

  InputDeviceInfo(JsObject proxy): super(proxy);
}

class DeviceProperties extends ChromeObject {
  static DeviceProperties create(JsObject proxy) => new DeviceProperties(proxy);

  DeviceProperties(JsObject proxy): super(proxy);
}
