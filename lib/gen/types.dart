/* This file has been generated from types.json - do not edit */

/**
 * The `chrome.types` API contains type declarations for Chrome.
 */
library chrome.types;

import '../src/common.dart';

/// Accessor for the `chrome.types` namespace.
final ChromeTypes types = ChromeTypes._types == null ? apiNotAvailable('chrome.types') : new ChromeTypes._();

class ChromeTypes {
  static final JsObject _types = chrome['types'];

  ChromeTypes._();
}

/**
 * An interface that allows access to a Chrome browser setting. See
 * [proxy.settings] for an example.
 */
class ChromeSetting extends ChromeObject {
  ChromeSetting();
  ChromeSetting.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Gets the value of a setting.
   * 
   * [details] Which setting to consider.
   * 
   * Returns:
   * Details of the currently effective value.
   */
  Future<Map> get(Map details) {
    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    proxy.callMethod('get', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the value of a setting.
   * 
   * [details] Which setting to change.
   */
  Future set(Map details) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('set', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the setting, restoring any default value.
   * 
   * [details] Which setting to clear.
   */
  Future clear(Map details) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('clear', [jsify(details), completer.callback]);
    return completer.future;
  }
}
