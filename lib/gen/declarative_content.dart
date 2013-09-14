// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from declarative_content.json - do not edit */

/**
 * Use the `chrome.declarativeContent` API to take actions depending on the
 * content of a page, without requiring permission to read the page's content.
 */
library chrome.declarativeContent;

import '../src/common.dart';

/// Accessor for the `chrome.declarativeContent` namespace.
final ChromeDeclarativeContent declarativeContent = new ChromeDeclarativeContent._();

class ChromeDeclarativeContent {
  ChromeDeclarativeContent._();

  final ChromeStreamController _onPageChanged = null;

  Stream get onPageChanged => _onPageChanged.stream;
}
