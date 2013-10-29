/* This file has been generated from webstore.json - do not edit */

/**
 * Use the `chrome.webstore` API to initiate app and extension installations
 * "inline" from your site.
 */
library chrome.webstore;

import '../src/common.dart';

/**
 * Accessor for the `chrome.webstore` namespace.
 */
final ChromeWebstore webstore = new ChromeWebstore._();

class ChromeWebstore extends ChromeApi {
  static final JsObject _webstore = chrome['webstore'];

  ChromeWebstore._();

  bool get available => _webstore != null;

  void install([String url, dynamic successCallback, dynamic failureCallback]) {
    if (_webstore == null) throw new UnsupportedError("'chrome.webstore' is not available");

    _webstore.callMethod('install', [url, jsify(successCallback), jsify(failureCallback)]);
  }
}
