/* This file has been generated from identity.idl - do not edit */

library chrome.identity;

import '../src/common.dart';

/// Accessor for the `chrome.identity` namespace.
final ChromeIdentity identity = new ChromeIdentity._();

class ChromeIdentity {
  static final JsObject _identity = context['chrome']['identity'];

  ChromeIdentity._();

  Future<String> getAuthToken([TokenDetails details]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _identity.callMethod('getAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future removeCachedAuthToken(InvalidTokenDetails details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('removeCachedAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future<String> launchWebAuthFlow(WebAuthFlowDetails details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _identity.callMethod('launchWebAuthFlow', [details, completer.callback]);
    return completer.future;
  }
}

class TokenDetails extends ChromeObject {
  static TokenDetails create(JsObject proxy) => proxy == null ? null : new TokenDetails.fromProxy(proxy);

  TokenDetails({bool interactive}) {
    if (interactive != null) this.interactive = interactive;
  }

  TokenDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get interactive => proxy['interactive'];
  set interactive(bool value) => proxy['interactive'] = value;
}

class InvalidTokenDetails extends ChromeObject {
  static InvalidTokenDetails create(JsObject proxy) => proxy == null ? null : new InvalidTokenDetails.fromProxy(proxy);

  InvalidTokenDetails({String token}) {
    if (token != null) this.token = token;
  }

  InvalidTokenDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get token => proxy['token'];
  set token(String value) => proxy['token'] = value;
}

class WebAuthFlowDetails extends ChromeObject {
  static WebAuthFlowDetails create(JsObject proxy) => proxy == null ? null : new WebAuthFlowDetails.fromProxy(proxy);

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
