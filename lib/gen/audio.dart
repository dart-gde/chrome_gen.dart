/* This file has been generated from audio.idl - do not edit */

library chrome.audio;

import '../src/common.dart';

/// Accessor for the `chrome.audio` namespace.
final ChromeAudio audio = ChromeAudio._audio == null ? apiNotAvailable('chrome.audio') : new ChromeAudio._();

class ChromeAudio {
  static final JsObject _audio = chrome['audio'];

  ChromeAudio._();

  /**
   * Get the information of all audio output and input devices.
   * 
   * Returns:
   * [outputInfo] null
   * [inputInfo] null
   */
  Future<GetInfoResult> getInfo() {
    var completer = new ChromeCompleter<GetInfoResult>.twoArgs(GetInfoResult._create);
    _audio.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  /**
   * Select a subset of audio devices as active.
   */
  Future setActiveDevices(String ids) {
    var completer = new ChromeCompleter.noArgs();
    _audio.callMethod('setActiveDevices', [ids, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the properties for the input or output device.
   */
  Future setProperties(String id, DeviceProperties properties) {
    var completer = new ChromeCompleter.noArgs();
    _audio.callMethod('setProperties', [id, jsify(properties), completer.callback]);
    return completer.future;
  }

  Stream get onDeviceChanged => _onDeviceChanged.stream;

  final ChromeStreamController _onDeviceChanged =
      new ChromeStreamController.noArgs(_audio['onDeviceChanged']);
}

class OutputDeviceInfo extends ChromeObject {
  OutputDeviceInfo({String id, String name, bool isActive, bool isMuted, double volume}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (isActive != null) this.isActive = isActive;
    if (isMuted != null) this.isMuted = isMuted;
    if (volume != null) this.volume = volume;
  }
  OutputDeviceInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  bool get isActive => proxy['isActive'];
  set isActive(bool value) => proxy['isActive'] = value;

  bool get isMuted => proxy['isMuted'];
  set isMuted(bool value) => proxy['isMuted'] = value;

  double get volume => proxy['volume'];
  set volume(double value) => proxy['volume'] = jsify(value);
}

class InputDeviceInfo extends ChromeObject {
  InputDeviceInfo({String id, String name, bool isActive, bool isMuted, double gain}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (isActive != null) this.isActive = isActive;
    if (isMuted != null) this.isMuted = isMuted;
    if (gain != null) this.gain = gain;
  }
  InputDeviceInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  bool get isActive => proxy['isActive'];
  set isActive(bool value) => proxy['isActive'] = value;

  bool get isMuted => proxy['isMuted'];
  set isMuted(bool value) => proxy['isMuted'] = value;

  double get gain => proxy['gain'];
  set gain(double value) => proxy['gain'] = jsify(value);
}

class DeviceProperties extends ChromeObject {
  DeviceProperties({bool isMuted, double volume, double gain}) {
    if (isMuted != null) this.isMuted = isMuted;
    if (volume != null) this.volume = volume;
    if (gain != null) this.gain = gain;
  }
  DeviceProperties.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get isMuted => proxy['isMuted'];
  set isMuted(bool value) => proxy['isMuted'] = value;

  double get volume => proxy['volume'];
  set volume(double value) => proxy['volume'] = jsify(value);

  double get gain => proxy['gain'];
  set gain(double value) => proxy['gain'] = jsify(value);
}

/**
 * The return type for [getInfo].
 */
class GetInfoResult {
  static GetInfoResult _create(outputInfo, inputInfo) {
    return new GetInfoResult._(_createOutputDeviceInfo(outputInfo), _createInputDeviceInfo(inputInfo));
  }

  OutputDeviceInfo outputInfo;
  InputDeviceInfo inputInfo;

  GetInfoResult._(this.outputInfo, this.inputInfo);
}

OutputDeviceInfo _createOutputDeviceInfo(JsObject proxy) => proxy == null ? null : new OutputDeviceInfo.fromProxy(proxy);
InputDeviceInfo _createInputDeviceInfo(JsObject proxy) => proxy == null ? null : new InputDeviceInfo.fromProxy(proxy);
