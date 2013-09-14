// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from browser_action.json - do not edit */

/**
 * Use browser actions to put icons in the main Google Chrome toolbar, to the
 * right of the address bar. In addition to its [icon](#icon), a browser action
 * can also have a [tooltip](#tooltip), a [badge](#badge), and a <a href =
 * '#popups'>popup</a>.
 */
library chrome.browser_action;

import '../src/common.dart';

/// Accessor for the `chrome.browser_action` namespace.
final ChromeBrowserAction browser_action = new ChromeBrowserAction._();

class ChromeBrowserAction {
  ChromeBrowserAction._();

  /**
   * Sets the title of the browser action. This shows up in the tooltip.
   */
  void setTitle(var details) {
    chrome['browser_action'].callMethod('setTitle', [details]);
  }

  /**
   * Gets the title of the browser action.
   */
  Future<String> getTitle(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['browser_action'].callMethod('getTitle', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the icon for the browser action. The icon can be specified either as
   * the path to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   */
  Future setIcon(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['browser_action'].callMethod('setIcon', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * browser action's icon.
   */
  void setPopup(var details) {
    chrome['browser_action'].callMethod('setPopup', [details]);
  }

  /**
   * Gets the html document set as the popup for this browser action.
   */
  Future<String> getPopup(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['browser_action'].callMethod('getPopup', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the badge text for the browser action. The badge is displayed on top
   * of the icon.
   */
  void setBadgeText(var details) {
    chrome['browser_action'].callMethod('setBadgeText', [details]);
  }

  /**
   * Gets the badge text of the browser action. If no tab is specified, the
   * non-tab-specific badge text is returned.
   */
  Future<String> getBadgeText(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['browser_action'].callMethod('getBadgeText', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the background color for the badge.
   */
  void setBadgeBackgroundColor(var details) {
    chrome['browser_action'].callMethod('setBadgeBackgroundColor', [details]);
  }

  /**
   * Gets the background color of the browser action.
   */
  Future<dynamic> getBadgeBackgroundColor(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['browser_action'].callMethod('getBadgeBackgroundColor', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Enables the browser action for a tab. By default, browser actions are
   * enabled.
   * 
   * [tabId] The id of the tab for which you want to modify the browser action.
   */
  void enable(int tabId) {
    chrome['browser_action'].callMethod('enable', [tabId]);
  }

  /**
   * Disables the browser action for a tab.
   * 
   * [tabId] The id of the tab for which you want to modify the browser action.
   */
  void disable(int tabId) {
    chrome['browser_action'].callMethod('disable', [tabId]);
  }

  final ChromeStreamController _onClicked = null;

  /**
   * Fired when a browser action icon is clicked.  This event will not fire if
   * the browser action has a popup.
   */
  Stream get onClicked => _onClicked.stream;
}
