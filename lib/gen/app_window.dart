/* This file has been generated from app_window.idl - do not edit */

library chrome.app_window;

import '../src/common.dart';

/// Accessor for the `chrome.app.window` namespace.
final ChromeAppWindow app_window = new ChromeAppWindow._();

class ChromeAppWindow {
  static final JsObject _app_window = context['chrome']['app']['window'];

  ChromeAppWindow._();

  Future<dynamic> create(String url, [CreateWindowOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _app_window.callMethod('create', [url, options, completer.callback]);
    return completer.future;
  }

  AppWindow current() {
    return AppWindow.create(_app_window.callMethod('current'));
  }

  void initializeAppWindow(dynamic state) {
    _app_window.callMethod('initializeAppWindow', [state]);
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

class State extends ChromeEnum {
  static const State NORMAL = const State._('normal');
  static const State FULLSCREEN = const State._('fullscreen');
  static const State MAXIMIZED = const State._('maximized');
  static const State MINIMIZED = const State._('minimized');

  static const List<State> VALUES = const[NORMAL, FULLSCREEN, MAXIMIZED, MINIMIZED];

  static State create(String str) =>
      VALUES.singleWhere((ChromeEnum e) => e.value == str);

  const State._(String str): super(str);
}

class WindowType extends ChromeEnum {
  static const WindowType SHELL = const WindowType._('shell');
  static const WindowType PANEL = const WindowType._('panel');

  static const List<WindowType> VALUES = const[SHELL, PANEL];

  static WindowType create(String str) =>
      VALUES.singleWhere((ChromeEnum e) => e.value == str);

  const WindowType._(String str): super(str);
}

class CreateWindowOptions extends ChromeObject {
  static CreateWindowOptions create(JsObject proxy) => proxy == null ? null : new CreateWindowOptions.fromProxy(proxy);

  CreateWindowOptions({String id, int defaultWidth, int defaultHeight, int defaultLeft, int defaultTop, int width, int height, int left, int top, int minWidth, int minHeight, int maxWidth, int maxHeight, WindowType type, String frame, Bounds bounds, bool transparentBackground, State state, bool hidden, bool resizable, bool singleton}) {
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

  WindowType get type => WindowType.create(proxy['type']);
  set type(WindowType value) => proxy['type'] = value;

  String get frame => proxy['frame'];
  set frame(String value) => proxy['frame'] = value;

  Bounds get bounds => Bounds.create(proxy['bounds']);
  set bounds(Bounds value) => proxy['bounds'] = value;

  bool get transparentBackground => proxy['transparentBackground'];
  set transparentBackground(bool value) => proxy['transparentBackground'] = value;

  State get state => State.create(proxy['state']);
  set state(State value) => proxy['state'] = value;

  bool get hidden => proxy['hidden'];
  set hidden(bool value) => proxy['hidden'] = value;

  bool get resizable => proxy['resizable'];
  set resizable(bool value) => proxy['resizable'] = value;

  bool get singleton => proxy['singleton'];
  set singleton(bool value) => proxy['singleton'] = value;
}

class AppWindow extends ChromeObject {
  static AppWindow create(JsObject proxy) => proxy == null ? null : new AppWindow.fromProxy(proxy);

  AppWindow({var contentWindow}) {
    if (contentWindow != null) this.contentWindow = contentWindow;
  }

  AppWindow.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get contentWindow => proxy['contentWindow'];
  set contentWindow(var value) => proxy['contentWindow'] = value;

  void focus() {
    proxy.callMethod('focus');
  }

  void fullscreen() {
    proxy.callMethod('fullscreen');
  }

  bool isFullscreen() {
    return proxy.callMethod('isFullscreen');
  }

  void minimize() {
    proxy.callMethod('minimize');
  }

  bool isMinimized() {
    return proxy.callMethod('isMinimized');
  }

  void maximize() {
    proxy.callMethod('maximize');
  }

  bool isMaximized() {
    return proxy.callMethod('isMaximized');
  }

  void restore() {
    proxy.callMethod('restore');
  }

  void moveTo(int left, int top) {
    proxy.callMethod('moveTo', [left, top]);
  }

  void resizeTo(int width, int height) {
    proxy.callMethod('resizeTo', [width, height]);
  }

  void drawAttention() {
    proxy.callMethod('drawAttention');
  }

  void clearAttention() {
    proxy.callMethod('clearAttention');
  }

  void close() {
    proxy.callMethod('close');
  }

  void show() {
    proxy.callMethod('show');
  }

  void hide() {
    proxy.callMethod('hide');
  }

  Bounds getBounds() {
    return Bounds.create(proxy.callMethod('getBounds'));
  }

  void setBounds(Bounds bounds) {
    proxy.callMethod('setBounds', [bounds]);
  }

  void setIcon(String icon_url) {
    proxy.callMethod('setIcon', [icon_url]);
  }
}
