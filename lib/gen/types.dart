/* This file has been generated from types.json - do not edit */

/**
 * The `chrome.types` API contains type declarations for Chrome.
 */
library chrome.types;

import '../src/common.dart';

/// Accessor for the `chrome.types` namespace.
final ChromeTypes types = new ChromeTypes._();

class ChromeTypes {
  static final JsObject _types = context['chrome']['types'];

  ChromeTypes._();
}

/**
 * An interface that allows access to a Chrome browser setting. See
 * [proxy.settings] for an example.
 */
class ChromeSetting extends ChromeObject {
  static ChromeSetting create(JsObject proxy) => proxy == null ? null : new ChromeSetting.fromProxy(proxy);

  ChromeSetting();

  ChromeSetting.fromProxy(JsObject proxy): super.fromProxy(proxy);
}
