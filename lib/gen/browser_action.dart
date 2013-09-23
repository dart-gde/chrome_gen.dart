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
final ChromeBrowserAction browserAction = new ChromeBrowserAction._();

class ChromeBrowserAction {
  static final JsObject _browserAction = context['chrome']['browserAction'];

  ChromeBrowserAction._();

  /**
   * Sets the title of the browser action. This shows up in the tooltip.
   * 
   * [details] `title` The string the browser action should display when moused
   * over.
   * 
   * `tabId` Limits the change to when a particular tab is selected.
   * Automatically resets when the tab is closed.
   */
  void setTitle(Map details) {
    _browserAction.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the browser action.
   * 
   * [details] `tabId` Specify the tab to get the title from. If no tab is
   * specified, the non-tab-specific title is returned.
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
   * 
   * [details] `imageData` Either an ImageData object or a dictionary {size ->
   * ImageData} representing icon to be set. If the icon is specified as a
   * dictionary, the actual image to be used is chosen depending on screen's
   * pixel density. If the number of image pixels that fit into one screen space
   * unit equals `scale`, then image with size `scale` * 19 will be selected.
   * Initially only scales 1 and 2 will be supported. At least one image must be
   * specified. Note that 'details.imageData = foo' is equivalent to
   * 'details.imageData = {'19': foo}'
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
   * `tabId` Limits the change to when a particular tab is selected.
   * Automatically resets when the tab is closed.
   */
  Future setIcon(Map details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _browserAction.callMethod('setIcon', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * browser action's icon.
   * 
   * [details] `tabId` Limits the change to when a particular tab is selected.
   * Automatically resets when the tab is closed.
   * 
   * `popup` The html file to show in a popup.  If set to the empty string (''),
   * no popup is shown.
   */
  void setPopup(Map details) {
    _browserAction.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this browser action.
   * 
   * [details] `tabId` Specify the tab to get the popup from. If no tab is
   * specified, the non-tab-specific popup is returned.
   */
  Future<String> getPopup(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _browserAction.callMethod('getPopup', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the badge text for the browser action. The badge is displayed on top
   * of the icon.
   * 
   * [details] `text` Any number of characters can be passed, but only about
   * four can fit in the space.
   * 
   * `tabId` Limits the change to when a particular tab is selected.
   * Automatically resets when the tab is closed.
   */
  void setBadgeText(Map details) {
    _browserAction.callMethod('setBadgeText', [jsify(details)]);
  }

  /**
   * Gets the badge text of the browser action. If no tab is specified, the
   * non-tab-specific badge text is returned.
   * 
   * [details] `tabId` Specify the tab to get the badge text from. If no tab is
   * specified, the non-tab-specific badge text is returned.
   */
  Future<String> getBadgeText(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _browserAction.callMethod('getBadgeText', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the background color for the badge.
   * 
   * [details] `color` An array of four integers in the range [0,255] that make
   * up the RGBA color of the badge. For example, opaque red is `[255, 0, 0,
   * 255]`. Can also be a string with a CSS value, with opaque red being
   * `#FF0000` or `#F00`.
   * 
   * `tabId` Limits the change to when a particular tab is selected.
   * Automatically resets when the tab is closed.
   */
  void setBadgeBackgroundColor(Map details) {
    _browserAction.callMethod('setBadgeBackgroundColor', [jsify(details)]);
  }

  /**
   * Gets the background color of the browser action.
   * 
   * [details] `tabId` Specify the tab to get the badge background color from.
   * If no tab is specified, the non-tab-specific badge background color is
   * returned.
   */
  Future<ColorArray> getBadgeBackgroundColor(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(ColorArray.create);
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
  Stream<Tab> get onClicked => _onClicked.stream;

  final ChromeStreamController<Tab> _onClicked =
      new ChromeStreamController<Tab>.oneArg(_browserAction['onClicked'], Tab.create);
}

class ColorArray extends ChromeObject {
  static ColorArray create(JsObject proxy) => new ColorArray(proxy);

  ColorArray(JsObject proxy): super(proxy);
}

/**
 * Pixel data for an image. Must be an ImageData object (for example, from a
 * `canvas` element).
 */
class ImageDataType extends ChromeObject {
  static ImageDataType create(JsObject proxy) => new ImageDataType(proxy);

  ImageDataType(JsObject proxy): super(proxy);
}
