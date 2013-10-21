/* This file has been generated from browser_action.json - do not edit */

/**
 * Use browser actions to put icons in the main Google Chrome toolbar, to the
 * right of the address bar. In addition to its [icon](#icon), a browser action
 * can also have a [tooltip](#tooltip), a [badge](#badge), and a <a href =
 * '#popups'>popup</a>.
 */
library chrome.browserAction;

import 'tabs.dart';
import '../src/common.dart';

/// Accessor for the `chrome.browserAction` namespace.
final ChromeBrowserAction browserAction = ChromeBrowserAction._browserAction == null ? apiNotAvailable('chrome.browserAction') : new ChromeBrowserAction._();

class ChromeBrowserAction {
  static final JsObject _browserAction = chrome['browserAction'];

  ChromeBrowserAction._();

  /**
   * Sets the title of the browser action. This shows up in the tooltip.
   */
  void setTitle(Map details) {
    _browserAction.callMethod('setTitle', [new JsObject.jsify(details)]);
  }

  /**
   * Gets the title of the browser action.
   */
  Future<String> getTitle(Map details) {
    var completer = new ChromeCompleter<String>.oneArg();
    _browserAction.callMethod('getTitle', [new JsObject.jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the icon for the browser action. The icon can be specified either as
   * the path to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   */
  Future setIcon(Map details) {
    var completer = new ChromeCompleter.noArgs();
    _browserAction.callMethod('setIcon', [new JsObject.jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * browser action's icon.
   */
  void setPopup(Map details) {
    _browserAction.callMethod('setPopup', [new JsObject.jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this browser action.
   */
  Future<String> getPopup(Map details) {
    var completer = new ChromeCompleter<String>.oneArg();
    _browserAction.callMethod('getPopup', [new JsObject.jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the badge text for the browser action. The badge is displayed on top
   * of the icon.
   */
  void setBadgeText(Map details) {
    _browserAction.callMethod('setBadgeText', [new JsObject.jsify(details)]);
  }

  /**
   * Gets the badge text of the browser action. If no tab is specified, the
   * non-tab-specific badge text is returned.
   */
  Future<String> getBadgeText(Map details) {
    var completer = new ChromeCompleter<String>.oneArg();
    _browserAction.callMethod('getBadgeText', [new JsObject.jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the background color for the badge.
   */
  void setBadgeBackgroundColor(Map details) {
    _browserAction.callMethod('setBadgeBackgroundColor', [new JsObject.jsify(details)]);
  }

  /**
   * Gets the background color of the browser action.
   */
  Future<ColorArray> getBadgeBackgroundColor(Map details) {
    var completer = new ChromeCompleter<ColorArray>.oneArg(_createColorArray);
    _browserAction.callMethod('getBadgeBackgroundColor', [new JsObject.jsify(details), completer.callback]);
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
  Stream<Tab> get onClicked => _onClicked.stream;

  final ChromeStreamController<Tab> _onClicked =
      new ChromeStreamController<Tab>.oneArg(_browserAction['onClicked'], _createTab);
}

class ColorArray extends ChromeObject {
  ColorArray();

  ColorArray.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

/**
 * Pixel data for an image. Must be an ImageData object (for example, from a
 * `canvas` element).
 */
class ImageDataType extends ChromeObject {
  ImageDataType();

  ImageDataType.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

ColorArray _createColorArray(JsObject proxy) => proxy == null ? null : new ColorArray.fromProxy(proxy);
Tab _createTab(JsObject proxy) => proxy == null ? null : new Tab.fromProxy(proxy);
