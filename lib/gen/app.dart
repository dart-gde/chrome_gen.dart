/* This file has been generated - do not edit */

library chrome.app;

import '../src/common.dart';

final ChromeApp app = new ChromeApp._();

class ChromeApp {
  /// Accessor for the `chrome.app.runtime` namespace.
  final ChromeAppRuntime runtime = ChromeAppRuntime._app_runtime == null ? apiNotAvailable('chrome.app.runtime') : new ChromeAppRuntime._();

  /// Accessor for the `chrome.app.window` namespace.
  final ChromeAppWindow window = ChromeAppWindow._app_window == null ? apiNotAvailable('chrome.app.window') : new ChromeAppWindow._();

  ChromeApp._();
}

class ChromeAppRuntime {
  static final JsObject _app_runtime = chrome['app']['runtime'];

  ChromeAppRuntime._();

  Stream<LaunchData> get onLaunched => _onLaunched.stream;

  final ChromeStreamController<LaunchData> _onLaunched =
      new ChromeStreamController<LaunchData>.oneArg(_app_runtime['onLaunched'], _createLaunchData);

  Stream get onRestarted => _onRestarted.stream;

  final ChromeStreamController _onRestarted =
      new ChromeStreamController.noArgs(_app_runtime['onRestarted']);
}

class LaunchItem extends ChromeObject {
  LaunchItem({var entry, String type}) {
    if (entry != null) this.entry = entry;
    if (type != null) this.type = type;
  }
  LaunchItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get entry => proxy['entry'];
  set entry(var value) => proxy['entry'] = jsify(value);

  String get type => proxy['type'];
  set type(String value) => proxy['type'] = value;
}

class LaunchData extends ChromeObject {
  LaunchData({String id, LaunchItem items, String url, String referrerUrl, bool isKioskSession}) {
    if (id != null) this.id = id;
    if (items != null) this.items = items;
    if (url != null) this.url = url;
    if (referrerUrl != null) this.referrerUrl = referrerUrl;
    if (isKioskSession != null) this.isKioskSession = isKioskSession;
  }
  LaunchData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  LaunchItem get items => _createLaunchItem(proxy['items']);
  set items(LaunchItem value) => proxy['items'] = jsify(value);

  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  String get referrerUrl => proxy['referrerUrl'];
  set referrerUrl(String value) => proxy['referrerUrl'] = value;

  bool get isKioskSession => proxy['isKioskSession'];
  set isKioskSession(bool value) => proxy['isKioskSession'] = value;
}

LaunchData _createLaunchData(JsObject proxy) => proxy == null ? null : new LaunchData.fromProxy(proxy);
LaunchItem _createLaunchItem(JsObject proxy) => proxy == null ? null : new LaunchItem.fromProxy(proxy);
class ChromeAppWindow {
  static final JsObject _app_window = chrome['app']['window'];

  ChromeAppWindow._();

  /**
   * The size and position of a window can be specified in a number of different
   * ways. The most simple option is not specifying anything at all, in which
   * case a default size and platform dependent position will be used.
   * 
   * Another option is to use the bounds property, which will put the window at
   * the specified coordinates with the specified size. If the window has a
   * frame, it's total size will be the size given plus the size of the frame;
   * that is, the size in bounds is the content size, not the window size.
   * 
   * To automatically remember the positions of windows you can give them ids.
   * If a window has an id, This id is used to remember the size and position of
   * the window whenever it is moved or resized. This size and position is then
   * used instead of the specified bounds on subsequent opening of a window with
   * the same id. If you need to open a window with an id at a location other
   * than the remembered default, you can create it hidden, move it to the
   * desired location, then show it.
   * 
   * Returns:
   * Called in the creating window (parent) before the load event is called in
   * the created window (child). The parent can set fields or functions on the
   * child usable from onload. E.g. background.js:
   * 
   * `function(created_window) { created_window.contentWindow.foo = function ()
   * { }; };`
   * 
   * window.js:
   * 
   *  `window.onload = function () { foo(); }`
   */
  Future<AppWindow> create(String url, [CreateWindowOptions options]) {
    var completer = new ChromeCompleter<AppWindow>.oneArg(_createAppWindow);
    _app_window.callMethod('create', [url, jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns an [AppWindow] object for the current script context (ie JavaScript
   * 'window' object). This can also be called on a handle to a script context
   * for another page, for example: otherWindow.chrome.app.window.current().
   */
  AppWindow current() {
    return _createAppWindow(_app_window.callMethod('current'));
  }

  void initializeAppWindow(dynamic state) {
    _app_window.callMethod('initializeAppWindow', [jsify(state)]);
  }

  Stream get onBoundsChanged => _onBoundsChanged.stream;

  final ChromeStreamController _onBoundsChanged =
      new ChromeStreamController.noArgs(_app_window['onBoundsChanged']);

  Stream get onClosed => _onClosed.stream;

  final ChromeStreamController _onClosed =
      new ChromeStreamController.noArgs(_app_window['onClosed']);

  Stream get onFullscreened => _onFullscreened.stream;

  final ChromeStreamController _onFullscreened =
      new ChromeStreamController.noArgs(_app_window['onFullscreened']);

  Stream get onMaximized => _onMaximized.stream;

  final ChromeStreamController _onMaximized =
      new ChromeStreamController.noArgs(_app_window['onMaximized']);

  Stream get onMinimized => _onMinimized.stream;

  final ChromeStreamController _onMinimized =
      new ChromeStreamController.noArgs(_app_window['onMinimized']);

  Stream get onRestored => _onRestored.stream;

  final ChromeStreamController _onRestored =
      new ChromeStreamController.noArgs(_app_window['onRestored']);
}

/**
 * State of a window: normal, fullscreen, maximized, minimized.
 */
class State extends ChromeEnum {
  static const State NORMAL = const State._('normal');
  static const State FULLSCREEN = const State._('fullscreen');
  static const State MAXIMIZED = const State._('maximized');
  static const State MINIMIZED = const State._('minimized');

  static const List<State> VALUES = const[NORMAL, FULLSCREEN, MAXIMIZED, MINIMIZED];

  const State._(String str): super(str);
}

/**
 * 'shell' is the default window type. 'panel' is managed by the OS (Currently
 * experimental, Ash only).
 */
class WindowType extends ChromeEnum {
  static const WindowType SHELL = const WindowType._('shell');
  static const WindowType PANEL = const WindowType._('panel');

  static const List<WindowType> VALUES = const[SHELL, PANEL];

  const WindowType._(String str): super(str);
}

class CreateWindowOptions extends ChromeObject {
  CreateWindowOptions({String id, int defaultWidth, int defaultHeight, int defaultLeft, int defaultTop, int width, int height, int left, int top, int minWidth, int minHeight, int maxWidth, int maxHeight, WindowType type, String frame, Bounds bounds, bool transparentBackground, State state, bool hidden, bool resizable, bool singleton, bool alwaysOnTop}) {
    if (id != null) this.id = id;
    if (defaultWidth != null) this.defaultWidth = defaultWidth;
    if (defaultHeight != null) this.defaultHeight = defaultHeight;
    if (defaultLeft != null) this.defaultLeft = defaultLeft;
    if (defaultTop != null) this.defaultTop = defaultTop;
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (left != null) this.left = left;
    if (top != null) this.top = top;
    if (minWidth != null) this.minWidth = minWidth;
    if (minHeight != null) this.minHeight = minHeight;
    if (maxWidth != null) this.maxWidth = maxWidth;
    if (maxHeight != null) this.maxHeight = maxHeight;
    if (type != null) this.type = type;
    if (frame != null) this.frame = frame;
    if (bounds != null) this.bounds = bounds;
    if (transparentBackground != null) this.transparentBackground = transparentBackground;
    if (state != null) this.state = state;
    if (hidden != null) this.hidden = hidden;
    if (resizable != null) this.resizable = resizable;
    if (singleton != null) this.singleton = singleton;
    if (alwaysOnTop != null) this.alwaysOnTop = alwaysOnTop;
  }
  CreateWindowOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  int get defaultWidth => proxy['defaultWidth'];
  set defaultWidth(int value) => proxy['defaultWidth'] = value;

  int get defaultHeight => proxy['defaultHeight'];
  set defaultHeight(int value) => proxy['defaultHeight'] = value;

  int get defaultLeft => proxy['defaultLeft'];
  set defaultLeft(int value) => proxy['defaultLeft'] = value;

  int get defaultTop => proxy['defaultTop'];
  set defaultTop(int value) => proxy['defaultTop'] = value;

  int get width => proxy['width'];
  set width(int value) => proxy['width'] = value;

  int get height => proxy['height'];
  set height(int value) => proxy['height'] = value;

  int get left => proxy['left'];
  set left(int value) => proxy['left'] = value;

  int get top => proxy['top'];
  set top(int value) => proxy['top'] = value;

  int get minWidth => proxy['minWidth'];
  set minWidth(int value) => proxy['minWidth'] = value;

  int get minHeight => proxy['minHeight'];
  set minHeight(int value) => proxy['minHeight'] = value;

  int get maxWidth => proxy['maxWidth'];
  set maxWidth(int value) => proxy['maxWidth'] = value;

  int get maxHeight => proxy['maxHeight'];
  set maxHeight(int value) => proxy['maxHeight'] = value;

  WindowType get type => _createWindowType(proxy['type']);
  set type(WindowType value) => proxy['type'] = jsify(value);

  String get frame => proxy['frame'];
  set frame(String value) => proxy['frame'] = value;

  Bounds get bounds => _createBounds(proxy['bounds']);
  set bounds(Bounds value) => proxy['bounds'] = jsify(value);

  bool get transparentBackground => proxy['transparentBackground'];
  set transparentBackground(bool value) => proxy['transparentBackground'] = value;

  State get state => _createState(proxy['state']);
  set state(State value) => proxy['state'] = jsify(value);

  bool get hidden => proxy['hidden'];
  set hidden(bool value) => proxy['hidden'] = value;

  bool get resizable => proxy['resizable'];
  set resizable(bool value) => proxy['resizable'] = value;

  bool get singleton => proxy['singleton'];
  set singleton(bool value) => proxy['singleton'] = value;

  bool get alwaysOnTop => proxy['alwaysOnTop'];
  set alwaysOnTop(bool value) => proxy['alwaysOnTop'] = value;
}

class AppWindow extends ChromeObject {
  AppWindow({var contentWindow}) {
    if (contentWindow != null) this.contentWindow = contentWindow;
  }
  AppWindow.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get contentWindow => proxy['contentWindow'];
  set contentWindow(var value) => proxy['contentWindow'] = jsify(value);

  /**
   * Focus the window.
   */
  void focus() {
    proxy.callMethod('focus');
  }

  /**
   * Fullscreens the window.
   */
  void fullscreen() {
    proxy.callMethod('fullscreen');
  }

  /**
   * Is the window fullscreen?
   */
  bool isFullscreen() {
    return proxy.callMethod('isFullscreen');
  }

  /**
   * Minimize the window.
   */
  void minimize() {
    proxy.callMethod('minimize');
  }

  /**
   * Is the window minimized?
   */
  bool isMinimized() {
    return proxy.callMethod('isMinimized');
  }

  /**
   * Maximize the window.
   */
  void maximize() {
    proxy.callMethod('maximize');
  }

  /**
   * Is the window maximized?
   */
  bool isMaximized() {
    return proxy.callMethod('isMaximized');
  }

  /**
   * Restore the window, exiting a maximized, minimized, or fullscreen state.
   */
  void restore() {
    proxy.callMethod('restore');
  }

  /**
   * Move the window to the position ([left], [top]).
   */
  void moveTo(int left, int top) {
    proxy.callMethod('moveTo', [left, top]);
  }

  /**
   * Resize the window to [width]x[height] pixels in size.
   */
  void resizeTo(int width, int height) {
    proxy.callMethod('resizeTo', [width, height]);
  }

  /**
   * Draw attention to the window.
   */
  void drawAttention() {
    proxy.callMethod('drawAttention');
  }

  /**
   * Clear attention to the window.
   */
  void clearAttention() {
    proxy.callMethod('clearAttention');
  }

  /**
   * Close the window.
   */
  void close() {
    proxy.callMethod('close');
  }

  /**
   * Show the window. Does nothing if the window is already visible.
   */
  void show() {
    proxy.callMethod('show');
  }

  /**
   * Hide the window. Does nothing if the window is already hidden.
   */
  void hide() {
    proxy.callMethod('hide');
  }

  /**
   * Get the window's bounds as a [Bounds] object.
   */
  Bounds getBounds() {
    return _createBounds(proxy.callMethod('getBounds'));
  }

  /**
   * Set the window's bounds.
   */
  void setBounds(Bounds bounds) {
    proxy.callMethod('setBounds', [jsify(bounds)]);
  }

  /**
   * Set the app icon for the window (experimental). Currently this is only
   * being implemented on Ash. todo(stevenjb): Investigate implementing this on
   * Windows and OSX.
   */
  void setIcon(String icon_url) {
    proxy.callMethod('setIcon', [icon_url]);
  }

  /**
   * Is the window always on top? Currently available in the Dev channel only.
   */
  bool isAlwaysOnTop() {
    return proxy.callMethod('isAlwaysOnTop');
  }

  /**
   * Set whether the window should stay above most other windows. Currently
   * available in the Dev channel only.
   */
  void setAlwaysOnTop(bool always_on_top) {
    proxy.callMethod('setAlwaysOnTop', [always_on_top]);
  }
}

AppWindow _createAppWindow(JsObject proxy) => proxy == null ? null : new AppWindow.fromProxy(proxy);
WindowType _createWindowType(String value) => WindowType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
Bounds _createBounds(JsObject proxy) => proxy == null ? null : new Bounds.fromProxy(proxy);
State _createState(String value) => State.VALUES.singleWhere((ChromeEnum e) => e.value == value);
