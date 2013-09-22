// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
