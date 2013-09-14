// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from infobars.json - do not edit */

/**
 * Use the `chrome.infobars` API to add a horizontal panel just above a tab's
 * contents. See the screenshot below.
 */
library chrome.infobars;

import '../src/common.dart';

/// Accessor for the `chrome.infobars` namespace.
final ChromeInfobars infobars = new ChromeInfobars._();

class ChromeInfobars {
  ChromeInfobars._();

  /**
   * Shows an infobar in the specified tab. The infobar will be closed
   * automatically when the tab navigates. Use window.close() to close the
   * infobar before then.
   */
  Future<dynamic> show(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['infobars'].callMethod('show', [details, completer.callback]);
    return completer.future;
  }
}
