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
  static final JsObject _cookies = context['chrome']['cookies'];

  ChromeCookies._();

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
  Future<Cookie> get(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Cookie.create);
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
  Future<List<Cookie>> getAll(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Cookie.create));
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
  Future<Cookie> set(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Cookie.create);
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
    ChromeCompleter completer = new ChromeCompleter.oneArg(mapify);
    _cookies.callMethod('remove', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Lists all existing cookie stores.
   * 
   * Returns:
   * All the existing cookie stores.
   */
  Future<List<CookieStore>> getAllCookieStores() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, CookieStore.create));
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
  Stream<Map> get onChanged => _onChanged.stream;

  final ChromeStreamController<Map> _onChanged =
      new ChromeStreamController<Map>.oneArg(_cookies['onChanged'], mapify);
}

/**
 * Represents information about an HTTP cookie.
 */
class Cookie extends ChromeObject {
  static Cookie create(JsObject proxy) => proxy == null ? null : new Cookie(proxy);

  Cookie(JsObject proxy): super(proxy);

  /**
   * The name of the cookie.
   */
  String get name => proxy['name'];

  /**
   * The value of the cookie.
   */
  String get value => proxy['value'];

  /**
   * The domain of the cookie (e.g. "www.google.com", "example.com").
   */
  String get domain => proxy['domain'];

  /**
   * True if the cookie is a host-only cookie (i.e. a request's host must
   * exactly match the domain of the cookie).
   */
  bool get hostOnly => proxy['hostOnly'];

  /**
   * The path of the cookie.
   */
  String get path => proxy['path'];

  /**
   * True if the cookie is marked as Secure (i.e. its scope is limited to secure
   * channels, typically HTTPS).
   */
  bool get secure => proxy['secure'];

  /**
   * True if the cookie is marked as HttpOnly (i.e. the cookie is inaccessible
   * to client-side scripts).
   */
  bool get httpOnly => proxy['httpOnly'];

  /**
   * True if the cookie is a session cookie, as opposed to a persistent cookie
   * with an expiration date.
   */
  bool get session => proxy['session'];

  /**
   * The expiration date of the cookie as the number of seconds since the UNIX
   * epoch. Not provided for session cookies.
   */
  dynamic get expirationDate => proxy['expirationDate'];

  /**
   * The ID of the cookie store containing this cookie, as provided in
   * getAllCookieStores().
   */
  String get storeId => proxy['storeId'];
}

/**
 * Represents a cookie store in the browser. An incognito mode window, for
 * instance, uses a separate cookie store from a non-incognito window.
 */
class CookieStore extends ChromeObject {
  static CookieStore create(JsObject proxy) => proxy == null ? null : new CookieStore(proxy);

  CookieStore(JsObject proxy): super(proxy);

  /**
   * The unique identifier for the cookie store.
   */
  String get id => proxy['id'];

  /**
   * Identifiers of all the browser tabs that share this cookie store.
   */
  List<int> get tabIds => listify(proxy['tabIds']);
}
