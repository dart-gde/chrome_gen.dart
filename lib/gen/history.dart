/* This file has been generated from history.json - do not edit */

/**
 * Use the `chrome.history` API to interact with the browser's record of visited
 * pages. You can add, remove, and query for URLs in the browser's history. To
 * override the history page with your own version, see [Override
 * Pages](override.html).
 */
library chrome.history;

import '../src/common.dart';

/**
 * Accessor for the `chrome.history` namespace.
 */
final ChromeHistory history = new ChromeHistory._();

class ChromeHistory extends ChromeApi {
  static final JsObject _history = chrome['history'];

  ChromeHistory._();

  bool get available => _history != null;

  /**
   * Searches the history for the last visit time of each page matching the
   * query.
   */
  Future<List<HistoryItem>> search(Map query) {
    if (_history == null) _throwNotAvailable();

    var completer = new ChromeCompleter<List<HistoryItem>>.oneArg((e) => listify(e, _createHistoryItem));
    _history.callMethod('search', [jsify(query), completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about visits to a URL.
   */
  Future<List<VisitItem>> getVisits(Map details) {
    if (_history == null) _throwNotAvailable();

    var completer = new ChromeCompleter<List<VisitItem>>.oneArg((e) => listify(e, _createVisitItem));
    _history.callMethod('getVisits', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Adds a URL to the history at the current time with a [transition
   * type](#transition_types) of "link".
   */
  Future addUrl(Map details) {
    if (_history == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _history.callMethod('addUrl', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Removes all occurrences of the given URL from the history.
   */
  Future deleteUrl(Map details) {
    if (_history == null) _throwNotAvailable();

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
    if (_history == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteRange', [jsify(range), completer.callback]);
    return completer.future;
  }

  /**
   * Deletes all items from the history.
   */
  Future deleteAll() {
    if (_history == null) _throwNotAvailable();

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
      new ChromeStreamController<HistoryItem>.oneArg(_history, 'onVisited', _createHistoryItem);

  /**
   * Fired when one or more URLs are removed from the history service.  When all
   * visits have been removed the URL is purged from history.
   */
  Stream<Map> get onVisitRemoved => _onVisitRemoved.stream;

  final ChromeStreamController<Map> _onVisitRemoved =
      new ChromeStreamController<Map>.oneArg(_history, 'onVisitRemoved', mapify);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.history' is not available");
  }
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
  HistoryItem.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The unique identifier for the item.
   */
  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  /**
   * The URL navigated to by a user.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * The title of the page when it was last loaded.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * When this page was last loaded, represented in milliseconds since the
   * epoch.
   */
  dynamic get lastVisitTime => jsProxy['lastVisitTime'];
  set lastVisitTime(var value) => jsProxy['lastVisitTime'] = jsify(value);

  /**
   * The number of times the user has navigated to this page.
   */
  int get visitCount => jsProxy['visitCount'];
  set visitCount(int value) => jsProxy['visitCount'] = value;

  /**
   * The number of times the user has navigated to this page by typing in the
   * address.
   */
  int get typedCount => jsProxy['typedCount'];
  set typedCount(int value) => jsProxy['typedCount'] = value;
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
  VisitItem.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The unique identifier for the item.
   */
  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  /**
   * The unique identifier for this visit.
   */
  String get visitId => jsProxy['visitId'];
  set visitId(String value) => jsProxy['visitId'] = value;

  /**
   * When this visit occurred, represented in milliseconds since the epoch.
   */
  dynamic get visitTime => jsProxy['visitTime'];
  set visitTime(var value) => jsProxy['visitTime'] = jsify(value);

  /**
   * The visit ID of the referrer.
   */
  String get referringVisitId => jsProxy['referringVisitId'];
  set referringVisitId(String value) => jsProxy['referringVisitId'] = value;

  /**
   * The [transition type](#transition_types) for this visit from its referrer.
   * enum of `link`, `typed`, `auto_bookmark`, `auto_subframe`,
   * `manual_subframe`, `generated`, `auto_toplevel`, `form_submit`, `reload`,
   * `keyword`, `keyword_generated`
   */
  String get transition => jsProxy['transition'];
  set transition(String value) => jsProxy['transition'] = value;
}

HistoryItem _createHistoryItem(JsObject jsProxy) => jsProxy == null ? null : new HistoryItem.fromProxy(jsProxy);
VisitItem _createVisitItem(JsObject jsProxy) => jsProxy == null ? null : new VisitItem.fromProxy(jsProxy);
