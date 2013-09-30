/* This file has been generated from audio.idl - do not edit */

library chrome.audio;

import '../src/common.dart';

/// Accessor for the `chrome.audio` namespace.
final ChromeAudio audio = new ChromeAudio._();

class ChromeAudio {
  static final JsObject _audio = context['chrome']['audio'];

  ChromeAudio._();

  Future<JsObject> getInfo() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
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
  static OutputDeviceInfo create(JsObject proxy) => proxy == null ? null : new OutputDeviceInfo.fromProxy(proxy);

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
  set volume(double value) => proxy['volume'] = value;
}

class InputDeviceInfo extends ChromeObject {
  static InputDeviceInfo create(JsObject proxy) => proxy == null ? null : new InputDeviceInfo.fromProxy(proxy);

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
  set gain(double value) => proxy['gain'] = value;
}

class DeviceProperties extends ChromeObject {
  static DeviceProperties create(JsObject proxy) => proxy == null ? null : new DeviceProperties.fromProxy(proxy);

  DeviceProperties({bool isMuted, double volume, double gain}) {
    if (isMuted != null) this.isMuted = isMuted;
    if (volume != null) this.volume = volume;
    if (gain != null) this.gain = gain;
  }

  DeviceProperties.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get isMuted => proxy['isMuted'];
  set isMuted(bool value) => proxy['isMuted'] = value;

  double get volume => proxy['volume'];
  set volume(double value) => proxy['volume'] = value;

  double get gain => proxy['gain'];
  set gain(double value) => proxy['gain'] = value;
}
