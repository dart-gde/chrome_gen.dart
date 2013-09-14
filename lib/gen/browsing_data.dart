// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from browsing_data.json - do not edit */

/**
 * Use the `chrome.browsingData` API to remove browsing data from a user's local
 * profile.
 */
library chrome.browsing_data;

import '../src/common.dart';

/// Accessor for the `chrome.browsing_data` namespace.
final ChromeBrowsingData browsing_data = new ChromeBrowsingData._();

class ChromeBrowsingData {
  ChromeBrowsingData._();

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
    chrome['browsing_data'].callMethod('settings', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears various types of browsing data stored in a user's profile.
   * 
   * [dataToRemove] The set of data types to remove.
   * 
   * [callback] Called when deletion has completed.
   */
  Future remove(var options, var dataToRemove) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('remove', [options, dataToRemove, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' appcache data.
   * 
   * [callback] Called when websites' appcache data has been cleared.
   */
  Future removeAppcache(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeAppcache', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cache.
   * 
   * [callback] Called when the browser's cache has been cleared.
   */
  Future removeCache(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeCache', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cookies and server-bound certificates modified within
   * a particular timeframe.
   * 
   * [callback] Called when the browser's cookies and server-bound certificates
   * have been cleared.
   */
  Future removeCookies(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeCookies', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's list of downloaded files (_not_ the downloaded files
   * themselves).
   * 
   * [callback] Called when the browser's list of downloaded files has been
   * cleared.
   */
  Future removeDownloads(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeDownloads', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' file system data.
   * 
   * [callback] Called when websites' file systems have been cleared.
   */
  Future removeFileSystems(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeFileSystems', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored form data (autofill).
   * 
   * [callback] Called when the browser's form data has been cleared.
   */
  Future removeFormData(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeFormData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's history.
   * 
   * [callback] Called when the browser's history has cleared.
   */
  Future removeHistory(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeHistory', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' IndexedDB data.
   * 
   * [callback] Called when websites' IndexedDB data has been cleared.
   */
  Future removeIndexedDB(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeIndexedDB', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' local storage data.
   * 
   * [callback] Called when websites' local storage has been cleared.
   */
  Future removeLocalStorage(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeLocalStorage', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears plugins' data.
   * 
   * [callback] Called when plugins' data has been cleared.
   */
  Future removePluginData(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removePluginData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored passwords.
   * 
   * [callback] Called when the browser's passwords have been cleared.
   */
  Future removePasswords(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removePasswords', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' WebSQL data.
   * 
   * [callback] Called when websites' WebSQL databases have been cleared.
   */
  Future removeWebSQL(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browsing_data'].callMethod('removeWebSQL', [options, completer.callback]);
    return completer.future;
  }
}
