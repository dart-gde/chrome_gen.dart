/* This file has been generated from windows.json - do not edit */

/**
 * Use the `chrome.windows` API to interact with browser windows. You can use
 * this API to create, modify, and rearrange windows in the browser.
 */
library chrome.windows;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.windows` namespace.
 */
final ChromeWindows windows = new ChromeWindows._();

class ChromeWindows extends ChromeApi {
  static final JsObject _windows = chrome['windows'];

  ChromeWindows._();

  bool get available => _windows != null;

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
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
    _windows.callMethod('get', [windowId, jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the [current window](#current-window).
   * 
   * [getInfo]
   */
  Future<Window> getCurrent([Map getInfo]) {
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
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
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
    _windows.callMethod('getLastFocused', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets all windows.
   * 
   * [getInfo]
   */
  Future<List<Window>> getAll([Map getInfo]) {
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter<List<Window>>.oneArg((e) => listify(e, _createWindow));
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
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
    _windows.callMethod('create', [jsify(createData), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties of a window. Specify only the properties that you
   * want to change; unspecified properties will be left unchanged.
   */
  Future<Window> update(int windowId, Map updateInfo) {
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Window>.oneArg(_createWindow);
    _windows.callMethod('update', [windowId, jsify(updateInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Removes (closes) a window, and all the tabs inside it.
   */
  Future remove(int windowId) {
    if (_windows == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _windows.callMethod('remove', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a window is created.
   */
  Stream<Window> get onCreated => _onCreated.stream;

  final ChromeStreamController<Window> _onCreated =
      new ChromeStreamController<Window>.oneArg(_windows, 'onCreated', _createWindow);

  /**
   * Fired when a window is removed (closed).
   */
  Stream<int> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<int> _onRemoved =
      new ChromeStreamController<int>.oneArg(_windows, 'onRemoved', selfConverter);

  /**
   * Fired when the currently focused window changes. Will be
   * chrome.windows.WINDOW_ID_NONE if all chrome windows have lost focus. Note:
   * On some Linux window managers, WINDOW_ID_NONE will always be sent
   * immediately preceding a switch from one chrome window to another.
   */
  Stream<int> get onFocusChanged => _onFocusChanged.stream;

  final ChromeStreamController<int> _onFocusChanged =
      new ChromeStreamController<int>.oneArg(_windows, 'onFocusChanged', selfConverter);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.windows' is not available");
  }
}

class Window extends ChromeObject {
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
  Window.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the window. Window IDs are unique within a browser session. Under
   * some circumstances a Window may not be assigned an ID, for example when
   * querying windows using the [sessions] API, in which case a session ID may
   * be present.
   */
  int get id => jsProxy['id'];
  set id(int value) => jsProxy['id'] = value;

  /**
   * Whether the window is currently the focused window.
   */
  bool get focused => jsProxy['focused'];
  set focused(bool value) => jsProxy['focused'] = value;

  /**
   * The offset of the window from the top edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned top property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get top => jsProxy['top'];
  set top(int value) => jsProxy['top'] = value;

  /**
   * The offset of the window from the left edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned left property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get left => jsProxy['left'];
  set left(int value) => jsProxy['left'] = value;

  /**
   * The width of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned width property, for example when
   * querying closed windows from the [sessions] API.
   */
  int get width => jsProxy['width'];
  set width(int value) => jsProxy['width'] = value;

  /**
   * The height of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned height property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get height => jsProxy['height'];
  set height(int value) => jsProxy['height'] = value;

  /**
   * Array of [tabs.Tab] objects representing the current tabs in the window.
   */
  List<Tab> get tabs => listify(jsProxy['tabs'], _createTab);
  set tabs(List<Tab> value) => jsProxy['tabs'] = jsify(value);

  /**
   * Whether the window is incognito.
   */
  bool get incognito => jsProxy['incognito'];
  set incognito(bool value) => jsProxy['incognito'] = value;

  /**
   * The type of browser window this is. Under some circumstances a Window may
   * not be assigned type property, for example when querying closed windows
   * from the [sessions] API.
   * enum of `normal`, `popup`, `panel`, `app`
   */
  String get type => jsProxy['type'];
  set type(String value) => jsProxy['type'] = value;

  /**
   * The state of this browser window. Under some circumstances a Window may not
   * be assigned state property, for example when querying closed windows from
   * the [sessions] API.
   * enum of `normal`, `minimized`, `maximized`, `fullscreen`
   */
  String get state => jsProxy['state'];
  set state(String value) => jsProxy['state'] = value;

  /**
   * Whether the window is set to be always on top.
   */
  bool get alwaysOnTop => jsProxy['alwaysOnTop'];
  set alwaysOnTop(bool value) => jsProxy['alwaysOnTop'] = value;

  /**
   * The session ID used to uniquely identify a Window obtained from the
   * [sessions] API.
   */
  String get sessionId => jsProxy['sessionId'];
  set sessionId(String value) => jsProxy['sessionId'] = value;
}

Window _createWindow(JsObject jsProxy) => jsProxy == null ? null : new Window.fromProxy(jsProxy);
Tab _createTab(JsObject jsProxy) => jsProxy == null ? null : new Tab.fromProxy(jsProxy);
