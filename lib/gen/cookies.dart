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
  JsObject _cookies;

  ChromeCookies._() {
    _cookies = context['chrome']['cookies'];
  }

  /**
   * Retrieves information about a single cookie. If more than one cookie of the
   * same name exists for the given URL, the one with the longest path will be
   * returned. For cookies with the same path length, the cookie with the
   * earliest creation time will be returned.
   * 
   * [details] Details to identify the cookie being retrieved.
   * 
   * Returns:
   * Contains details about the cookie. This parameter is null if no such cookie
   * was found.
   */
  Future<dynamic> get(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _cookies.callMethod('get', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves all cookies from a single cookie store that match the given
   * information.  The cookies returned will be sorted, with those with the
   * longest path first.  If multiple cookies have the same path length, those
   * with the earliest creation time will be first.
   * 
   * [details] Information to filter the cookies being retrieved.
   * 
   * Returns:
   * All the existing, unexpired cookies that match the given cookie info.
   */
  Future<List<dynamic>> getAll(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _cookies.callMethod('getAll', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets a cookie with the given cookie data; may overwrite equivalent cookies
   * if they exist.
   * 
   * [details] Details about the cookie being set.
   * 
   * Returns:
   * Contains details about the cookie that's been set.  If setting failed for
   * any reason, this will be "null", and "chrome.runtime.lastError" will be
   * set.
   */
  Future<dynamic> set(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _cookies.callMethod('set', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Deletes a cookie by name.
   * 
   * [details] Information to identify the cookie to remove.
   * 
   * Returns:
   * Contains details about the cookie that's been removed.  If removal failed
   * for any reason, this will be "null", and "chrome.runtime.lastError" will be
   * set.
   */
  Future<Map> remove(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _cookies.callMethod('remove', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Lists all existing cookie stores.
   * 
   * Returns:
   * All the existing cookie stores.
   */
  Future<List<dynamic>> getAllCookieStores() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _cookies.callMethod('getAllCookieStores', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a cookie is set or removed. As a special case, note that
   * updating a cookie's properties is implemented as a two step process: the
   * cookie to be updated is first removed entirely, generating a notification
   * with "cause" of "overwrite" .  Afterwards, a new cookie is written with the
   * updated values, generating a second notification with "cause" "explicit".
   */
  Stream<dynamic> get onChanged => _onChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onChanged = null;
}

/**
 * Represents information about an HTTP cookie.
 */
class Cookie extends ChromeObject {
  Cookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Represents a cookie store in the browser. An incognito mode window, for
 * instance, uses a separate cookie store from a non-incognito window.
 */
class CookieStore extends ChromeObject {
  CookieStore(JsObject proxy): super(proxy);
  // TODO:
}
