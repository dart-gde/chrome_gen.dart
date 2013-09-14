// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from cookies.json - do not edit */

/**
 * Use the `chrome.cookies` API to query and modify cookies, and to be notified
 * when they change.
 */
library chrome.cookies;

import '../src/common.dart';

/// Accessor for the `chrome.cookies` namespace.
final ChromeCookies cookies = new ChromeCookies._();

class ChromeCookies {
  ChromeCookies._();

  /**
   * Retrieves information about a single cookie. If more than one cookie of the
   * same name exists for the given URL, the one with the longest path will be
   * returned. For cookies with the same path length, the cookie with the
   * earliest creation time will be returned.
   * 
   * [details] Details to identify the cookie being retrieved.
   */
  Future<dynamic> get(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['cookies'].callMethod('get', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves all cookies from a single cookie store that match the given
   * information.  The cookies returned will be sorted, with those with the
   * longest path first.  If multiple cookies have the same path length, those
   * with the earliest creation time will be first.
   * 
   * [details] Information to filter the cookies being retrieved.
   */
  Future<dynamic> getAll(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['cookies'].callMethod('getAll', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets a cookie with the given cookie data; may overwrite equivalent cookies
   * if they exist.
   * 
   * [details] Details about the cookie being set.
   */
  Future<dynamic> set(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['cookies'].callMethod('set', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Deletes a cookie by name.
   * 
   * [details] Information to identify the cookie to remove.
   */
  Future<dynamic> remove(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['cookies'].callMethod('remove', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Lists all existing cookie stores.
   */
  Future<dynamic> getAllCookieStores() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['cookies'].callMethod('getAllCookieStores', [completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onChanged = null;

  /**
   * Fired when a cookie is set or removed. As a special case, note that
   * updating a cookie's properties is implemented as a two step process: the
   * cookie to be updated is first removed entirely, generating a notification
   * with "cause" of "overwrite" .  Afterwards, a new cookie is written with the
   * updated values, generating a second notification with "cause" "explicit".
   */
  Stream get onChanged => _onChanged.stream;
}
