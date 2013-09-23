/* This file has been generated from context_menus.json - do not edit */

/**
 * Use the `chrome.contextMenus` API to add items to Google Chrome's context
 * menu. You can choose what types of objects your context menu additions apply
 * to, such as images, hyperlinks, and pages.
 */
library chrome.contextMenus;

import 'tabs.dart';
import '../src/common.dart';

/// Accessor for the `chrome.contextMenus` namespace.
final ChromeContextMenus contextMenus = new ChromeContextMenus._();

class ChromeContextMenus {
  static final JsObject _contextMenus = context['chrome']['contextMenus'];

  ChromeContextMenus._();

  /**
   * Creates a new context menu item. Note that if an error occurs during
   * creation, you may not find out until the creation callback fires (the
   * details will be in chrome.runtime.lastError).
   * 
   * [createProperties] `type` The type of menu item. Defaults to 'normal' if
   * not specified.
   * 
   * `id` The unique ID to assign to this item. Mandatory for event pages.
   * Cannot be the same as another ID for this extension.
   * 
   * `title` The text to be displayed in the item; this is _required_ unless
   * _type_ is 'separator'. When the context is 'selection', you can use `%s`
   * within the string to show the selected text. For example, if this
   * parameter's value is "Translate '%s' to Pig Latin" and the user selects the
   * word "cool", the context menu item for the selection is "Translate 'cool'
   * to Pig Latin".
   * 
   * `checked` The initial state of a checkbox or radio item: true for selected
   * and false for unselected. Only one radio item can be selected at a time in
   * a given group of radio items.
   * 
   * `contexts` List of contexts this menu item will appear in. Defaults to
   * ['page'] if not specified. Specifying ['all'] is equivalent to the
   * combination of all other contexts except for 'launcher'. The 'launcher'
   * context is only supported by apps and is used to add menu items to the
   * context menu that appears when clicking on the app icon in the
   * launcher/taskbar/dock/etc. Different platforms might put limitations on
   * what is actually supported in a launcher context menu.
   * 
   * `onclick` A function that will be called back when the menu item is
   * clicked. Event pages cannot use this; instead, they should register a
   * listener for chrome.contextMenus.onClicked.
   * 
   * `parentId` The ID of a parent menu item; this makes the item a child of a
   * previously added item.
   * 
   * `documentUrlPatterns` Lets you restrict the item to apply only to documents
   * whose URL matches one of the given patterns. (This applies to frames as
   * well.) For details on the format of a pattern, see [Match
   * Patterns](match_patterns.html).
   * 
   * `targetUrlPatterns` Similar to documentUrlPatterns, but lets you filter
   * based on the src attribute of img/audio/video tags and the href of anchor
   * tags.
   * 
   * `enabled` Whether this context menu item is enabled or disabled. Defaults
   * to true.
   * 
   * [callback] Called when the item has been created in the browser. If there
   * were any problems creating the item, details will be available in
   * chrome.runtime.lastError.
   * 
   * Returns:
   * The ID of the newly created item.
   */
  dynamic create(Map createProperties, [var callback]) {
    return _contextMenus.callMethod('create', [jsify(createProperties), callback]);
  }

  /**
   * Updates a previously created context menu item.
   * 
   * [id] The ID of the item to update.
   * 
   * [updateProperties] The properties to update. Accepts the same values as the
   * create function.
   * 
   * `type`
   * 
   * `title`
   * 
   * `checked`
   * 
   * `contexts`
   * 
   * `onclick`
   * 
   * `parentId` Note: You cannot change an item to be a child of one of its own
   * descendants.
   * 
   * `documentUrlPatterns`
   * 
   * `targetUrlPatterns`
   * 
   * `enabled`
   */
  Future update(var id, Map updateProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _contextMenus.callMethod('update', [id, jsify(updateProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Removes a context menu item.
   * 
   * [menuItemId] The ID of the context menu item to remove.
   */
  Future remove(var menuItemId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _contextMenus.callMethod('remove', [menuItemId, completer.callback]);
    return completer.future;
  }

  /**
   * Removes all context menu items added by this extension.
   */
  Future removeAll() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _contextMenus.callMethod('removeAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a context menu item is clicked.
   */
  Stream<dynamic> get onClicked => _onClicked.stream;

  final ChromeStreamController<dynamic> _onClicked =
      new ChromeStreamController<dynamic>.oneArg(_contextMenus['onClicked'], selfConverter);
}

/**
 * Information sent when a context menu item is clicked.
 * 
 * `menuItemId` The ID of the menu item that was clicked.
 * 
 * `parentMenuItemId` The parent ID, if any, for the item clicked.
 * 
 * `mediaType` One of 'image', 'video', or 'audio' if the context menu was
 * activated on one of these types of elements.
 * 
 * `linkUrl` If the element is a link, the URL it points to.
 * 
 * `srcUrl` Will be present for elements with a 'src' URL.
 * 
 * `pageUrl` The URL of the page where the menu item was clicked. This property
 * is not set if the click occured in a context where there is no current page,
 * such as in a launcher context menu.
 * 
 * `frameUrl`  The URL of the frame of the element where the context menu was
 * clicked, if it was in a frame.
 * 
 * `selectionText` The text for the context selection, if any.
 * 
 * `editable` A flag indicating whether the element is editable (text input,
 * textarea, etc.).
 * 
 * `wasChecked` A flag indicating the state of a checkbox or radio item before
 * it was clicked.
 * 
 * `checked` A flag indicating the state of a checkbox or radio item after it is
 * clicked.
 */
class OnClickData extends ChromeObject {
  static OnClickData create(JsObject proxy) => new OnClickData(proxy);

  OnClickData(JsObject proxy): super(proxy);

  /**
   * The ID of the menu item that was clicked.
   */
  dynamic get menuItemId => proxy['menuItemId'];

  /**
   * The parent ID, if any, for the item clicked.
   */
  dynamic get parentMenuItemId => proxy['parentMenuItemId'];

  /**
   * One of 'image', 'video', or 'audio' if the context menu was activated on
   * one of these types of elements.
   */
  String get mediaType => proxy['mediaType'];

  /**
   * If the element is a link, the URL it points to.
   */
  String get linkUrl => proxy['linkUrl'];

  /**
   * Will be present for elements with a 'src' URL.
   */
  String get srcUrl => proxy['srcUrl'];

  /**
   * The URL of the page where the menu item was clicked. This property is not
   * set if the click occured in a context where there is no current page, such
   * as in a launcher context menu.
   */
  String get pageUrl => proxy['pageUrl'];

  /**
   * The URL of the frame of the element where the context menu was clicked, if
   * it was in a frame.
   */
  String get frameUrl => proxy['frameUrl'];

  /**
   * The text for the context selection, if any.
   */
  String get selectionText => proxy['selectionText'];

  /**
   * A flag indicating whether the element is editable (text input, textarea,
   * etc.).
   */
  bool get editable => proxy['editable'];

  /**
   * A flag indicating the state of a checkbox or radio item before it was
   * clicked.
   */
  bool get wasChecked => proxy['wasChecked'];

  /**
   * A flag indicating the state of a checkbox or radio item after it is
   * clicked.
   */
  bool get checked => proxy['checked'];
}
