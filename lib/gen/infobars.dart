/* This file has been generated from infobars.json - do not edit */

/**
 * Use the `chrome.infobars` API to add a horizontal panel just above a tab's
 * contents. See the screenshot below.
 */
library chrome.infobars;

import 'windows.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.infobars` namespace.
 */
final ChromeInfobars infobars = new ChromeInfobars._();

class ChromeInfobars extends ChromeApi {
  static final JsObject _infobars = chrome['infobars'];

  ChromeInfobars._();

  bool get available => _infobars != null;

  /**
   * Shows an infobar in the specified tab. The infobar will be closed
   * automatically when the tab navigates. Use window.close() to close the
   * infobar before then.
   * 
   * Returns:
   * Contains details about the window in which the infobar was created.
   */
  Future<Window> show(Map details) {
    if (_infobars == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
    _infobars.callMethod('show', [jsify(details), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.infobars' is not available");
  }
}

Window _createWindow(JsObject jsProxy) => jsProxy == null ? null : new Window.fromProxy(jsProxy);
