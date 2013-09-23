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
final ChromePrivacy privacy = new ChromePrivacy._();

class ChromePrivacy {
  static final JsObject _privacy = context['chrome']['privacy'];

  ChromePrivacy._();

  /**
   * Settings that influence Chrome's handling of network connections in
   * general.
   * 
   * `networkPredictionEnabled` If enabled, Chrome attempts to speed up your web
   * browsing experience by pre-resolving DNS entries, prerendering sites
   * (`&lt;link rel='prefetch' ...&gt;`), and preemptively opening TCP and SSL
   * connections to servers.  This preference's value is a boolean, defaulting
   * to `true`.
   */
  Map get network => mapify(_privacy['network']);

  /**
   * Settings that enable or disable features that require third-party network
   * services provided by Google and your default search provider.
   * 
   * `alternateErrorPagesEnabled` If enabled, Chrome uses a web service to help
   * resolve navigation errors. This preference's value is a boolean, defaulting
   * to `true`.
   * 
   * `autofillEnabled` If enabled, Chrome offers to automatically fill in forms.
   * This preference's value is a boolean, defaulting to `true`.
   * 
   * `safeBrowsingEnabled` If enabled, Chrome does its best to protect you from
   * phishing and malware. This preference's value is a boolean, defaulting to
   * `true`.
   * 
   * `searchSuggestEnabled` If enabled, Chrome sends the text you type into the
   * Omnibox to your default search engine, which provides predictions of
   * websites and searches that are likely completions of what you've typed so
   * far. This preference's value is a boolean, defaulting to `true`.
   * 
   * `spellingServiceEnabled` If enabled, Chrome uses a web service to help
   * correct spelling errors. This preference's value is a boolean, defaulting
   * to `false`.
   * 
   * `translationServiceEnabled` If enabled, Chrome offers to translate pages
   * that aren't in a language you read. This preference's value is a boolean,
   * defaulting to `true`.
   */
  Map get services => mapify(_privacy['services']);

  /**
   * Settings that determine what information Chrome makes available to
   * websites.
   * 
   * `thirdPartyCookiesAllowed` If disabled, Chrome blocks third-party sites
   * from setting cookies. The value of this preference is of type boolean, and
   * the default value is `true`.
   * 
   * `hyperlinkAuditingEnabled` If enabled, Chrome sends auditing pings when
   * requested by a website (`&lt;a ping&gt;`). The value of this preference is
   * of type boolean, and the default value is `true`.
   * 
   * `referrersEnabled` If enabled, Chrome sends `referer` headers with your
   * requests. Yes, the name of this preference doesn't match the misspelled
   * header. No, we're not going to change it. The value of this preference is
   * of type boolean, and the default value is `true`.
   * 
   * `protectedContentEnabled` *Available on Windows and ChromeOS only*: If
   * enabled, Chrome provides a unique ID to plugins in order to run protected
   * content. The value of this preference is of type boolean, and the default
   * value is `true`.
   */
  Map get websites => mapify(_privacy['websites']);
}
