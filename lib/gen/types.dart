/* This file has been generated from types.json - do not edit */

/**
 * The `chrome.types` API contains type declarations for Chrome.
 */
library chrome.types;

import '../src/common.dart';

/**
 * Accessor for the `chrome.types` namespace.
 */
final ChromeTypes types = new ChromeTypes._();

class ChromeTypes extends ChromeApi {
  static final JsObject _types = chrome['types'];

  ChromeTypes._();

  bool get available => _types != null;

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.types' is not available");
  }
}

/**
 * An interface that allows access to a Chrome browser setting. See
 * [proxy.settings] for an example.
 */
class ChromeSetting extends ChromeObject {
  ChromeSetting();
  ChromeSetting.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Gets the value of a setting.
   * 
   * [details] Which setting to consider.
   * 
   * Returns:
   * Details of the currently effective value.
   */
  Future<Map> get(typesGetParams details) {
    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    jsProxy.callMethod('get', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the value of a setting.
   * 
   * [details] Which setting to change.
   */
  Future set(typesSetParams details) {
    var completer = new ChromeCompleter.noArgs();
    jsProxy.callMethod('set', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the setting, restoring any default value.
   * 
   * [details] Which setting to clear.
   */
  Future clear(typesClearParams details) {
    var completer = new ChromeCompleter.noArgs();
    jsProxy.callMethod('clear', [jsify(details), completer.callback]);
    return completer.future;
  }
}

class typesGetParams extends ChromeObject {
  typesGetParams({bool incognito}) {
    if (incognito != null) this.incognito = incognito;
  }
  typesGetParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether to return the value that applies to the incognito session (default
   * false).
   */
  bool get incognito => jsProxy['incognito'];
  set incognito(bool value) => jsProxy['incognito'] = value;
}

class typesSetParams extends ChromeObject {
  typesSetParams({var value, String scope}) {
    if (value != null) this.value = value;
    if (scope != null) this.scope = scope;
  }
  typesSetParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The value of the setting. <br/>Note that every setting has a specific value
   * type, which is described together with the setting. An extension should
   * _not_ set a value of a different type.
   */
  dynamic get value => jsProxy['value'];
  set value(var value) => jsProxy['value'] = jsify(value);

  /**
   * Where to set the setting (default: regular). One of<ul><li>[regular]:
   * setting for the regular profile (which is inherited by the incognito
   * profile if not overridden elsewhere),</li><li>[regular_only]: setting for
   * the regular profile only (not inherited by the incognito
   * profile),</li><li>[incognito_persistent]: setting for the incognito profile
   * that survives browser restarts (overrides regular
   * preferences),</li><li>[incognito_session_only]: setting for the incognito
   * profile that can only be set during an incognito session and is deleted
   * when the incognito session ends (overrides regular and incognito_persistent
   * preferences).</li></ul>
   * enum of `regular`, `regular_only`, `incognito_persistent`,
   * `incognito_session_only`
   */
  String get scope => jsProxy['scope'];
  set scope(String value) => jsProxy['scope'] = value;
}

class typesClearParams extends ChromeObject {
  typesClearParams({String scope}) {
    if (scope != null) this.scope = scope;
  }
  typesClearParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Where to clear the setting (default: regular). One of<ul><li>[regular]:
   * setting for the regular profile (which is inherited by the incognito
   * profile if not overridden elsewhere),</li><li>[regular_only]: setting for
   * the regular profile only (not inherited by the incognito
   * profile),</li><li>[incognito_persistent]: setting for the incognito profile
   * that survives browser restarts (overrides regular
   * preferences),</li><li>[incognito_session_only]: setting for the incognito
   * profile that can only be set during an incognito session and is deleted
   * when the incognito session ends (overrides regular and incognito_persistent
   * preferences).</li></ul>
   * enum of `regular`, `regular_only`, `incognito_persistent`,
   * `incognito_session_only`
   */
  String get scope => jsProxy['scope'];
  set scope(String value) => jsProxy['scope'] = value;
}
