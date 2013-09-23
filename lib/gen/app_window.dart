/* This file has been generated from app_window.idl - do not edit */

library chrome.app_window;

import '../src/common.dart';

/// Accessor for the `chrome.app.window` namespace.
final ChromeAppWindow app_window = new ChromeAppWindow._();

class ChromeAppWindow {
  static final JsObject _app_window = context['chrome']['app']['window'];

  ChromeAppWindow._();

  Future create(String url, [CreateWindowOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _app_window.callMethod('create', [url, options, completer.callback]);
    return completer.future;
  }

  void current() {
    _app_window.callMethod('current');
  }

  void initializeAppWindow(var state) {
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

class Bounds extends ChromeObject {
  static Bounds create(JsObject proxy) => proxy == null ? null : new Bounds(proxy);

  Bounds(JsObject proxy): super(proxy);
}

class CreateWindowOptions extends ChromeObject {
  static CreateWindowOptions create(JsObject proxy) => proxy == null ? null : new CreateWindowOptions(proxy);

  CreateWindowOptions(JsObject proxy): super(proxy);
}

class AppWindow extends ChromeObject {
  static AppWindow create(JsObject proxy) => proxy == null ? null : new AppWindow(proxy);

  AppWindow(JsObject proxy): super(proxy);
}
