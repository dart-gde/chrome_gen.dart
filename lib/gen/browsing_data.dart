// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from browsing_data.json - do not edit */

/**
 * Use the `chrome.browsingData` API to remove browsing data from a user's local
 * profile.
 */
library chrome.browsingData;

import '../src/common.dart';

/// Accessor for the `chrome.browsingData` namespace.
final ChromeBrowsingData browsingData = new ChromeBrowsingData._();

class ChromeBrowsingData {
  JsObject _browsingData;

  ChromeBrowsingData._() {
    _browsingData = context['chrome']['browsingData'];
  }

  /**
   * Reports which types of data are currently selected in the 'Clear browsing
   * data' settings UI.  Note: some of the data types included in this API are
   * not available in the settings UI, and some UI settings control more than
   * one data type listed here.
   */
  Future<Map> settings() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(mapify);
    _browsingData.callMethod('settings', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears various types of browsing data stored in a user's profile.
   * 
   * [dataToRemove] The set of data types to remove.
   */
  Future remove(RemovalOptions options, DataTypeSet dataToRemove) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('remove', [options, dataToRemove, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' appcache data.
   */
  Future removeAppcache(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeAppcache', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cache.
   */
  Future removeCache(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeCache', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cookies and server-bound certificates modified within
   * a particular timeframe.
   */
  Future removeCookies(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeCookies', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's list of downloaded files (_not_ the downloaded files
   * themselves).
   */
  Future removeDownloads(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeDownloads', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' file system data.
   */
  Future removeFileSystems(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeFileSystems', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored form data (autofill).
   */
  Future removeFormData(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeFormData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's history.
   */
  Future removeHistory(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeHistory', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' IndexedDB data.
   */
  Future removeIndexedDB(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeIndexedDB', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' local storage data.
   */
  Future removeLocalStorage(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeLocalStorage', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears plugins' data.
   */
  Future removePluginData(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removePluginData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored passwords.
   */
  Future removePasswords(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removePasswords', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' WebSQL data.
   */
  Future removeWebSQL(RemovalOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeWebSQL', [options, completer.callback]);
    return completer.future;
  }
}

/**
 * Options that determine exactly what data will be removed.
 */
class RemovalOptions extends ChromeObject {
  static RemovalOptions create(JsObject proxy) => new RemovalOptions(proxy);

  RemovalOptions(JsObject proxy): super(proxy);

  /**
   * Remove data accumulated on or after this date, represented in milliseconds
   * since the epoch (accessible via the `getTime` method of the JavaScript
   * `Date` object). If absent, defaults to 0 (which would remove all browsing
   * data).
   */
  dynamic get since => this.proxy['since'];

  /**
   * An object whose properties specify which origin types ought to be cleared.
   * If this object isn't specified, it defaults to clearing only "unprotected"
   * origins. Please ensure that you _really_ want to remove application data
   * before adding 'protectedWeb' or 'extensions'.
   */
  Map get originTypes => mapify(this.proxy['originTypes']);
}

/**
 * A set of data types. Missing data types are interpreted as `false`.
 */
class DataTypeSet extends ChromeObject {
  static DataTypeSet create(JsObject proxy) => new DataTypeSet(proxy);

  DataTypeSet(JsObject proxy): super(proxy);

  /**
   * Websites' appcaches.
   */
  bool get appcache => this.proxy['appcache'];

  /**
   * The browser's cache. Note: when removing data, this clears the _entire_
   * cache: it is not limited to the range you specify.
   */
  bool get cache => this.proxy['cache'];

  /**
   * The browser's cookies.
   */
  bool get cookies => this.proxy['cookies'];

  /**
   * The browser's download list.
   */
  bool get downloads => this.proxy['downloads'];

  /**
   * Websites' file systems.
   */
  bool get fileSystems => this.proxy['fileSystems'];

  /**
   * The browser's stored form data.
   */
  bool get formData => this.proxy['formData'];

  /**
   * The browser's history.
   */
  bool get history => this.proxy['history'];

  /**
   * Websites' IndexedDB data.
   */
  bool get indexedDB => this.proxy['indexedDB'];

  /**
   * Websites' local storage data.
   */
  bool get localStorage => this.proxy['localStorage'];

  /**
   * Server-bound certificates.
   */
  bool get serverBoundCertificates => this.proxy['serverBoundCertificates'];

  /**
   * Plugins' data.
   */
  bool get pluginData => this.proxy['pluginData'];

  /**
   * Stored passwords.
   */
  bool get passwords => this.proxy['passwords'];

  /**
   * Websites' WebSQL data.
   */
  bool get webSQL => this.proxy['webSQL'];
}
