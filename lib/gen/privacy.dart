/* This file has been generated from privacy.json - do not edit */

/**
 * Use the `chrome.privacy` API to control usage of the features in Chrome that
 * can affect a user's privacy. This API relies on the [ChromeSetting prototype
 * of the type API](types.html#ChromeSetting) for getting and setting Chrome's
 * configuration.
 */
library chrome.privacy;

import 'types.dart';
import '../src/common.dart';

/// Accessor for the `chrome.privacy` namespace.
final ChromePrivacy privacy = (ChromePrivacy._privacy == null ? null : new ChromePrivacy._());

class ChromePrivacy {
  static final JsObject _privacy = context['chrome']['privacy'];

  ChromePrivacy._();

  /**
   * Settings that influence Chrome's handling of network connections in
   * general.
   */
  Map get network => mapify(_privacy['network']);

  /**
   * Settings that enable or disable features that require third-party network
   * services provided by Google and your default search provider.
   */
  Map get services => mapify(_privacy['services']);

  /**
   * Settings that determine what information Chrome makes available to
   * websites.
   */
  Map get websites => mapify(_privacy['websites']);
}
