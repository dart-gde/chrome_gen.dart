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
  Future<dynamic> settings() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _browsingData.callMethod('settings', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears various types of browsing data stored in a user's profile.
   * 
   * [dataToRemove] The set of data types to remove.
   */
  Future remove(var options, var dataToRemove) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('remove', [options, dataToRemove, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' appcache data.
   */
  Future removeAppcache(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeAppcache', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cache.
   */
  Future removeCache(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeCache', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cookies and server-bound certificates modified within
   * a particular timeframe.
   */
  Future removeCookies(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeCookies', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's list of downloaded files (_not_ the downloaded files
   * themselves).
   */
  Future removeDownloads(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeDownloads', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' file system data.
   */
  Future removeFileSystems(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeFileSystems', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored form data (autofill).
   */
  Future removeFormData(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeFormData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's history.
   */
  Future removeHistory(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeHistory', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' IndexedDB data.
   */
  Future removeIndexedDB(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeIndexedDB', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' local storage data.
   */
  Future removeLocalStorage(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeLocalStorage', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears plugins' data.
   */
  Future removePluginData(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removePluginData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored passwords.
   */
  Future removePasswords(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removePasswords', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' WebSQL data.
   */
  Future removeWebSQL(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeWebSQL', [options, completer.callback]);
    return completer.future;
  }
}

/**
 * Options that determine exactly what data will be removed.
 */
class RemovalOptions extends ChromeObject {
  RemovalOptions(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A set of data types. Missing data types are interpreted as `false`.
 */
class DataTypeSet extends ChromeObject {
  DataTypeSet(JsObject proxy): super(proxy);
  // TODO:
}
