/* This file has been generated from infobars.json - do not edit */

/**
 * Use the `chrome.infobars` API to add a horizontal panel just above a tab's
 * contents. See the screenshot below.
 */
library chrome.infobars;

import 'windows.dart';
import '../src/common.dart';

/// Accessor for the `chrome.infobars` namespace.
final ChromeInfobars infobars = new ChromeInfobars._();

class ChromeInfobars {
  static final JsObject _infobars = context['chrome']['infobars'];

  ChromeInfobars._();

  /**
   * Shows an infobar in the specified tab. The infobar will be closed
   * automatically when the tab navigates. Use window.close() to close the
   * infobar before then.
   * 
   * [details] `tabId` The tab id for the tab to display the infobar in.
   * 
   * `path` The html file that contains the infobar.
   * 
   * `height` The height (in pixels) of the infobar to show. If omitted, the
   * default infobar height will be used.
   * 
   * Returns:
   * Contains details about the window in which the infobar was created.
   */
  Future<Window> show(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _infobars.callMethod('show', [jsify(details), completer.callback]);
    return completer.future;
  }
}
