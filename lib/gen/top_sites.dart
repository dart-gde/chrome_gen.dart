/* This file has been generated from top_sites.json - do not edit */

/**
 * Use the `chrome.topSites` API to access the top sites that are displayed on
 * the new tab page.
 */
library chrome.topSites;

import '../src/common.dart';

/// Accessor for the `chrome.topSites` namespace.
final ChromeTopSites topSites = (ChromeTopSites._topSites == null ? null : new ChromeTopSites._());

class ChromeTopSites {
  static final JsObject _topSites = context['chrome']['topSites'];

  ChromeTopSites._();

  bool get available => _topSites != null;

  /**
   * Gets a list of top sites.
   */
  Future<List<MostVisitedURL>> get() {
    var completer = new ChromeCompleter<List<MostVisitedURL>>.oneArg((e) => listify(e, _createMostVisitedURL));
    _topSites.callMethod('get', [completer.callback]);
    return completer.future;
  }
}

/**
 * An object encapsulating a most visited URL, such as the URLs on the new tab
 * page.
 */
class MostVisitedURL extends ChromeObject {

  MostVisitedURL({String url, String title}) {
    if (url != null) this.url = url;
    if (title != null) this.title = title;
  }

  MostVisitedURL.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The most visited URL.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  /**
   * The title of the page
   */
  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;
}

MostVisitedURL _createMostVisitedURL(JsObject proxy) => proxy == null ? null : new MostVisitedURL.fromProxy(proxy);
