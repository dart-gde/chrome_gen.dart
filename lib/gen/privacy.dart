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

/**
 * Accessor for the `chrome.privacy` namespace.
 */
final ChromePrivacy privacy = new ChromePrivacy._();

class ChromePrivacy extends ChromeApi {
  static final JsObject _privacy = chrome['privacy'];

  ChromePrivacy._();

  bool get available => _privacy != null;

  /**
   * Settings that influence Chrome's handling of network connections in
   * general.
   */
  NetworkPrivacy get network => _createNetworkPrivacy(_privacy['network']);

  /**
   * Settings that enable or disable features that require third-party network
   * services provided by Google and your default search provider.
   */
  ServicesPrivacy get services => _createServicesPrivacy(_privacy['services']);

  /**
   * Settings that determine what information Chrome makes available to
   * websites.
   */
  WebsitesPrivacy get websites => _createWebsitesPrivacy(_privacy['websites']);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.privacy' is not available");
  }
}

class NetworkPrivacy extends ChromeObject {
  NetworkPrivacy();
  NetworkPrivacy.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * If enabled, Chrome attempts to speed up your web browsing experience by
   * pre-resolving DNS entries, prerendering sites (`&lt;link rel='prefetch'
   * ...&gt;`), and preemptively opening TCP and SSL connections to servers.
   * This preference's value is a boolean, defaulting to `true`.
   */
  ChromeSetting get networkPredictionEnabled => _createChromeSetting(proxy['networkPredictionEnabled']);
}

class ServicesPrivacy extends ChromeObject {
  ServicesPrivacy();
  ServicesPrivacy.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * If enabled, Chrome uses a web service to help resolve navigation errors.
   * This preference's value is a boolean, defaulting to `true`.
   */
  ChromeSetting get alternateErrorPagesEnabled => _createChromeSetting(proxy['alternateErrorPagesEnabled']);

  /**
   * If enabled, Chrome offers to automatically fill in forms. This preference's
   * value is a boolean, defaulting to `true`.
   */
  ChromeSetting get autofillEnabled => _createChromeSetting(proxy['autofillEnabled']);

  /**
   * If enabled, Chrome does its best to protect you from phishing and malware.
   * This preference's value is a boolean, defaulting to `true`.
   */
  ChromeSetting get safeBrowsingEnabled => _createChromeSetting(proxy['safeBrowsingEnabled']);

  /**
   * If enabled, Chrome sends the text you type into the Omnibox to your default
   * search engine, which provides predictions of websites and searches that are
   * likely completions of what you've typed so far. This preference's value is
   * a boolean, defaulting to `true`.
   */
  ChromeSetting get searchSuggestEnabled => _createChromeSetting(proxy['searchSuggestEnabled']);

  /**
   * If enabled, Chrome uses a web service to help correct spelling errors. This
   * preference's value is a boolean, defaulting to `false`.
   */
  ChromeSetting get spellingServiceEnabled => _createChromeSetting(proxy['spellingServiceEnabled']);

  /**
   * If enabled, Chrome offers to translate pages that aren't in a language you
   * read. This preference's value is a boolean, defaulting to `true`.
   */
  ChromeSetting get translationServiceEnabled => _createChromeSetting(proxy['translationServiceEnabled']);
}

class WebsitesPrivacy extends ChromeObject {
  WebsitesPrivacy();
  WebsitesPrivacy.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * If disabled, Chrome blocks third-party sites from setting cookies. The
   * value of this preference is of type boolean, and the default value is
   * `true`.
   */
  ChromeSetting get thirdPartyCookiesAllowed => _createChromeSetting(proxy['thirdPartyCookiesAllowed']);

  /**
   * If enabled, Chrome sends auditing pings when requested by a website (`&lt;a
   * ping&gt;`). The value of this preference is of type boolean, and the
   * default value is `true`.
   */
  ChromeSetting get hyperlinkAuditingEnabled => _createChromeSetting(proxy['hyperlinkAuditingEnabled']);

  /**
   * If enabled, Chrome sends `referer` headers with your requests. Yes, the
   * name of this preference doesn't match the misspelled header. No, we're not
   * going to change it. The value of this preference is of type boolean, and
   * the default value is `true`.
   */
  ChromeSetting get referrersEnabled => _createChromeSetting(proxy['referrersEnabled']);

  /**
   * *Available on Windows and ChromeOS only*: If enabled, Chrome provides a
   * unique ID to plugins in order to run protected content. The value of this
   * preference is of type boolean, and the default value is `true`.
   */
  ChromeSetting get protectedContentEnabled => _createChromeSetting(proxy['protectedContentEnabled']);
}

NetworkPrivacy _createNetworkPrivacy(JsObject proxy) => proxy == null ? null : new NetworkPrivacy.fromProxy(proxy);
ServicesPrivacy _createServicesPrivacy(JsObject proxy) => proxy == null ? null : new ServicesPrivacy.fromProxy(proxy);
WebsitesPrivacy _createWebsitesPrivacy(JsObject proxy) => proxy == null ? null : new WebsitesPrivacy.fromProxy(proxy);
ChromeSetting _createChromeSetting(JsObject proxy) => proxy == null ? null : new ChromeSetting.fromProxy(proxy);
