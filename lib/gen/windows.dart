/* This file has been generated from windows.json - do not edit */

/**
 * Use the `chrome.windows` API to interact with browser windows. You can use
 * this API to create, modify, and rearrange windows in the browser.
 */
library chrome.windows;

import 'tabs.dart';
import '../src/common.dart';

/// Accessor for the `chrome.windows` namespace.
final ChromeWindows windows = new ChromeWindows._();

class ChromeWindows {
  static final JsObject _windows = context['chrome']['windows'];

  ChromeWindows._();

  /**
   * The windowId value that represents the absence of a chrome browser window.
   */
  int get WINDOW_ID_NONE => _windows['WINDOW_ID_NONE'];

  /**
   * The windowId value that represents the [current
   * window](windows.html#current-window).
   */
  int get WINDOW_ID_CURRENT => _windows['WINDOW_ID_CURRENT'];

  /**
   * Gets details about a window.
   * 
   * [getInfo]
   */
  Future<Window> get(int windowId, [Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('get', [windowId, jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the [current window](#current-window).
   * 
   * [getInfo]
   */
  Future<Window> getCurrent([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('getCurrent', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the window that was most recently focused - typically the window 'on
   * top'.
   * 
   * [getInfo]
   */
  Future<Window> getLastFocused([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('getLastFocused', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets all windows.
   * 
   * [getInfo]
   */
  Future<List<Window>> getAll([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Window.create));
    _windows.callMethod('getAll', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Creates (opens) a new browser with any optional sizing, position or default
   * URL provided.
   * 
   * Returns:
   * Contains details about the created window.
   */
  Future<Window> create([Map createData]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('create', [jsify(createData), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties of a window. Specify only the properties that you
   * want to change; unspecified properties will be left unchanged.
   */
  Future<Window> update(int windowId, Map updateInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('update', [windowId, jsify(updateInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Removes (closes) a window, and all the tabs inside it.
   */
  Future remove(int windowId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _windows.callMethod('remove', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a window is created.
   */
  Stream<Window> get onCreated => _onCreated.stream;

  final ChromeStreamController<Window> _onCreated =
      new ChromeStreamController<Window>.oneArg(_windows['onCreated'], Window.create);

  /**
   * Fired when a window is removed (closed).
   */
  Stream<int> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<int> _onRemoved =
      new ChromeStreamController<int>.oneArg(_windows['onRemoved'], selfConverter);

  /**
   * Fired when the currently focused window changes. Will be
   * chrome.windows.WINDOW_ID_NONE if all chrome windows have lost focus. Note:
   * On some Linux window managers, WINDOW_ID_NONE will always be sent
   * immediately preceding a switch from one chrome window to another.
   */
  Stream<int> get onFocusChanged => _onFocusChanged.stream;

  final ChromeStreamController<int> _onFocusChanged =
      new ChromeStreamController<int>.oneArg(_windows['onFocusChanged'], selfConverter);
}

class Window extends ChromeObject {
  static Window create(JsObject proxy) => proxy == null ? null : new Window.fromProxy(proxy);

  Window({int id, bool focused, int top, int left, int width, int height, List<Tab> tabs, bool incognito, String type, String state, bool alwaysOnTop, String sessionId}) {
    if (id != null) this.id = id;
    if (focused != null) this.focused = focused;
    if (top != null) this.top = top;
    if (left != null) this.left = left;
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (tabs != null) this.tabs = tabs;
    if (incognito != null) this.incognito = incognito;
    if (type != null) this.type = type;
    if (state != null) this.state = state;
    if (alwaysOnTop != null) this.alwaysOnTop = alwaysOnTop;
    if (sessionId != null) this.sessionId = sessionId;
  }

  Window.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The ID of the window. Window IDs are unique within a browser session. Under
   * some circumstances a Window may not be assigned an ID, for example when
   * querying windows using the [sessions] API, in which case a session ID may
   * be present.
   */
  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;

  /**
   * Whether the window is currently the focused window.
   */
  bool get focused => proxy['focused'];
  set focused(bool value) => proxy['focused'] = value;

  /**
   * The offset of the window from the top edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned top property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get top => proxy['top'];
  set top(int value) => proxy['top'] = value;

  /**
   * The offset of the window from the left edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned left property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get left => proxy['left'];
  set left(int value) => proxy['left'] = value;

  /**
   * The width of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned width property, for example when
   * querying closed windows from the [sessions] API.
   */
  int get width => proxy['width'];
  set width(int value) => proxy['width'] = value;

  /**
   * The height of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned height property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get height => proxy['height'];
  set height(int value) => proxy['height'] = value;

  /**
   * Array of [tabs.Tab] objects representing the current tabs in the window.
   */
  List<Tab> get tabs => listify(proxy['tabs'], Tab.create);
  set tabs(List<Tab> value) => proxy['tabs'] = value;

  /**
   * Whether the window is incognito.
   */
  bool get incognito => proxy['incognito'];
  set incognito(bool value) => proxy['incognito'] = value;

  /**
   * The type of browser window this is. Under some circumstances a Window may
   * not be assigned type property, for example when querying closed windows
   * from the [sessions] API.
   * enum of `normal`, `popup`, `panel`, `app`
   */
  String get type => proxy['type'];
  set type(String value) => proxy['type'] = value;

  /**
   * The state of this browser window. Under some circumstances a Window may not
   * be assigned state property, for example when querying closed windows from
   * the [sessions] API.
   * enum of `normal`, `minimized`, `maximized`, `fullscreen`
   */
  String get state => proxy['state'];
  set state(String value) => proxy['state'] = value;

  /**
   * Whether the window is set to be always on top.
   */
  bool get alwaysOnTop => proxy['alwaysOnTop'];
  set alwaysOnTop(bool value) => proxy['alwaysOnTop'] = value;

  /**
   * The session ID used to uniquely identify a Window obtained from the
   * [sessions] API.
   */
  String get sessionId => proxy['sessionId'];
  set sessionId(String value) => proxy['sessionId'] = value;
}
