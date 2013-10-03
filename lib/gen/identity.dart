/* This file has been generated from identity.idl - do not edit */

library chrome.identity;

import '../src/common.dart';

/// Accessor for the `chrome.identity` namespace.
final ChromeIdentity identity = (ChromeIdentity._identity == null ? null : new ChromeIdentity._());

class ChromeIdentity {
  static final JsObject _identity = context['chrome']['identity'];

  ChromeIdentity._();

  bool get available => _identity != null;

  /**
   * Gets an OAuth2 access token using the client ID and scopes specified in the
   * <a href="app_identity.html#update_manifest">`oauth2` section of
   * manifest.json</a>.
   * The Identity API caches access tokens in memory, so it's ok to call
   * `getAuthToken` any time a token is required. The token cache automatically
   * handles expiration.
   * 
   * [details] : Token options.
   * [callback] : Called with an OAuth2 access token as specified by the
   * manifest, or undefined if there was an error.
   */
  Future<String> getAuthToken([TokenDetails details]) {
    var completer = new ChromeCompleter<String>.oneArg();
    _identity.callMethod('getAuthToken', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Removes an OAuth2 access token from the Identity API's token cache.
   * If an access token is discovered to be invalid, it should be passed to
   * removeCachedAuthToken to remove it from the cache. The app may then
   * retrieve a fresh token with `getAuthToken`.
   * 
   * [details] : Token information.
   * [callback] : Called when the token has been removed from the cache.
   */
  Future removeCachedAuthToken(InvalidTokenDetails details) {
    var completer = new ChromeCompleter.noArgs();
    _identity.callMethod('removeCachedAuthToken', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Starts an auth flow at the specified URL.
   * This method enables auth flows with non-Google identity providers by
   * launching a web view and navigating it to the first URL in the provider's
   * auth flow. When the provider redirects to a URL matching the pattern
   * `https://&lt;app-id&gt;.chromiumapp.org/`, the window will close, and the
   * final redirect URL will be passed to the [callback] function.
   * 
   * [details] : WebAuth flow options.
   * [callback] : Called with the URL redirected back to your application.
   */
  Future<String> launchWebAuthFlow(WebAuthFlowDetails details) {
    var completer = new ChromeCompleter<String>.oneArg();
    _identity.callMethod('launchWebAuthFlow', [details, completer.callback]);
    return completer.future;
  }
}

class TokenDetails extends ChromeObject {

  TokenDetails({bool interactive}) {
    if (interactive != null) this.interactive = interactive;
  }

  TokenDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get interactive => proxy['interactive'];
  set interactive(bool value) => proxy['interactive'] = value;
}

class InvalidTokenDetails extends ChromeObject {

  InvalidTokenDetails({String token}) {
    if (token != null) this.token = token;
  }

  InvalidTokenDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get token => proxy['token'];
  set token(String value) => proxy['token'] = value;
}

class WebAuthFlowDetails extends ChromeObject {

  WebAuthFlowDetails({String url, bool interactive}) {
    if (url != null) this.url = url;
    if (interactive != null) this.interactive = interactive;
  }

  WebAuthFlowDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  bool get interactive => proxy['interactive'];
  set interactive(bool value) => proxy['interactive'] = value;
}
