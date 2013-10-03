/* This file has been generated from page_capture.json - do not edit */

/**
 * Use the `chrome.pageCapture` API to save a tab as MHTML.
 */
library chrome.pageCapture;

import '../src/common.dart';

/// Accessor for the `chrome.pageCapture` namespace.
final ChromePageCapture pageCapture = ChromePageCapture._pageCapture == null ? apiNotAvailable('chrome.pageCapture') : new ChromePageCapture._();

class ChromePageCapture {
  static final JsObject _pageCapture = context['chrome']['pageCapture'];

  ChromePageCapture._();

  /**
   * Saves the content of the tab with given id as MHTML.
   * 
   * Returns:
   * The MHTML data as a Blob.
   */
  Future<dynamic> saveAsMHTML(Map details) {
    var completer = new ChromeCompleter<dynamic>.oneArg();
    _pageCapture.callMethod('saveAsMHTML', [jsify(details), completer.callback]);
    return completer.future;
  }
}
