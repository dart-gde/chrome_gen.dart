/* This file has been generated from webstore.json - do not edit */

/**
 * Use the `chrome.webstore` API to initiate app and extension installations
 * "inline" from your site.
 */
library chrome.webstore;

import '../src/common.dart';

/// Accessor for the `chrome.webstore` namespace.
final ChromeWebstore webstore = new ChromeWebstore._();

class ChromeWebstore extends ChromeApi {
  static final JsObject _webstore = context['chrome']['webstore'];

  ChromeWebstore._();

  void install([String url, dynamic successCallback, dynamic failureCallback]) {
    _checkAvailability();

    _webstore.callMethod('install', [url, successCallback, failureCallback]);
  }

  bool get available => _webstore != null;

  void _checkAvailability() {
    if (_webstore == null) {
      throw new Exception('chrome.webstore API not available');
    }
  }
}
