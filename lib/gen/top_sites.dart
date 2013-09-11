// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from top_sites.json - do not edit */

/**
 * Use the `chrome.topSites` API to access the top sites that are displayed on
 * the new tab page.
 */
library chrome.top_sites;

import '../src/common.dart';

/// Accessor for the `chrome.top_sites` namespace.
final ChromeTopSites top_sites = new ChromeTopSites._();

class ChromeTopSites {
  ChromeTopSites._();

  /**
   * Gets a list of top sites.
   */
  Future get() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['top_sites'].callMethod('get', [completer.callback]);
    return completer.future;
  }
}
