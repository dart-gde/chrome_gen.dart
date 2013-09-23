/* This file has been generated from page_action.json - do not edit */

/**
 * Use the `chrome.pageAction` API to put icons inside the address bar. Page
 * actions represent actions that can be taken on the current page, but that
 * aren't applicable to all pages.
 */
library chrome.pageAction;

import 'tabs.dart';
import '../src/common.dart';

/// Accessor for the `chrome.pageAction` namespace.
final ChromePageAction pageAction = new ChromePageAction._();

class ChromePageAction {
  static final JsObject _pageAction = context['chrome']['pageAction'];

  ChromePageAction._();

  /**
   * Shows the page action. The page action is shown whenever the tab is
   * selected.
   * 
   * [tabId] The id of the tab for which you want to modify the page action.
   */
  void show(int tabId) {
    _pageAction.callMethod('show', [tabId]);
  }

  /**
   * Hides the page action.
   * 
   * [tabId] The id of the tab for which you want to modify the page action.
   */
  void hide(int tabId) {
    _pageAction.callMethod('hide', [tabId]);
  }

  /**
   * Sets the title of the page action. This is displayed in a tooltip over the
   * page action.
   * 
   * [details] `tabId` The id of the tab for which you want to modify the page
   * action.
   * 
   * `title` The tooltip string.
   */
  void setTitle(Map details) {
    _pageAction.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the page action.
   * 
   * [details] `tabId` Specify the tab to get the title from.
   */
  Future<String> getTitle(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _pageAction.callMethod('getTitle', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the icon for the page action. The icon can be specified either as the
   * path to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   * 
   * [details] `tabId` The id of the tab for which you want to modify the page
   * action.
   * 
   * `imageData` Either an ImageData object or a dictionary {size -> ImageData}
   * representing icon to be set. If the icon is specified as a dictionary, the
   * actual image to be used is chosen depending on screen's pixel density. If
   * the number of image pixels that fit into one screen space unit equals
   * `scale`, then image with size `scale` * 19 will be selected. Initially only
   * scales 1 and 2 will be supported. At least one image must be specified.
   * Note that 'details.imageData = foo' is equivalent to 'details.imageData =
   * {'19': foo}'
   * 
   * `path` Either a relative image path or a dictionary {size -> relative image
   * path} pointing to icon to be set. If the icon is specified as a dictionary,
   * the actual image to be used is chosen depending on screen's pixel density.
   * If the number of image pixels that fit into one screen space unit equals
   * `scale`, then image with size `scale` * 19 will be selected. Initially only
   * scales 1 and 2 will be supported. At least one image must be specified.
   * Note that 'details.path = foo' is equivalent to 'details.imageData = {'19':
   * foo}'
   * 
   * `iconIndex` <b>Deprecated.</b> This argument is ignored.
   */
  Future setIcon(Map details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _pageAction.callMethod('setIcon', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * page action's icon.
   * 
   * [details] `tabId` The id of the tab for which you want to modify the page
   * action.
   * 
   * `popup` The html file to show in a popup.  If set to the empty string (''),
   * no popup is shown.
   */
  void setPopup(Map details) {
    _pageAction.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this page action.
   * 
   * [details] `tabId` Specify the tab to get the popup from.
   */
  Future<String> getPopup(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _pageAction.callMethod('getPopup', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a page action icon is clicked.  This event will not fire if the
   * page action has a popup.
   */
  Stream<Tab> get onClicked => _onClicked.stream;

  final ChromeStreamController<Tab> _onClicked =
      new ChromeStreamController<Tab>.oneArg(_pageAction['onClicked'], Tab.create);
}
