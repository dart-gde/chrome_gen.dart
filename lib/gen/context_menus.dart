/* This file has been generated from context_menus.json - do not edit */

/**
 * Use the `chrome.contextMenus` API to add items to Google Chrome's context
 * menu. You can choose what types of objects your context menu additions apply
 * to, such as images, hyperlinks, and pages.
 */
library chrome.contextMenus;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.contextMenus` namespace.
 */
final ChromeContextMenus contextMenus = new ChromeContextMenus._();

class ChromeContextMenus extends ChromeApi {
  static final JsObject _contextMenus = chrome['contextMenus'];

  ChromeContextMenus._();

  bool get available => _contextMenus != null;

  /**
   * Creates a new context menu item. Note that if an error occurs during
   * creation, you may not find out until the creation callback fires (the
   * details will be in chrome.runtime.lastError).
   * 
   * [callback] Called when the item has been created in the browser. If there
   * were any problems creating the item, details will be available in
   * chrome.runtime.lastError.
   * 
   * Returns:
   * The ID of the newly created item.
   */
  dynamic create(Map createProperties, [dynamic callback]) {
    if (_contextMenus == null) _throwNotAvailable();

    return _contextMenus.callMethod('create', [jsify(createProperties), jsify(callback)]);
  }

  /**
   * Updates a previously created context menu item.
   * 
   * [id] The ID of the item to update.
   * 
   * [updateProperties] The properties to update. Accepts the same values as the
   * create function.
   */
  Future update(dynamic id, Map updateProperties) {
    if (_contextMenus == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _contextMenus.callMethod('update', [jsify(id), jsify(updateProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Removes a context menu item.
   * 
   * [menuItemId] The ID of the context menu item to remove.
   */
  Future remove(dynamic menuItemId) {
    if (_contextMenus == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _contextMenus.callMethod('remove', [jsify(menuItemId), completer.callback]);
    return completer.future;
  }

  /**
   * Removes all context menu items added by this extension.
   */
  Future removeAll() {
    if (_contextMenus == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _contextMenus.callMethod('removeAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a context menu item is clicked.
   */
  Stream<OnClickedEvent> get onClicked => _onClicked.stream;

  final ChromeStreamController<OnClickedEvent> _onClicked =
      new ChromeStreamController<OnClickedEvent>.twoArgs(_contextMenus, 'onClicked', _createOnClickedEvent);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.contextMenus' is not available");
  }
}

/**
 * Fired when a context menu item is clicked.
 */
class OnClickedEvent {
  /**
   * Information about the item clicked and the context where the click
   * happened.
   */
  final OnClickData info;

  /**
   * The details of the tab where the click took place. If the click did not
   * take place in a tab, this parameter will be missing.
   * `optional`
   * 
   * The details of the tab where the click took place. If the click did not
   * take place in a tab, this parameter will be missing.
   */
  final Tab tab;

  OnClickedEvent(this.info, this.tab);
}

/**
 * Information sent when a context menu item is clicked.
 */
class OnClickData extends ChromeObject {
  OnClickData({var menuItemId, var parentMenuItemId, String mediaType, String linkUrl, String srcUrl, String pageUrl, String frameUrl, String selectionText, bool editable, bool wasChecked, bool checked}) {
    if (menuItemId != null) this.menuItemId = menuItemId;
    if (parentMenuItemId != null) this.parentMenuItemId = parentMenuItemId;
    if (mediaType != null) this.mediaType = mediaType;
    if (linkUrl != null) this.linkUrl = linkUrl;
    if (srcUrl != null) this.srcUrl = srcUrl;
    if (pageUrl != null) this.pageUrl = pageUrl;
    if (frameUrl != null) this.frameUrl = frameUrl;
    if (selectionText != null) this.selectionText = selectionText;
    if (editable != null) this.editable = editable;
    if (wasChecked != null) this.wasChecked = wasChecked;
    if (checked != null) this.checked = checked;
  }
  OnClickData.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the menu item that was clicked.
   */
  dynamic get menuItemId => jsProxy['menuItemId'];
  set menuItemId(var value) => jsProxy['menuItemId'] = jsify(value);

  /**
   * The parent ID, if any, for the item clicked.
   */
  dynamic get parentMenuItemId => jsProxy['parentMenuItemId'];
  set parentMenuItemId(var value) => jsProxy['parentMenuItemId'] = jsify(value);

  /**
   * One of 'image', 'video', or 'audio' if the context menu was activated on
   * one of these types of elements.
   */
  String get mediaType => jsProxy['mediaType'];
  set mediaType(String value) => jsProxy['mediaType'] = value;

  /**
   * If the element is a link, the URL it points to.
   */
  String get linkUrl => jsProxy['linkUrl'];
  set linkUrl(String value) => jsProxy['linkUrl'] = value;

  /**
   * Will be present for elements with a 'src' URL.
   */
  String get srcUrl => jsProxy['srcUrl'];
  set srcUrl(String value) => jsProxy['srcUrl'] = value;

  /**
   * The URL of the page where the menu item was clicked. This property is not
   * set if the click occured in a context where there is no current page, such
   * as in a launcher context menu.
   */
  String get pageUrl => jsProxy['pageUrl'];
  set pageUrl(String value) => jsProxy['pageUrl'] = value;

  /**
   * The URL of the frame of the element where the context menu was clicked, if
   * it was in a frame.
   */
  String get frameUrl => jsProxy['frameUrl'];
  set frameUrl(String value) => jsProxy['frameUrl'] = value;

  /**
   * The text for the context selection, if any.
   */
  String get selectionText => jsProxy['selectionText'];
  set selectionText(String value) => jsProxy['selectionText'] = value;

  /**
   * A flag indicating whether the element is editable (text input, textarea,
   * etc.).
   */
  bool get editable => jsProxy['editable'];
  set editable(bool value) => jsProxy['editable'] = value;

  /**
   * A flag indicating the state of a checkbox or radio item before it was
   * clicked.
   */
  bool get wasChecked => jsProxy['wasChecked'];
  set wasChecked(bool value) => jsProxy['wasChecked'] = value;

  /**
   * A flag indicating the state of a checkbox or radio item after it is
   * clicked.
   */
  bool get checked => jsProxy['checked'];
  set checked(bool value) => jsProxy['checked'] = value;
}

OnClickedEvent _createOnClickedEvent(JsObject info, JsObject tab) =>
    new OnClickedEvent(_createOnClickData(info), _createTab(tab));
OnClickData _createOnClickData(JsObject jsProxy) => jsProxy == null ? null : new OnClickData.fromProxy(jsProxy);
Tab _createTab(JsObject jsProxy) => jsProxy == null ? null : new Tab.fromProxy(jsProxy);
