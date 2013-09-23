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
  static final JsObject _declarativeContent = context['chrome']['declarativeContent'];

  ChromeDeclarativeContent._();

  Stream get onPageChanged => _onPageChanged.stream;

  final ChromeStreamController _onPageChanged =
      new ChromeStreamController.noArgs(_declarativeContent['onPageChanged']);
}

/**
 * Matches the state of a web page by various criteria.
 * 
 * `pageUrl` Matches if the condition of the UrlFilter are fulfilled for the
 * top-level URL of the page.
 * 
 * `css` Matches if all of the CSS selectors in the array match in a frame with
 * the same origin as the page's main frame.  Note that listing hundreds of CSS
 * selectors here can slow down web sites.
 * 
 * `instanceType`
 */
class PageStateMatcher extends ChromeObject {
  static PageStateMatcher create(JsObject proxy) => new PageStateMatcher(proxy);

  PageStateMatcher(JsObject proxy): super(proxy);

  /**
   * Matches if the condition of the UrlFilter are fulfilled for the top-level
   * URL of the page.
   */
  UrlFilter get pageUrl => new UrlFilter(proxy['pageUrl']);

  /**
   * Matches if all of the CSS selectors in the array match in a frame with the
   * same origin as the page's main frame.  Note that listing hundreds of CSS
   * selectors here can slow down web sites.
   */
  List<String> get css => listify(proxy['css']);
}

/**
 * Declarative event action that shows the extension's [][pageAction page
 * action] while the corresponding conditions are met.  This action can be used
 * without [host permissions](declare_permissions.html#host-permission).  If the
 * extension takes the [activeTab](activeTab.html) permission, a click on the
 * page action will grant access to the active tab.
 * 
 * `instanceType`
 */
class ShowPageAction extends ChromeObject {
  static ShowPageAction create(JsObject proxy) => new ShowPageAction(proxy);

  ShowPageAction(JsObject proxy): super(proxy);
}
