/* This file has been generated from app_runtime.idl - do not edit */

/**
 * 
 */
library chrome.app_runtime;

import '../src/common.dart';

/// Accessor for the `chrome.app.runtime` namespace.
final ChromeAppRuntime app_runtime = new ChromeAppRuntime._();

class ChromeAppRuntime {
  static final JsObject _app_runtime = context['chrome']['app']['runtime'];

  ChromeAppRuntime._();

  Stream<LaunchData> get onLaunched => _onLaunched.stream;

  final ChromeStreamController<LaunchData> _onLaunched =
      new ChromeStreamController<LaunchData>.oneArg(_app_runtime['onLaunched'], selfConverter);

  Stream get onRestarted => _onRestarted.stream;

  final ChromeStreamController _onRestarted =
      new ChromeStreamController.noArgs(_app_runtime['onRestarted']);
}

class LaunchItem extends ChromeObject {
  static LaunchItem create(JsObject proxy) => new LaunchItem(proxy);

  LaunchItem(JsObject proxy): super(proxy);
}

class LaunchData extends ChromeObject {
  static LaunchData create(JsObject proxy) => new LaunchData(proxy);

  LaunchData(JsObject proxy): super(proxy);
}
