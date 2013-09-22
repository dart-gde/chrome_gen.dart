// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from system_display.idl - do not edit */

/**
 * 
 */
library chrome.system_display;

import '../src/common.dart';

/// Accessor for the `chrome.system.display` namespace.
final ChromeSystemDisplay system_display = new ChromeSystemDisplay._();

class ChromeSystemDisplay {
  static final JsObject _system_display = context['chrome']['system']['display'];

  ChromeSystemDisplay._();

  Future getInfo() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_display.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  Future setDisplayProperties(String id, DisplayProperties info) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_display.callMethod('setDisplayProperties', [id, info, completer.callback]);
    return completer.future;
  }

  Stream get onDisplayChanged => _onDisplayChanged.stream;

  final ChromeStreamController _onDisplayChanged =
      new ChromeStreamController.noArgs(_system_display['onDisplayChanged']);
}
