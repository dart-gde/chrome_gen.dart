/* This file has been generated from history.json - do not edit */

/**
 * Use the `chrome.history` API to interact with the browser's record of visited
 * pages. You can add, remove, and query for URLs in the browser's history. To
 * override the history page with your own version, see [Override
 * Pages](override.html).
 */
library chrome.history;

import '../src/common.dart';

/// Accessor for the `chrome.history` namespace.
final ChromeHistory history = ChromeHistory._history == null ? apiNotAvailable('chrome.history') : new ChromeHistory._();

class ChromeHistory {
  static final JsObject _history = context['chrome']['history'];

  ChromeHistory._();

  /**
   * Searches the history for the last visit time of each page matching the
   * query.
   */
  Future<List<HistoryItem>> search(Map query) {
    var completer = new ChromeCompleter<List<HistoryItem>>.oneArg((e) => listify(e, _createHistoryItem));
    _history.callMethod('search', [jsify(query), completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about visits to a URL.
   */
  Future<List<VisitItem>> getVisits(Map details) {
    var completer = new ChromeCompleter<List<VisitItem>>.oneArg((e) => listify(e, _createVisitItem));
    _history.callMethod('getVisits', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Adds a URL to the history at the current time with a [transition
   * type](#transition_types) of "link".
   */
  Future addUrl(Map details) {
    var completer = new ChromeCompleter.noArgs();
    _history.callMethod('addUrl', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Removes all occurrences of the given URL from the history.
   */
  Future deleteUrl(Map details) {
    var completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteUrl', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Removes all items within the specified date range from the history.  Pages
   * will not be removed from the history unless all visits fall within the
   * range.
   */
  Future deleteRange(Map range) {
    var completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteRange', [jsify(range), completer.callback]);
    return completer.future;
  }

  /**
   * Deletes all items from the history.
   */
  Future deleteAll() {
    var completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a URL is visited, providing the HistoryItem data for that URL.
   * This event fires before the page has loaded.
   */
  Stream<HistoryItem> get onVisited => _onVisited.stream;

  final ChromeStreamController<HistoryItem> _onVisited =
      new ChromeStreamController<HistoryItem>.oneArg(_history['onVisited'], _createHistoryItem);

  /**
   * Fired when one or more URLs are removed from the history service.  When all
   * visits have been removed the URL is purged from history.
   */
  Stream<Map> get onVisitRemoved => _onVisitRemoved.stream;

  final ChromeStreamController<Map> _onVisitRemoved =
      new ChromeStreamController<Map>.oneArg(_history['onVisitRemoved'], mapify);
}

/**
 * An object encapsulating one result of a history query.
 */
class HistoryItem extends ChromeObject {
  HistoryItem({String id, String url, String title, var lastVisitTime, int visitCount, int typedCount}) {
    if (id != null) this.id = id;
    if (url != null) this.url = url;
    if (title != null) this.title = title;
    if (lastVisitTime != null) this.lastVisitTime = lastVisitTime;
    if (visitCount != null) this.visitCount = visitCount;
    if (typedCount != null) this.typedCount = typedCount;
  }

  HistoryItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The unique identifier for the item.
   */
  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  /**
   * The URL navigated to by a user.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  /**
   * The title of the page when it was last loaded.
   */
  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  /**
   * When this page was last loaded, represented in milliseconds since the
   * epoch.
   */
  dynamic get lastVisitTime => proxy['lastVisitTime'];
  set lastVisitTime(var value) => proxy['lastVisitTime'] = value;

  /**
   * The number of times the user has navigated to this page.
   */
  int get visitCount => proxy['visitCount'];
  set visitCount(int value) => proxy['visitCount'] = value;

  /**
   * The number of times the user has navigated to this page by typing in the
   * address.
   */
  int get typedCount => proxy['typedCount'];
  set typedCount(int value) => proxy['typedCount'] = value;
}

/**
 * An object encapsulating one visit to a URL.
 */
class VisitItem extends ChromeObject {
  VisitItem({String id, String visitId, var visitTime, String referringVisitId, String transition}) {
    if (id != null) this.id = id;
    if (visitId != null) this.visitId = visitId;
    if (visitTime != null) this.visitTime = visitTime;
    if (referringVisitId != null) this.referringVisitId = referringVisitId;
    if (transition != null) this.transition = transition;
  }

  VisitItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The unique identifier for the item.
   */
  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  /**
   * The unique identifier for this visit.
   */
  String get visitId => proxy['visitId'];
  set visitId(String value) => proxy['visitId'] = value;

  /**
   * When this visit occurred, represented in milliseconds since the epoch.
   */
  dynamic get visitTime => proxy['visitTime'];
  set visitTime(var value) => proxy['visitTime'] = value;

  /**
   * The visit ID of the referrer.
   */
  String get referringVisitId => proxy['referringVisitId'];
  set referringVisitId(String value) => proxy['referringVisitId'] = value;

  /**
   * The [transition type](#transition_types) for this visit from its referrer.
   * enum of `link`, `typed`, `auto_bookmark`, `auto_subframe`,
   * `manual_subframe`, `generated`, `auto_toplevel`, `form_submit`, `reload`,
   * `keyword`, `keyword_generated`
   */
  String get transition => proxy['transition'];
  set transition(String value) => proxy['transition'] = value;
}

HistoryItem _createHistoryItem(JsObject proxy) => proxy == null ? null : new HistoryItem.fromProxy(proxy);
VisitItem _createVisitItem(JsObject proxy) => proxy == null ? null : new VisitItem.fromProxy(proxy);
