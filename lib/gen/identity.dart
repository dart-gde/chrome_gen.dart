/* This file has been generated from identity.idl - do not edit */

/**
 * 
 */
library chrome.identity;

import '../src/common.dart';

/// Accessor for the `chrome.identity` namespace.
final ChromeIdentity identity = new ChromeIdentity._();

class ChromeIdentity {
  static final JsObject _identity = context['chrome']['identity'];

  ChromeIdentity._();

  Future getAuthToken([TokenDetails details]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('getAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future removeCachedAuthToken(InvalidTokenDetails details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('removeCachedAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future launchWebAuthFlow(WebAuthFlowDetails details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('launchWebAuthFlow', [details, completer.callback]);
    return completer.future;
  }
}

class TokenDetails extends ChromeObject {
  static TokenDetails create(JsObject proxy) => new TokenDetails(proxy);

  TokenDetails(JsObject proxy): super(proxy);
}

class InvalidTokenDetails extends ChromeObject {
  static InvalidTokenDetails create(JsObject proxy) => new InvalidTokenDetails(proxy);

  InvalidTokenDetails(JsObject proxy): super(proxy);
}

class WebAuthFlowDetails extends ChromeObject {
  static WebAuthFlowDetails create(JsObject proxy) => new WebAuthFlowDetails(proxy);

  WebAuthFlowDetails(JsObject proxy): super(proxy);
}
