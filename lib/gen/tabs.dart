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
final ChromeTabs tabs = (ChromeTabs._tabs == null ? null : new ChromeTabs._());

class ChromeTabs {
  static final JsObject _tabs = context['chrome']['tabs'];

  ChromeTabs._();

  bool get available => _tabs != null;

  /**
   * Retrieves details about the specified tab.
   */
  Future<Tab> get(int tabId) {
    var completer = new ChromeCompleter<Tab>.oneArg(_createTab);
    _tabs.callMethod('get', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the tab that this script call is being made from. May be undefined if
   * called from a non-tab context (for example: a background page or popup
   * view).
   */
  Future<Tab> getCurrent() {
    var completer = new ChromeCompleter<Tab>.oneArg(_createTab);
    _tabs.callMethod('getCurrent', [completer.callback]);
    return completer.future;
  }

  /**
   * Connects to the content script(s) in the specified tab. The
   * [runtime.onConnect] event is fired in each content script running in the
   * specified tab for the current extension. For more details, see [Content
   * Script Messaging](messaging.html).
   * 
   * Returns:
   * A port that can be used to communicate with the content scripts running in
   * the specified tab. The port's [runtime.Port] event is fired if the tab
   * closes or does not exist.
   */
  Port connect(int tabId, [Map connectInfo]) {
    return _createPort(_tabs.callMethod('connect', [tabId, jsify(connectInfo)]));
  }

  /**
   * Deprecated: Please use sendMessage.
   * 
   * Returns:
   * The JSON response object sent by the handler of the request. If an error
   * occurs while connecting to the specified tab, the callback will be called
   * with no arguments and [runtime.lastError] will be set to the error message.
   */
  Future<dynamic> sendRequest(int tabId, dynamic request) {
    var completer = new ChromeCompleter<dynamic>.oneArg();
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
  Future<dynamic> sendMessage(int tabId, dynamic message) {
    var completer = new ChromeCompleter<dynamic>.oneArg();
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
    var completer = new ChromeCompleter<Tab>.oneArg(_createTab);
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
    var completer = new ChromeCompleter<List<Tab>>.oneArg((e) => listify(e, _createTab));
    _tabs.callMethod('getAllInWindow', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Creates a new tab.
   * 
   * Returns:
   * Details about the created tab. Will contain the ID of the new tab.
   */
  Future<Tab> create(Map createProperties) {
    var completer = new ChromeCompleter<Tab>.oneArg(_createTab);
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
    var completer = new ChromeCompleter<Tab>.oneArg(_createTab);
    _tabs.callMethod('duplicate', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Gets all tabs that have the specified properties, or all tabs if no
   * properties are specified.
   */
  Future<List<Tab>> query(Map queryInfo) {
    var completer = new ChromeCompleter<List<Tab>>.oneArg((e) => listify(e, _createTab));
    _tabs.callMethod('query', [jsify(queryInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Highlights the given tabs.
   * 
   * Returns:
   * Contains details about the window whose tabs were highlighted.
   */
  Future<Window> highlight(Map highlightInfo) {
    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
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
   * Returns:
   * Details about the updated tab. The [tabs.Tab] object doesn't contain `url`,
   * `title` and `favIconUrl` if the `"tabs"` permission has not been requested.
   */
  Future<Tab> update(Map updateProperties, [int tabId]) {
    var completer = new ChromeCompleter<Tab>.oneArg(_createTab);
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
   * Returns:
   * Details about the moved tabs.
   */
  Future<dynamic> move(dynamic tabIds, Map moveProperties) {
    var completer = new ChromeCompleter<dynamic>.oneArg();
    _tabs.callMethod('move', [tabIds, jsify(moveProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Reload a tab.
   * 
   * [tabId] The ID of the tab to reload; defaults to the selected tab of the
   * current window.
   */
  Future reload([int tabId, Map reloadProperties]) {
    var completer = new ChromeCompleter.noArgs();
    _tabs.callMethod('reload', [tabId, jsify(reloadProperties), completer.callback]);
    return completer.future;
  }

  /**
   * Closes one or more tabs.
   * 
   * [tabIds] The tab or list of tabs to close.
   */
  Future remove(dynamic tabIds) {
    var completer = new ChromeCompleter.noArgs();
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
    var completer = new ChromeCompleter<String>.oneArg();
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
   * Returns:
   * A data URL which encodes an image of the visible area of the captured tab.
   * May be assigned to the 'src' property of an HTML Image element for display.
   */
  Future<String> captureVisibleTab([int windowId, Map options]) {
    var completer = new ChromeCompleter<String>.oneArg();
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
    var completer = new ChromeCompleter<List<dynamic>>.oneArg(listify);
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
    var completer = new ChromeCompleter.noArgs();
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
      new ChromeStreamController<Tab>.oneArg(_tabs['onCreated'], _createTab);

  /**
   * Fired when a tab is updated.
   */
  Stream<OnUpdatedEvent> get onUpdated => _onUpdated.stream;

  final ChromeStreamController<OnUpdatedEvent> _onUpdated =
      new ChromeStreamController<OnUpdatedEvent>.threeArgs(_tabs['onUpdated'], _createOnUpdatedEvent);

  /**
   * Fired when a tab is moved within a window. Only one move event is fired,
   * representing the tab the user directly moved. Move events are not fired for
   * the other tabs that must move in response. This event is not fired when a
   * tab is moved between windows. For that, see [onDetached.]
   */
  Stream<TabsOnMovedEvent> get onMoved => _onMoved.stream;

  final ChromeStreamController<TabsOnMovedEvent> _onMoved =
      new ChromeStreamController<TabsOnMovedEvent>.twoArgs(_tabs['onMoved'], _createTabsOnMovedEvent);

  /**
   * Deprecated. Please use onActivated.
   */
  Stream<OnSelectionChangedEvent> get onSelectionChanged => _onSelectionChanged.stream;

  final ChromeStreamController<OnSelectionChangedEvent> _onSelectionChanged =
      new ChromeStreamController<OnSelectionChangedEvent>.twoArgs(_tabs['onSelectionChanged'], _createOnSelectionChangedEvent);

  /**
   * Deprecated. Please use onActivated.
   */
  Stream<OnActiveChangedEvent> get onActiveChanged => _onActiveChanged.stream;

  final ChromeStreamController<OnActiveChangedEvent> _onActiveChanged =
      new ChromeStreamController<OnActiveChangedEvent>.twoArgs(_tabs['onActiveChanged'], _createOnActiveChangedEvent);

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
  Stream<OnDetachedEvent> get onDetached => _onDetached.stream;

  final ChromeStreamController<OnDetachedEvent> _onDetached =
      new ChromeStreamController<OnDetachedEvent>.twoArgs(_tabs['onDetached'], _createOnDetachedEvent);

  /**
   * Fired when a tab is attached to a window, for example because it was moved
   * between windows.
   */
  Stream<OnAttachedEvent> get onAttached => _onAttached.stream;

  final ChromeStreamController<OnAttachedEvent> _onAttached =
      new ChromeStreamController<OnAttachedEvent>.twoArgs(_tabs['onAttached'], _createOnAttachedEvent);

  /**
   * Fired when a tab is closed.
   */
  Stream<TabsOnRemovedEvent> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<TabsOnRemovedEvent> _onRemoved =
      new ChromeStreamController<TabsOnRemovedEvent>.twoArgs(_tabs['onRemoved'], _createTabsOnRemovedEvent);

  /**
   * Fired when a tab is replaced with another tab due to prerendering or
   * instant.
   */
  Stream<OnReplacedEvent> get onReplaced => _onReplaced.stream;

  final ChromeStreamController<OnReplacedEvent> _onReplaced =
      new ChromeStreamController<OnReplacedEvent>.twoArgs(_tabs['onReplaced'], _createOnReplacedEvent);
}

/**
 * Fired when a tab is updated.
 */
class OnUpdatedEvent {

  final int tabId;

  /**
   * Lists the changes to the state of the tab that was updated.
   */
  final Map changeInfo;

  /**
   * Gives the state of the tab that was updated.
   */
  final Tab tab;

  OnUpdatedEvent(this.tabId, this.changeInfo, this.tab);
}

/**
 * Fired when a tab is moved within a window. Only one move event is fired,
 * representing the tab the user directly moved. Move events are not fired for
 * the other tabs that must move in response. This event is not fired when a tab
 * is moved between windows. For that, see [onDetached.]
 */
class TabsOnMovedEvent {

  final int tabId;

  final Map moveInfo;

  TabsOnMovedEvent(this.tabId, this.moveInfo);
}

/**
 * Deprecated. Please use onActivated.
 */
class OnSelectionChangedEvent {

  /**
   * The ID of the tab that has become active.
   */
  final int tabId;

  final Map selectInfo;

  OnSelectionChangedEvent(this.tabId, this.selectInfo);
}

/**
 * Deprecated. Please use onActivated.
 */
class OnActiveChangedEvent {

  /**
   * The ID of the tab that has become active.
   */
  final int tabId;

  final Map selectInfo;

  OnActiveChangedEvent(this.tabId, this.selectInfo);
}

/**
 * Fired when a tab is detached from a window, for example because it is being
 * moved between windows.
 */
class OnDetachedEvent {

  final int tabId;

  final Map detachInfo;

  OnDetachedEvent(this.tabId, this.detachInfo);
}

/**
 * Fired when a tab is attached to a window, for example because it was moved
 * between windows.
 */
class OnAttachedEvent {

  final int tabId;

  final Map attachInfo;

  OnAttachedEvent(this.tabId, this.attachInfo);
}

/**
 * Fired when a tab is closed.
 */
class TabsOnRemovedEvent {

  final int tabId;

  final Map removeInfo;

  TabsOnRemovedEvent(this.tabId, this.removeInfo);
}

/**
 * Fired when a tab is replaced with another tab due to prerendering or instant.
 */
class OnReplacedEvent {

  final int addedTabId;

  final int removedTabId;

  OnReplacedEvent(this.addedTabId, this.removedTabId);
}

class Tab extends ChromeObject {

  Tab({int id, int index, int windowId, int openerTabId, bool highlighted, bool active, bool pinned, String url, String title, String favIconUrl, String status, bool incognito, int width, int height, String sessionId}) {
    if (id != null) this.id = id;
    if (index != null) this.index = index;
    if (windowId != null) this.windowId = windowId;
    if (openerTabId != null) this.openerTabId = openerTabId;
    if (highlighted != null) this.highlighted = highlighted;
    if (active != null) this.active = active;
    if (pinned != null) this.pinned = pinned;
    if (url != null) this.url = url;
    if (title != null) this.title = title;
    if (favIconUrl != null) this.favIconUrl = favIconUrl;
    if (status != null) this.status = status;
    if (incognito != null) this.incognito = incognito;
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (sessionId != null) this.sessionId = sessionId;
  }

  Tab.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The ID of the tab. Tab IDs are unique within a browser session. Under some
   * circumstances a Tab may not be assigned an ID, for example when querying
   * foreign tabs using the [sessions] API, in which case a session ID may be
   * present.
   */
  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;

  /**
   * The zero-based index of the tab within its window.
   */
  int get index => proxy['index'];
  set index(int value) => proxy['index'] = value;

  /**
   * The ID of the window the tab is contained within.
   */
  int get windowId => proxy['windowId'];
  set windowId(int value) => proxy['windowId'] = value;

  /**
   * The ID of the tab that opened this tab, if any. This property is only
   * present if the opener tab still exists.
   */
  int get openerTabId => proxy['openerTabId'];
  set openerTabId(int value) => proxy['openerTabId'] = value;

  /**
   * Whether the tab is highlighted.
   */
  bool get highlighted => proxy['highlighted'];
  set highlighted(bool value) => proxy['highlighted'] = value;

  /**
   * Whether the tab is active in its window. (Does not necessarily mean the
   * window is focused.)
   */
  bool get active => proxy['active'];
  set active(bool value) => proxy['active'] = value;

  /**
   * Whether the tab is pinned.
   */
  bool get pinned => proxy['pinned'];
  set pinned(bool value) => proxy['pinned'] = value;

  /**
   * The URL the tab is displaying. This property is only present if the
   * extension's manifest includes the `"tabs"` permission.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  /**
   * The title of the tab. This property is only present if the extension's
   * manifest includes the `"tabs"` permission.
   */
  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  /**
   * The URL of the tab's favicon. This property is only present if the
   * extension's manifest includes the `"tabs"` permission. It may also be an
   * empty string if the tab is loading.
   */
  String get favIconUrl => proxy['favIconUrl'];
  set favIconUrl(String value) => proxy['favIconUrl'] = value;

  /**
   * Either _loading_ or _complete_.
   */
  String get status => proxy['status'];
  set status(String value) => proxy['status'] = value;

  /**
   * Whether the tab is in an incognito window.
   */
  bool get incognito => proxy['incognito'];
  set incognito(bool value) => proxy['incognito'] = value;

  /**
   * The width of the tab in pixels.
   */
  int get width => proxy['width'];
  set width(int value) => proxy['width'] = value;

  /**
   * The height of the tab in pixels.
   */
  int get height => proxy['height'];
  set height(int value) => proxy['height'] = value;

  /**
   * The session ID used to uniquely identify a Tab obtained from the [sessions]
   * API.
   */
  String get sessionId => proxy['sessionId'];
  set sessionId(String value) => proxy['sessionId'] = value;
}

/**
 * Details of the script or CSS to inject. Either the code or the file property
 * must be set, but both may not be set at the same time.
 */
class InjectDetails extends ChromeObject {

  InjectDetails({String code, String file, bool allFrames, String runAt}) {
    if (code != null) this.code = code;
    if (file != null) this.file = file;
    if (allFrames != null) this.allFrames = allFrames;
    if (runAt != null) this.runAt = runAt;
  }

  InjectDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * JavaScript or CSS code to inject.
   */
  String get code => proxy['code'];
  set code(String value) => proxy['code'] = value;

  /**
   * JavaScript or CSS file to inject.
   */
  String get file => proxy['file'];
  set file(String value) => proxy['file'] = value;

  /**
   * If allFrames is `true`, implies that the JavaScript or CSS should be
   * injected into all frames of current page. By default, it's `false` and is
   * only injected into the top frame.
   */
  bool get allFrames => proxy['allFrames'];
  set allFrames(bool value) => proxy['allFrames'] = value;

  /**
   * The soonest that the JavaScript or CSS will be injected into the tab.
   * Defaults to "document_idle".
   * enum of `document_start`, `document_end`, `document_idle`
   */
  String get runAt => proxy['runAt'];
  set runAt(String value) => proxy['runAt'] = value;
}

Tab _createTab(JsObject proxy) => proxy == null ? null : new Tab.fromProxy(proxy);
Port _createPort(JsObject proxy) => proxy == null ? null : new Port.fromProxy(proxy);
Window _createWindow(JsObject proxy) => proxy == null ? null : new Window.fromProxy(proxy);
OnUpdatedEvent _createOnUpdatedEvent(int tabId, JsObject changeInfo, JsObject tab) =>
    new OnUpdatedEvent(tabId, mapify(changeInfo), _createTab(tab));
TabsOnMovedEvent _createTabsOnMovedEvent(int tabId, JsObject moveInfo) =>
    new TabsOnMovedEvent(tabId, mapify(moveInfo));
OnSelectionChangedEvent _createOnSelectionChangedEvent(int tabId, JsObject selectInfo) =>
    new OnSelectionChangedEvent(tabId, mapify(selectInfo));
OnActiveChangedEvent _createOnActiveChangedEvent(int tabId, JsObject selectInfo) =>
    new OnActiveChangedEvent(tabId, mapify(selectInfo));
OnDetachedEvent _createOnDetachedEvent(int tabId, JsObject detachInfo) =>
    new OnDetachedEvent(tabId, mapify(detachInfo));
OnAttachedEvent _createOnAttachedEvent(int tabId, JsObject attachInfo) =>
    new OnAttachedEvent(tabId, mapify(attachInfo));
TabsOnRemovedEvent _createTabsOnRemovedEvent(int tabId, JsObject removeInfo) =>
    new TabsOnRemovedEvent(tabId, mapify(removeInfo));
OnReplacedEvent _createOnReplacedEvent(int addedTabId, int removedTabId) =>
    new OnReplacedEvent(addedTabId, removedTabId);
