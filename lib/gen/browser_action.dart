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
library chrome.browserAction;

import '../src/common.dart';

/// Accessor for the `chrome.browserAction` namespace.
final ChromeBrowserAction browserAction = new ChromeBrowserAction._();

class ChromeBrowserAction {
  JsObject _browserAction;

  ChromeBrowserAction._() {
    _browserAction = context['chrome']['browserAction'];
  }

  /**
   * Sets the title of the browser action. This shows up in the tooltip.
   */
  void setTitle(Map details) {
    _browserAction.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the browser action.
   */
  Future<String> getTitle(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _browserAction.callMethod('getTitle', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the icon for the browser action. The icon can be specified either as
   * the path to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   */
  Future setIcon(Map details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browserAction.callMethod('setIcon', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * browser action's icon.
   */
  void setPopup(Map details) {
    _browserAction.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this browser action.
   */
  Future<String> getPopup(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _browserAction.callMethod('getPopup', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the badge text for the browser action. The badge is displayed on top
   * of the icon.
   */
  void setBadgeText(Map details) {
    _browserAction.callMethod('setBadgeText', [jsify(details)]);
  }

  /**
   * Gets the badge text of the browser action. If no tab is specified, the
   * non-tab-specific badge text is returned.
   */
  Future<String> getBadgeText(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _browserAction.callMethod('getBadgeText', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the background color for the badge.
   */
  void setBadgeBackgroundColor(Map details) {
    _browserAction.callMethod('setBadgeBackgroundColor', [jsify(details)]);
  }

  /**
   * Gets the background color of the browser action.
   */
  Future<dynamic> getBadgeBackgroundColor(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _browserAction.callMethod('getBadgeBackgroundColor', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Enables the browser action for a tab. By default, browser actions are
   * enabled.
   * 
   * [tabId] The id of the tab for which you want to modify the browser action.
   */
  void enable([int tabId]) {
    _browserAction.callMethod('enable', [tabId]);
  }

  /**
   * Disables the browser action for a tab.
   * 
   * [tabId] The id of the tab for which you want to modify the browser action.
   */
  void disable([int tabId]) {
    _browserAction.callMethod('disable', [tabId]);
  }

  /**
   * Fired when a browser action icon is clicked.  This event will not fire if
   * the browser action has a popup.
   */
  Stream<dynamic> get onClicked => _onClicked.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onClicked = null;
}

class ColorArray extends ChromeObject {
  ColorArray(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Pixel data for an image. Must be an ImageData object (for example, from a
 * `canvas` element).
 */
class ImageDataType extends ChromeObject {
  ImageDataType(JsObject proxy): super(proxy);
  // TODO:
}
