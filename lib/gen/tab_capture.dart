// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from tab_capture.idl - do not edit */

/**
 * 
 */
library chrome.tabCapture;

import '../src/common.dart';

/// Accessor for the `chrome.tabCapture` namespace.
final ChromeTabCapture tabCapture = new ChromeTabCapture._();

class ChromeTabCapture {
  static final JsObject _tabCapture = context['chrome']['tabCapture'];

  ChromeTabCapture._();

  Future capture(CaptureOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabCapture.callMethod('capture', [options, completer.callback]);
    return completer.future;
  }

  Future getCapturedTabs() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabCapture.callMethod('getCapturedTabs', [completer.callback]);
    return completer.future;
  }

  Stream<CaptureInfo> get onStatusChanged => _onStatusChanged.stream;

  final ChromeStreamController<CaptureInfo> _onStatusChanged =
      new ChromeStreamController<CaptureInfo>.oneArg(_tabCapture['onStatusChanged'], selfConverter);
}
