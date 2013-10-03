/* This file has been generated from identity.idl - do not edit */

library chrome.identity;

import '../src/common.dart';

/// Accessor for the `chrome.identity` namespace.
final ChromeIdentity identity = new ChromeIdentity._();

class ChromeIdentity {
  static final JsObject _identity = context['chrome']['identity'];

  ChromeIdentity._();

  Future<String> getAuthToken([TokenDetails details]) {
    var completer = new ChromeCompleter<String>.oneArg();
    _identity.callMethod('getAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future removeCachedAuthToken(InvalidTokenDetails details) {
    var completer = new ChromeCompleter.noArgs();
    _identity.callMethod('removeCachedAuthToken', [details, completer.callback]);
    return completer.future;
  }

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
