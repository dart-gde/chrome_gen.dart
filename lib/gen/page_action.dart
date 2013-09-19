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
  JsObject _pageAction;

  ChromePageAction._() {
    _pageAction = context['chrome']['pageAction'];
  }

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
   */
  void setTitle(Map details) {
    _pageAction.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the page action.
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
   */
  Future setIcon(Map details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _pageAction.callMethod('setIcon', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * page action's icon.
   */
  void setPopup(Map details) {
    _pageAction.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this page action.
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
  Stream<dynamic> get onClicked => _onClicked.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onClicked = null;
}
