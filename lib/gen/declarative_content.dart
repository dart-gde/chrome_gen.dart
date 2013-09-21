// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from declarative_content.json - do not edit */

/**
 * Use the `chrome.declarativeContent` API to take actions depending on the
 * content of a page, without requiring permission to read the page's content.
 */
library chrome.declarativeContent;

import 'events.dart';
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
  static PageStateMatcher create(JsObject proxy) => new PageStateMatcher(proxy);

  PageStateMatcher(JsObject proxy): super(proxy);

  /**
   * Matches if the condition of the UrlFilter are fulfilled for the top-level
   * URL of the page.
   */
  UrlFilter get pageUrl => new UrlFilter(this.proxy['pageUrl']);

  /**
   * Matches if all of the CSS selectors in the array match in a frame with the
   * same origin as the page's main frame.  Note that listing hundreds of CSS
   * selectors here can slow down web sites.
   */
  List<String> get css => listify(this.proxy['css']);
}

/**
 * Declarative event action that shows the extension's [][pageAction page
 * action] while the corresponding conditions are met.  This action can be used
 * without [host permissions](declare_permissions.html#host-permission).  If the
 * extension takes the [activeTab](activeTab.html) permission, a click on the
 * page action will grant access to the active tab.
 */
class ShowPageAction extends ChromeObject {
  static ShowPageAction create(JsObject proxy) => new ShowPageAction(proxy);

  ShowPageAction(JsObject proxy): super(proxy);
}
