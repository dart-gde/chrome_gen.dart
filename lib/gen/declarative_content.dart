/* This file has been generated from declarative_content.json - do not edit */

/**
 * Use the `chrome.declarativeContent` API to take actions depending on the
 * content of a page, without requiring permission to read the page's content.
 */
library chrome.declarativeContent;

import 'events.dart';
import '../src/common.dart';

/// Accessor for the `chrome.declarativeContent` namespace.
final ChromeDeclarativeContent declarativeContent = ChromeDeclarativeContent._declarativeContent == null ? apiNotAvailable('chrome.declarativeContent') : new ChromeDeclarativeContent._();

class ChromeDeclarativeContent {
  static final JsObject _declarativeContent = chrome['declarativeContent'];

  ChromeDeclarativeContent._();

  Stream get onPageChanged => _onPageChanged.stream;

  final ChromeStreamController _onPageChanged =
      new ChromeStreamController.noArgs(_declarativeContent['onPageChanged']);
}

/**
 * Matches the state of a web page by various criteria.
 */
class PageStateMatcher extends ChromeObject {
  PageStateMatcher({UrlFilter pageUrl, List<String> css}) {
    if (pageUrl != null) this.pageUrl = pageUrl;
    if (css != null) this.css = css;
  }

  PageStateMatcher.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Matches if the condition of the UrlFilter are fulfilled for the top-level
   * URL of the page.
   */
  UrlFilter get pageUrl => _createUrlFilter(proxy['pageUrl']);
  set pageUrl(UrlFilter value) => proxy['pageUrl'] = jsify(value);

  /**
   * Matches if all of the CSS selectors in the array match in a frame with the
   * same origin as the page's main frame.  Note that listing hundreds of CSS
   * selectors here can slow down web sites.
   */
  List<String> get css => listify(proxy['css']);
  set css(List<String> value) => proxy['css'] = jsify(value);
}

/**
 * Declarative event action that shows the extension's [][pageAction page
 * action] while the corresponding conditions are met.  This action can be used
 * without [host permissions](declare_permissions.html#host-permission).  If the
 * extension takes the [activeTab](activeTab.html) permission, a click on the
 * page action will grant access to the active tab.
 */
class ShowPageAction extends ChromeObject {
  ShowPageAction();

  ShowPageAction.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

UrlFilter _createUrlFilter(JsObject proxy) => proxy == null ? null : new UrlFilter.fromProxy(proxy);
