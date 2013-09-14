// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
  ChromeHistory._();

  /**
   * Searches the history for the last visit time of each page matching the
   * query.
   */
  Future<dynamic> search(var query) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['history'].callMethod('search', [query, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about visits to a URL.
   */
  Future<dynamic> getVisits(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['history'].callMethod('getVisits', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Adds a URL to the history at the current time with a [transition
   * type](#transition_types) of "link".
   */
  Future addUrl(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['history'].callMethod('addUrl', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Removes all occurrences of the given URL from the history.
   */
  Future deleteUrl(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['history'].callMethod('deleteUrl', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Removes all items within the specified date range from the history.  Pages
   * will not be removed from the history unless all visits fall within the
   * range.
   */
  Future deleteRange(var range) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['history'].callMethod('deleteRange', [range, completer.callback]);
    return completer.future;
  }

  /**
   * Deletes all items from the history.
   */
  Future deleteAll() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['history'].callMethod('deleteAll', [completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onVisited = null;

  /**
   * Fired when a URL is visited, providing the HistoryItem data for that URL.
   * This event fires before the page has loaded.
   */
  Stream get onVisited => _onVisited.stream;

  final ChromeStreamController _onVisitRemoved = null;

  /**
   * Fired when one or more URLs are removed from the history service.  When all
   * visits have been removed the URL is purged from history.
   */
  Stream get onVisitRemoved => _onVisitRemoved.stream;
}
