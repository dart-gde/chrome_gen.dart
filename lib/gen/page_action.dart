// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from page_action.json - do not edit */

/**
 * Use the `chrome.pageAction` API to put icons inside the address bar. Page
 * actions represent actions that can be taken on the current page, but that
 * aren't applicable to all pages.
 */
library chrome.pageAction;

import '../src/common.dart';

/// Accessor for the `chrome.pageAction` namespace.
final ChromePageAction pageAction = new ChromePageAction._();

class ChromePageAction {
  ChromePageAction._();

  /**
   * Shows the page action. The page action is shown whenever the tab is
   * selected.
   * 
   * [tabId] The id of the tab for which you want to modify the page action.
   */
  void show(int tabId) {
    chrome['pageAction'].callMethod('show', [tabId]);
  }

  /**
   * Hides the page action.
   * 
   * [tabId] The id of the tab for which you want to modify the page action.
   */
  void hide(int tabId) {
    chrome['pageAction'].callMethod('hide', [tabId]);
  }

  /**
   * Sets the title of the page action. This is displayed in a tooltip over the
   * page action.
   */
  void setTitle(var details) {
    chrome['pageAction'].callMethod('setTitle', [details]);
  }

  /**
   * Gets the title of the page action.
   */
  Future<String> getTitle(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['pageAction'].callMethod('getTitle', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the icon for the page action. The icon can be specified either as the
   * path to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   */
  Future setIcon(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['pageAction'].callMethod('setIcon', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * page action's icon.
   */
  void setPopup(var details) {
    chrome['pageAction'].callMethod('setPopup', [details]);
  }

  /**
   * Gets the html document set as the popup for this page action.
   */
  Future<String> getPopup(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['pageAction'].callMethod('getPopup', [details, completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onClicked = null;

  /**
   * Fired when a page action icon is clicked.  This event will not fire if the
   * page action has a popup.
   */
  Stream get onClicked => _onClicked.stream;
}
