/* This file has been generated from tabs.json - do not edit */

/**
 * Use the `chrome.tabs` API to interact with the browser's tab system. You can
 * use this API to create, modify, and rearrange tabs in the browser.
 */
library chrome.tabs;

import 'runtime.dart';
import 'windows.dart';
import '../src/common.dart';

/// Accessor for the `chrome.tabs` namespace.
final ChromeTabs tabs = new ChromeTabs._();

class ChromeTabs {
  static final JsObject _tabs = context['chrome']['tabs'];

  ChromeTabs._();

  /**
   * Retrieves details about the specified tab.
   */
  Future<Tab> get(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Tab.create);
    _tabs.callMethod('get', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the tab that this script call is being made from. May be undefined if
   * called from a non-tab context (for example: a background page or popup
   * view).
   */
  Future<Tab> getCurrent() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Tab.create);
    _tabs.callMethod('getCurrent', [completer.callback]);
    return completer.future;
  }

  /**
   * Connects to the content script(s) in the specified tab. The
   * [runtime.onConnect] event is fired in each content script running in the
   * specified tab for the current extension. For more details, see [Content
   * Script Messaging](messaging.html).
   * 
   * [connectInfo] `name` Will be passed into onConnect for content scripts that
   * are listening for the connection event.
   * 
   * Returns:
   * A port that can be used to communicate with the content scripts running in
   * the specified tab. The port's [runtime.Port] event is fired if the tab
   * closes or does not exist.
   */
  Port connect(int tabId, [Map connectInfo]) {
    return new Port(_tabs.callMethod('connect', [tabId, jsify(connectInfo)]));
  }

  /**
   * Deprecated: Please use sendMessage.
   * 
   * Returns:
   * The JSON response object sent by the handler of the request. If an error
   * occurs while connecting to the specified tab, the callback will be called
   * with no arguments and [runtime.lastError] will be set to the error message.
   */
  Future<dynamic> sendRequest(int tabId, var request) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tabs.callMethod('sendRequest', [tabId, request, completer.callback]);
    return completer.future;
  }

  /**
   * Sends a single message to the content script(s) in the specified tab, with
   * an optional callback to run when a response is sent back.  The
   * [runtime.onMessage] event is fired in each content script running in the
   * specified tab for the current extension.
   * 
   * Returns:
   * The JSON response object sent by the handler of the message. If an error
   * occurs while connecting to the specified tab, the callback will be called
   * with no arguments and [runtime.lastError] will be set to the error message.
   */
  Future<dynamic> sendMessage(int tabId, var message) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tabs.callMethod('sendMessage', [tabId, message, completer.callback]);
    return completer.future;
  }

  /**
   * Deprecated. Please use query({'active': true}). Gets the tab that is
   * selected in the specified window.
   * 
   * [windowId] Defaults to the [current window](windows.html#current-window).
   */
  Future<Tab> getSelected([int windowId]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Tab.create);
    _tabs.callMethod('getSelected', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Deprecated. Please use query({'windowId': windowId}). Gets details about
   * all tabs in the specified window.
   * 
   * [windowId] Defaults to the [current window](windows.html#current-window).
   */
  Future<List<Tab>> getAllInWindow([int windowId]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Tab.create));
    _tabs.callMethod('getAllInWindow', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Creates a new tab.
   * 
   * [createProperties] `windowId` The window to create the new tab in. Defaults
   * to the [current window](windows.html#current-window).
   * 
   * `index` The position the tab should take in the window. The provided value
   * will be clamped to between zero and the number of tabs in the window.
   * 
   * `url` The URL to navigate the tab to initially. Fully-qualified URLs must
   * include a scheme (i.e. 'http://www.google.com', not 'www.google.com').
   * Relative URLs will be relative to the current page within the extension.
   * Defaults to the New Tab Page.
   * 
   * `active` Whether the tab should become the active tab in the window. Does
   * not affect whether the window is focused (see [windows.update]). Defaults
   * to [true].
   * 
   * `selected` Whether the tab should become the selected tab in the window.
   * Defaults to [true]
   * 
   * `pinned` Whether the tab should be pinned. Defaults to [false]
   * 
   * `openerTabId` The ID of the tab that opened this tab. If specified, the
   * opener tab must be in the same window as the newly created tab.
   * 
   * Returns:
   * Details about the created tab. Will contain the ID of the new tab.
   */
  Future<Tab> create(Map createProperties) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Tab.create);
    _tabs.callMethod('create', [jsify(createProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Duplicates a tab.
   * 
   * [tabId] The ID of the tab which is to be duplicated.
   * 
   * Returns:
   * Details about the duplicated tab. The [tabs.Tab] object doesn't contain
   * `url`, `title` and `favIconUrl` if the `"tabs"` permission has not been
   * requested.
   */
  Future<Tab> duplicate(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Tab.create);
    _tabs.callMethod('duplicate', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Gets all tabs that have the specified properties, or all tabs if no
   * properties are specified.
   * 
   * [queryInfo] `active` Whether the tabs are active in their windows.
   * 
   * `pinned` Whether the tabs are pinned.
   * 
   * `highlighted` Whether the tabs are highlighted.
   * 
   * `currentWindow` Whether the tabs are in the [current
   * window](windows.html#current-window).
   * 
   * `lastFocusedWindow` Whether the tabs are in the last focused window.
   * 
   * `status` Whether the tabs have completed loading.
   * 
   * `title` Match page titles against a pattern.
   * 
   * `url` Match tabs against a [URL pattern](match_patterns.html). Note that
   * fragment identifiers are not matched.
   * 
   * `windowId` The ID of the parent window, or [windows.WINDOW_ID_CURRENT] for
   * the [current window](windows.html#current-window).
   * 
   * `windowType` The type of window the tabs are in.
   * 
   * `index` The position of the tabs within their windows.
   */
  Future<List<Tab>> query(Map queryInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Tab.create));
    _tabs.callMethod('query', [jsify(queryInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Highlights the given tabs.
   * 
   * [highlightInfo] `windowId` The window that contains the tabs.
   * 
   * `tabs` One or more tab indices to highlight.
   * 
   * Returns:
   * Contains details about the window whose tabs were highlighted.
   */
  Future<Window> highlight(Map highlightInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _tabs.callMethod('highlight', [jsify(highlightInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Modifies the properties of a tab. Properties that are not specified in
   * [updateProperties] are not modified.
   * 
   * [tabId] Defaults to the selected tab of the [current
   * window](windows.html#current-window).
   * 
   * [updateProperties] `url` A URL to navigate the tab to.
   * 
   * `active` Whether the tab should be active. Does not affect whether the
   * window is focused (see [windows.update]).
   * 
   * `highlighted` Adds or removes the tab from the current selection.
   * 
   * `selected` Whether the tab should be selected.
   * 
   * `pinned` Whether the tab should be pinned.
   * 
   * `openerTabId` The ID of the tab that opened this tab. If specified, the
   * opener tab must be in the same window as this tab.
   * 
   * Returns:
   * Details about the updated tab. The [tabs.Tab] object doesn't contain `url`,
   * `title` and `favIconUrl` if the `"tabs"` permission has not been requested.
   */
  Future<Tab> update(Map updateProperties, [int tabId]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Tab.create);
    _tabs.callMethod('update', [tabId, jsify(updateProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Moves one or more tabs to a new position within its window, or to a new
   * window. Note that tabs can only be moved to and from normal (window.type
   * === "normal") windows.
   * 
   * [tabIds] The tab or list of tabs to move.
   * 
   * [moveProperties] `windowId` Defaults to the window the tab is currently in.
   * 
   * `index` The position to move the window to. -1 will place the tab at the
   * end of the window.
   * 
   * Returns:
   * Details about the moved tabs.
   */
  Future<dynamic> move(var tabIds, Map moveProperties) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tabs.callMethod('move', [tabIds, jsify(moveProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Reload a tab.
   * 
   * [tabId] The ID of the tab to reload; defaults to the selected tab of the
   * current window.
   * 
   * [reloadProperties] `bypassCache` Whether using any local cache. Default is
   * false.
   */
  Future reload([int tabId, Map reloadProperties]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabs.callMethod('reload', [tabId, jsify(reloadProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Closes one or more tabs.
   * 
   * [tabIds] The tab or list of tabs to close.
   */
  Future remove(var tabIds) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabs.callMethod('remove', [tabIds, completer.callback]);
    return completer.future;
  }

  /**
   * Detects the primary language of the content in a tab.
   * 
   * [tabId] Defaults to the active tab of the [current
   * window](windows.html#current-window).
   * 
   * Returns:
   * An ISO language code such as `en` or `fr`. For a complete list of languages
   * supported by this method, see
   * [kLanguageInfoTable](http://src.chromium.org/viewvc/chrome/trunk/src/third_party/cld/languages/internal/languages.cc).
   * The 2nd to 4th columns will be checked and the first non-NULL value will be
   * returned except for Simplified Chinese for which zh-CN will be returned.
   * For an unknown language, `und` will be returned.
   */
  Future<String> detectLanguage([int tabId]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tabs.callMethod('detectLanguage', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Captures the visible area of the currently active tab in the specified
   * window. You must have [host permission](declare_permissions.html) for the
   * URL displayed by the tab.
   * 
   * [windowId] The target window. Defaults to the [current
   * window](windows.html#current-window).
   * 
   * [options] Set parameters of image capture, such as the format of the
   * resulting image.
   * 
   * `format` The format of the resulting image.  Default is jpeg.
   * 
   * `quality` When format is 'jpeg', controls the quality of the resulting
   * image.  This value is ignored for PNG images.  As quality is decreased, the
   * resulting image will have more visual artifacts, and the number of bytes
   * needed to store it will decrease.
   * 
   * Returns:
   * A data URL which encodes an image of the visible area of the captured tab.
   * May be assigned to the 'src' property of an HTML Image element for display.
   */
  Future<String> captureVisibleTab([int windowId, Map options]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tabs.callMethod('captureVisibleTab', [windowId, jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Injects JavaScript code into a page. For details, see the [programmatic
   * injection](content_scripts.html#pi) section of the content scripts doc.
   * 
   * [tabId] The ID of the tab in which to run the script; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the script to run.
   * 
   * Returns:
   * The result of the script in every injected frame.
   */
  Future<List<dynamic>> executeScript(InjectDetails details, [int tabId]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(listify);
    _tabs.callMethod('executeScript', [tabId, details, completer.callback]);
    return completer.future;
  }

  /**
   * Injects CSS into a page. For details, see the [programmatic
   * injection](content_scripts.html#pi) section of the content scripts doc.
   * 
   * [tabId] The ID of the tab in which to insert the CSS; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the CSS text to insert.
   */
  Future insertCSS(InjectDetails details, [int tabId]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabs.callMethod('insertCSS', [tabId, details, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a tab is created. Note that the tab's URL may not be set at the
   * time this event fired, but you can listen to onUpdated events to be
   * notified when a URL is set.
   */
  Stream<Tab> get onCreated => _onCreated.stream;

  final ChromeStreamController<Tab> _onCreated =
      new ChromeStreamController<Tab>.oneArg(_tabs['onCreated'], Tab.create);

  /**
   * Fired when a tab is updated.
   */
  Stream<dynamic> get onUpdated => _onUpdated.stream;

  final ChromeStreamController<dynamic> _onUpdated =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onUpdated'], selfConverter);

  /**
   * Fired when a tab is moved within a window. Only one move event is fired,
   * representing the tab the user directly moved. Move events are not fired for
   * the other tabs that must move in response. This event is not fired when a
   * tab is moved between windows. For that, see [onDetached.]
   */
  Stream<dynamic> get onMoved => _onMoved.stream;

  final ChromeStreamController<dynamic> _onMoved =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onMoved'], selfConverter);

  /**
   * Deprecated. Please use onActivated.
   */
  Stream<dynamic> get onSelectionChanged => _onSelectionChanged.stream;

  final ChromeStreamController<dynamic> _onSelectionChanged =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onSelectionChanged'], selfConverter);

  /**
   * Deprecated. Please use onActivated.
   */
  Stream<dynamic> get onActiveChanged => _onActiveChanged.stream;

  final ChromeStreamController<dynamic> _onActiveChanged =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onActiveChanged'], selfConverter);

  /**
   * Fires when the active tab in a window changes. Note that the tab's URL may
   * not be set at the time this event fired, but you can listen to onUpdated
   * events to be notified when a URL is set.
   */
  Stream<Map> get onActivated => _onActivated.stream;

  final ChromeStreamController<Map> _onActivated =
      new ChromeStreamController<Map>.oneArg(_tabs['onActivated'], mapify);

  /**
   * Deprecated. Please use onHighlighted.
   */
  Stream<Map> get onHighlightChanged => _onHighlightChanged.stream;

  final ChromeStreamController<Map> _onHighlightChanged =
      new ChromeStreamController<Map>.oneArg(_tabs['onHighlightChanged'], mapify);

  /**
   * Fired when the highlighted or selected tabs in a window changes.
   */
  Stream<Map> get onHighlighted => _onHighlighted.stream;

  final ChromeStreamController<Map> _onHighlighted =
      new ChromeStreamController<Map>.oneArg(_tabs['onHighlighted'], mapify);

  /**
   * Fired when a tab is detached from a window, for example because it is being
   * moved between windows.
   */
  Stream<dynamic> get onDetached => _onDetached.stream;

  final ChromeStreamController<dynamic> _onDetached =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onDetached'], selfConverter);

  /**
   * Fired when a tab is attached to a window, for example because it was moved
   * between windows.
   */
  Stream<dynamic> get onAttached => _onAttached.stream;

  final ChromeStreamController<dynamic> _onAttached =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onAttached'], selfConverter);

  /**
   * Fired when a tab is closed.
   */
  Stream<dynamic> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<dynamic> _onRemoved =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onRemoved'], selfConverter);

  /**
   * Fired when a tab is replaced with another tab due to prerendering or
   * instant.
   */
  Stream<dynamic> get onReplaced => _onReplaced.stream;

  final ChromeStreamController<dynamic> _onReplaced =
      new ChromeStreamController<dynamic>.oneArg(_tabs['onReplaced'], selfConverter);
}

/**
 * `id` The ID of the tab. Tab IDs are unique within a browser session. Under
 * some circumstances a Tab may not be assigned an ID, for example when querying
 * foreign tabs using the [sessions] API, in which case a session ID may be
 * present.
 * 
 * `index` The zero-based index of the tab within its window.
 * 
 * `windowId` The ID of the window the tab is contained within.
 * 
 * `openerTabId` The ID of the tab that opened this tab, if any. This property
 * is only present if the opener tab still exists.
 * 
 * `selected` Whether the tab is selected.
 * 
 * `highlighted` Whether the tab is highlighted.
 * 
 * `active` Whether the tab is active in its window. (Does not necessarily mean
 * the window is focused.)
 * 
 * `pinned` Whether the tab is pinned.
 * 
 * `url` The URL the tab is displaying. This property is only present if the
 * extension's manifest includes the `"tabs"` permission.
 * 
 * `title` The title of the tab. This property is only present if the
 * extension's manifest includes the `"tabs"` permission.
 * 
 * `favIconUrl` The URL of the tab's favicon. This property is only present if
 * the extension's manifest includes the `"tabs"` permission. It may also be an
 * empty string if the tab is loading.
 * 
 * `status` Either _loading_ or _complete_.
 * 
 * `incognito` Whether the tab is in an incognito window.
 * 
 * `width` The width of the tab in pixels.
 * 
 * `height` The height of the tab in pixels.
 * 
 * `sessionId` The session ID used to uniquely identify a Tab obtained from the
 * [sessions] API.
 */
class Tab extends ChromeObject {
  static Tab create(JsObject proxy) => new Tab(proxy);

  Tab(JsObject proxy): super(proxy);

  /**
   * The ID of the tab. Tab IDs are unique within a browser session. Under some
   * circumstances a Tab may not be assigned an ID, for example when querying
   * foreign tabs using the [sessions] API, in which case a session ID may be
   * present.
   */
  int get id => proxy['id'];

  /**
   * The zero-based index of the tab within its window.
   */
  int get index => proxy['index'];

  /**
   * The ID of the window the tab is contained within.
   */
  int get windowId => proxy['windowId'];

  /**
   * The ID of the tab that opened this tab, if any. This property is only
   * present if the opener tab still exists.
   */
  int get openerTabId => proxy['openerTabId'];

  /**
   * Whether the tab is highlighted.
   */
  bool get highlighted => proxy['highlighted'];

  /**
   * Whether the tab is active in its window. (Does not necessarily mean the
   * window is focused.)
   */
  bool get active => proxy['active'];

  /**
   * Whether the tab is pinned.
   */
  bool get pinned => proxy['pinned'];

  /**
   * The URL the tab is displaying. This property is only present if the
   * extension's manifest includes the `"tabs"` permission.
   */
  String get url => proxy['url'];

  /**
   * The title of the tab. This property is only present if the extension's
   * manifest includes the `"tabs"` permission.
   */
  String get title => proxy['title'];

  /**
   * The URL of the tab's favicon. This property is only present if the
   * extension's manifest includes the `"tabs"` permission. It may also be an
   * empty string if the tab is loading.
   */
  String get favIconUrl => proxy['favIconUrl'];

  /**
   * Either _loading_ or _complete_.
   */
  String get status => proxy['status'];

  /**
   * Whether the tab is in an incognito window.
   */
  bool get incognito => proxy['incognito'];

  /**
   * The width of the tab in pixels.
   */
  int get width => proxy['width'];

  /**
   * The height of the tab in pixels.
   */
  int get height => proxy['height'];

  /**
   * The session ID used to uniquely identify a Tab obtained from the [sessions]
   * API.
   */
  String get sessionId => proxy['sessionId'];
}

/**
 * Details of the script or CSS to inject. Either the code or the file property
 * must be set, but both may not be set at the same time.
 * 
 * `code` JavaScript or CSS code to inject.
 * 
 * `file` JavaScript or CSS file to inject.
 * 
 * `allFrames` If allFrames is `true`, implies that the JavaScript or CSS should
 * be injected into all frames of current page. By default, it's `false` and is
 * only injected into the top frame.
 * 
 * `runAt` The soonest that the JavaScript or CSS will be injected into the tab.
 * Defaults to "document_idle".
 */
class InjectDetails extends ChromeObject {
  static InjectDetails create(JsObject proxy) => new InjectDetails(proxy);

  InjectDetails(JsObject proxy): super(proxy);

  /**
   * JavaScript or CSS code to inject.
   */
  String get code => proxy['code'];

  /**
   * JavaScript or CSS file to inject.
   */
  String get file => proxy['file'];

  /**
   * If allFrames is `true`, implies that the JavaScript or CSS should be
   * injected into all frames of current page. By default, it's `false` and is
   * only injected into the top frame.
   */
  bool get allFrames => proxy['allFrames'];

  /**
   * The soonest that the JavaScript or CSS will be injected into the tab.
   * Defaults to "document_idle".
   */
  String get runAt => proxy['runAt'];
}
