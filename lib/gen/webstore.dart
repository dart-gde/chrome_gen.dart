// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from webstore.json - do not edit */

/**
 * Use the `chrome.webstore` API to initiate app and extension installations
 * "inline" from your site.
 */
library chrome.webstore;

import '../src/common.dart';

/// Accessor for the `chrome.webstore` namespace.
final ChromeWebstore webstore = new ChromeWebstore._();

class ChromeWebstore {
  ChromeWebstore._();

  void install(String url, dynamic successCallback, dynamic failureCallback) {
    chrome['webstore'].callMethod('install', [url, successCallback, failureCallback]);
  }
}
