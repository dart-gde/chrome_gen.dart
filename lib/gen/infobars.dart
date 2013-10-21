/* This file has been generated from infobars.json - do not edit */

/**
 * Use the `chrome.infobars` API to add a horizontal panel just above a tab's
 * contents. See the screenshot below.
 */
library chrome.infobars;

import 'windows.dart';
import '../src/common.dart';

/// Accessor for the `chrome.infobars` namespace.
final ChromeInfobars infobars = ChromeInfobars._infobars == null ? apiNotAvailable('chrome.infobars') : new ChromeInfobars._();

class ChromeInfobars {
  static final JsObject _infobars = chrome['infobars'];

  ChromeInfobars._();

  /**
   * Shows an infobar in the specified tab. The infobar will be closed
   * automatically when the tab navigates. Use window.close() to close the
   * infobar before then.
   * 
   * Returns:
   * Contains details about the window in which the infobar was created.
   */
  Future<Window> show(Map details) {
    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
    _infobars.callMethod('show', [new JsObject.jsify(details), completer.callback]);
    return completer.future;
  }
}

Window _createWindow(JsObject proxy) => proxy == null ? null : new Window.fromProxy(proxy);
