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
final ChromeHistory history = new ChromeHistory._();

class ChromeHistory {
  static final JsObject _history = context['chrome']['history'];

  ChromeHistory._();

  /**
   * Searches the history for the last visit time of each page matching the
   * query.
   */
  Future<List<HistoryItem>> search(Map query) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, HistoryItem.create));
    _history.callMethod('search', [jsify(query), completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about visits to a URL.
   */
  Future<List<VisitItem>> getVisits(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, VisitItem.create));
    _history.callMethod('getVisits', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Adds a URL to the history at the current time with a [transition
   * type](#transition_types) of "link".
   */
  Future addUrl(Map details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _history.callMethod('addUrl', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Removes all occurrences of the given URL from the history.
   */
  Future deleteUrl(Map details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteUrl', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Removes all items within the specified date range from the history.  Pages
   * will not be removed from the history unless all visits fall within the
   * range.
   */
  Future deleteRange(Map range) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteRange', [jsify(range), completer.callback]);
    return completer.future;
  }

  /**
   * Deletes all items from the history.
   */
  Future deleteAll() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _history.callMethod('deleteAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a URL is visited, providing the HistoryItem data for that URL.
   * This event fires before the page has loaded.
   */
  Stream<HistoryItem> get onVisited => _onVisited.stream;

  final ChromeStreamController<HistoryItem> _onVisited =
      new ChromeStreamController<HistoryItem>.oneArg(_history['onVisited'], HistoryItem.create);

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
  static HistoryItem create(JsObject proxy) => proxy == null ? null : new HistoryItem(proxy);

  HistoryItem(JsObject proxy): super(proxy);

  /**
   * The unique identifier for the item.
   */
  String get id => proxy['id'];

  /**
   * The URL navigated to by a user.
   */
  String get url => proxy['url'];

  /**
   * The title of the page when it was last loaded.
   */
  String get title => proxy['title'];

  /**
   * When this page was last loaded, represented in milliseconds since the
   * epoch.
   */
  dynamic get lastVisitTime => proxy['lastVisitTime'];

  /**
   * The number of times the user has navigated to this page.
   */
  int get visitCount => proxy['visitCount'];

  /**
   * The number of times the user has navigated to this page by typing in the
   * address.
   */
  int get typedCount => proxy['typedCount'];
}

/**
 * An object encapsulating one visit to a URL.
 */
class VisitItem extends ChromeObject {
  static VisitItem create(JsObject proxy) => proxy == null ? null : new VisitItem(proxy);

  VisitItem(JsObject proxy): super(proxy);

  /**
   * The unique identifier for the item.
   */
  String get id => proxy['id'];

  /**
   * The unique identifier for this visit.
   */
  String get visitId => proxy['visitId'];

  /**
   * When this visit occurred, represented in milliseconds since the epoch.
   */
  dynamic get visitTime => proxy['visitTime'];

  /**
   * The visit ID of the referrer.
   */
  String get referringVisitId => proxy['referringVisitId'];

  /**
   * The [transition type](#transition_types) for this visit from its referrer.
   */
  String get transition => proxy['transition'];
}
