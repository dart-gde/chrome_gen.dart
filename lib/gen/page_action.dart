/* This file has been generated from page_action.json - do not edit */

/**
 * Use the `chrome.pageAction` API to put icons inside the address bar. Page
 * actions represent actions that can be taken on the current page, but that
 * aren't applicable to all pages.
 */
library chrome.pageAction;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.pageAction` namespace.
 */
final ChromePageAction pageAction = new ChromePageAction._();

class ChromePageAction extends ChromeApi {
  static final JsObject _pageAction = chrome['pageAction'];

  ChromePageAction._();

  bool get available => _pageAction != null;

  /**
   * Shows the page action. The page action is shown whenever the tab is
   * selected.
   * 
   * [tabId] The id of the tab for which you want to modify the page action.
   */
  void show(int tabId) {
    if (_pageAction == null) _throwNotAvailable();

    _pageAction.callMethod('show', [tabId]);
  }

  /**
   * Hides the page action.
   * 
   * [tabId] The id of the tab for which you want to modify the page action.
   */
  void hide(int tabId) {
    if (_pageAction == null) _throwNotAvailable();

    _pageAction.callMethod('hide', [tabId]);
  }

  /**
   * Sets the title of the page action. This is displayed in a tooltip over the
   * page action.
   */
  void setTitle(Map details) {
    if (_pageAction == null) _throwNotAvailable();

    _pageAction.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the page action.
   */
  Future<String> getTitle(Map details) {
    if (_pageAction == null) _throwNotAvailable();

    var completer = new ChromeCompleter<String>.oneArg();
    _pageAction.callMethod('getTitle', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the icon for the page action. The icon can be specified either as the
   * path to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   */
  Future setIcon(Map details) {
    if (_pageAction == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _pageAction.callMethod('setIcon', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * page action's icon.
   */
  void setPopup(Map details) {
    if (_pageAction == null) _throwNotAvailable();

    _pageAction.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this page action.
   */
  Future<String> getPopup(Map details) {
    if (_pageAction == null) _throwNotAvailable();

    var completer = new ChromeCompleter<String>.oneArg();
    _pageAction.callMethod('getPopup', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a page action icon is clicked.  This event will not fire if the
   * page action has a popup.
   */
  Stream<Tab> get onClicked => _onClicked.stream;

  final ChromeStreamController<Tab> _onClicked =
      new ChromeStreamController<Tab>.oneArg(_pageAction, 'onClicked', _createTab);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.pageAction' is not available");
  }
}

Tab _createTab(JsObject jsProxy) => jsProxy == null ? null : new Tab.fromProxy(jsProxy);
