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
  JsObject _declarativeContent;

  ChromeDeclarativeContent._() {
    _declarativeContent = context['chrome']['declarativeContent'];
  }

  Stream<dynamic> get onPageChanged => _onPageChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onPageChanged = null;
}

/**
 * Matches the state of a web page by various criteria.
 */
class PageStateMatcher extends ChromeObject {
  PageStateMatcher(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Declarative event action that shows the extension's [][pageAction page
 * action] while the corresponding conditions are met.  This action can be used
 * without [host permissions](declare_permissions.html#host-permission).  If the
 * extension takes the [activeTab](activeTab.html) permission, a click on the
 * page action will grant access to the active tab.
 */
class ShowPageAction extends ChromeObject {
  ShowPageAction(JsObject proxy): super(proxy);
  // TODO:
}
