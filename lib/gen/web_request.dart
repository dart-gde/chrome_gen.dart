/* This file has been generated from web_request.json - do not edit */

/**
 * Use the `chrome.webRequest` API to observe and analyze traffic and to
 * intercept, block, or modify requests in-flight.
 */
library chrome.webRequest;

import '../src/common.dart';

/// Accessor for the `chrome.webRequest` namespace.
final ChromeWebRequest webRequest = ChromeWebRequest._webRequest == null ? apiNotAvailable('chrome.webRequest') : new ChromeWebRequest._();

class ChromeWebRequest {
  static final JsObject _webRequest = chrome['webRequest'];

  ChromeWebRequest._();

  /**
   * The maximum number of times that `handlerBehaviorChanged` can be called per
   * 10 minute sustained interval. `handlerBehaviorChanged` is an expensive
   * function call that shouldn't be called often.
   */
  int get MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES => _webRequest['MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES'];

  /**
   * Needs to be called when the behavior of the webRequest handlers has changed
   * to prevent incorrect handling due to caching. This function call is
   * expensive. Don't call it often.
   */
  Future handlerBehaviorChanged() {
    var completer = new ChromeCompleter.noArgs();
    _webRequest.callMethod('handlerBehaviorChanged', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a request is about to occur.
   */
  Stream<Map> get onBeforeRequest => _onBeforeRequest.stream;

  final ChromeStreamController<Map> _onBeforeRequest =
      new ChromeStreamController<Map>.oneArg(_webRequest['onBeforeRequest'], mapify);

  /**
   * Fired before sending an HTTP request, once the request headers are
   * available. This may occur after a TCP connection is made to the server, but
   * before any HTTP data is sent.
   */
  Stream<Map> get onBeforeSendHeaders => _onBeforeSendHeaders.stream;

  final ChromeStreamController<Map> _onBeforeSendHeaders =
      new ChromeStreamController<Map>.oneArg(_webRequest['onBeforeSendHeaders'], mapify);

  /**
   * Fired just before a request is going to be sent to the server
   * (modifications of previous onBeforeSendHeaders callbacks are visible by the
   * time onSendHeaders is fired).
   */
  Stream<Map> get onSendHeaders => _onSendHeaders.stream;

  final ChromeStreamController<Map> _onSendHeaders =
      new ChromeStreamController<Map>.oneArg(_webRequest['onSendHeaders'], mapify);

  /**
   * Fired when HTTP response headers of a request have been received.
   */
  Stream<Map> get onHeadersReceived => _onHeadersReceived.stream;

  final ChromeStreamController<Map> _onHeadersReceived =
      new ChromeStreamController<Map>.oneArg(_webRequest['onHeadersReceived'], mapify);

  /**
   * Fired when an authentication failure is received. The listener has three
   * options: it can provide authentication credentials, it can cancel the
   * request and display the error page, or it can take no action on the
   * challenge. If bad user credentials are provided, this may be called
   * multiple times for the same request.
   */
  Stream<OnAuthRequiredEvent> get onAuthRequired => _onAuthRequired.stream;

  final ChromeStreamController<OnAuthRequiredEvent> _onAuthRequired =
      new ChromeStreamController<OnAuthRequiredEvent>.twoArgs(_webRequest['onAuthRequired'], _createOnAuthRequiredEvent);

  /**
   * Fired when the first byte of the response body is received. For HTTP
   * requests, this means that the status line and response headers are
   * available.
   */
  Stream<Map> get onResponseStarted => _onResponseStarted.stream;

  final ChromeStreamController<Map> _onResponseStarted =
      new ChromeStreamController<Map>.oneArg(_webRequest['onResponseStarted'], mapify);

  /**
   * Fired when a server-initiated redirect is about to occur.
   */
  Stream<Map> get onBeforeRedirect => _onBeforeRedirect.stream;

  final ChromeStreamController<Map> _onBeforeRedirect =
      new ChromeStreamController<Map>.oneArg(_webRequest['onBeforeRedirect'], mapify);

  /**
   * Fired when a request is completed.
   */
  Stream<Map> get onCompleted => _onCompleted.stream;

  final ChromeStreamController<Map> _onCompleted =
      new ChromeStreamController<Map>.oneArg(_webRequest['onCompleted'], mapify);

  /**
   * Fired when an error occurs.
   */
  Stream<Map> get onErrorOccurred => _onErrorOccurred.stream;

  final ChromeStreamController<Map> _onErrorOccurred =
      new ChromeStreamController<Map>.oneArg(_webRequest['onErrorOccurred'], mapify);
}

/**
 * Fired when an authentication failure is received. The listener has three
 * options: it can provide authentication credentials, it can cancel the request
 * and display the error page, or it can take no action on the challenge. If bad
 * user credentials are provided, this may be called multiple times for the same
 * request.
 */
class OnAuthRequiredEvent {
  final Map details;
  /**
   * `optional`
   */
  final dynamic callback;

  OnAuthRequiredEvent(this.details, this.callback);
}

/**
 * An object describing filters to apply to webRequest events.
 */
class RequestFilter extends ChromeObject {
  RequestFilter({List<String> urls, List<String> types, int tabId, int windowId}) {
    if (urls != null) this.urls = urls;
    if (types != null) this.types = types;
    if (tabId != null) this.tabId = tabId;
    if (windowId != null) this.windowId = windowId;
  }

  RequestFilter.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * A list of URLs or URL patterns. Requests that cannot match any of the URLs
   * will be filtered out.
   */
  List<String> get urls => listify(proxy['urls']);
  set urls(List<String> value) => proxy['urls'] = jsify(value);

  /**
   * A list of request types. Requests that cannot match any of the types will
   * be filtered out.
   */
  List<String> get types => listify(proxy['types']);
  set types(List<String> value) => proxy['types'] = jsify(value);

  int get tabId => proxy['tabId'];
  set tabId(int value) => proxy['tabId'] = value;

  int get windowId => proxy['windowId'];
  set windowId(int value) => proxy['windowId'] = value;
}

/**
 * An array of HTTP headers. Each header is represented as a dictionary
 * containing the keys `name` and either `value` or `binaryValue`.
 */
class HttpHeaders extends ChromeObject {
  HttpHeaders();

  HttpHeaders.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

class AuthCredentialsWebRequest extends ChromeObject {
  AuthCredentialsWebRequest();

  AuthCredentialsWebRequest.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get username => proxy['username'];

  String get password => proxy['password'];
}

/**
 * Returns value for event handlers that have the 'blocking' extraInfoSpec
 * applied. Allows the event handler to modify network requests.
 */
class BlockingResponse extends ChromeObject {
  BlockingResponse({bool cancel, String redirectUrl, HttpHeaders requestHeaders, HttpHeaders responseHeaders, AuthCredentialsWebRequest authCredentials}) {
    if (cancel != null) this.cancel = cancel;
    if (redirectUrl != null) this.redirectUrl = redirectUrl;
    if (requestHeaders != null) this.requestHeaders = requestHeaders;
    if (responseHeaders != null) this.responseHeaders = responseHeaders;
    if (authCredentials != null) this.authCredentials = authCredentials;
  }

  BlockingResponse.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * If true, the request is cancelled. Used in onBeforeRequest, this prevents
   * the request from being sent.
   */
  bool get cancel => proxy['cancel'];
  set cancel(bool value) => proxy['cancel'] = value;

  /**
   * Only used as a response to the onBeforeRequest event. If set, the original
   * request is prevented from being sent and is instead redirected to the given
   * URL.
   */
  String get redirectUrl => proxy['redirectUrl'];
  set redirectUrl(String value) => proxy['redirectUrl'] = value;

  /**
   * Only used as a response to the onBeforeSendHeaders event. If set, the
   * request is made with these request headers instead.
   */
  HttpHeaders get requestHeaders => _createHttpHeaders(proxy['requestHeaders']);
  set requestHeaders(HttpHeaders value) => proxy['requestHeaders'] = jsify(value);

  /**
   * Only used as a response to the onHeadersReceived event. If set, the server
   * is assumed to have responded with these response headers instead. Only
   * return `responseHeaders` if you really want to modify the headers in order
   * to limit the number of conflicts (only one extension may modify
   * `responseHeaders` for each request).
   */
  HttpHeaders get responseHeaders => _createHttpHeaders(proxy['responseHeaders']);
  set responseHeaders(HttpHeaders value) => proxy['responseHeaders'] = jsify(value);

  /**
   * Only used as a response to the onAuthRequired event. If set, the request is
   * made using the supplied credentials.
   */
  AuthCredentialsWebRequest get authCredentials => _createAuthCredentialsWebRequest(proxy['authCredentials']);
  set authCredentials(AuthCredentialsWebRequest value) => proxy['authCredentials'] = jsify(value);
}

/**
 * Contains data uploaded in a URL request.
 */
class UploadData extends ChromeObject {
  UploadData({var bytes, String file}) {
    if (bytes != null) this.bytes = bytes;
    if (file != null) this.file = file;
  }

  UploadData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * An ArrayBuffer with a copy of the data.
   */
  dynamic get bytes => proxy['bytes'];
  set bytes(var value) => proxy['bytes'] = jsify(value);

  /**
   * A string with the file's path and name.
   */
  String get file => proxy['file'];
  set file(String value) => proxy['file'] = value;
}

class RequestBodyWebRequest extends ChromeObject {
  RequestBodyWebRequest();

  RequestBodyWebRequest.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Errors when obtaining request body data.
   */
  String get error => proxy['error'];

  /**
   * If the request method is POST and the body is a sequence of key-value pairs
   * encoded in UTF8, encoded as either multipart/form-data, or
   * application/x-www-form-urlencoded, this dictionary is present and for each
   * key contains the list of all values for that key. If the data is of another
   * media type, or if it is malformed, the dictionary is not present. An
   * example value of this dictionary is {'key': ['value1', 'value2']}.
   */
  Map get formData => mapify(proxy['formData']);

  /**
   * If the request method is PUT or POST, and the body is not already parsed in
   * formData, then the unparsed request body elements are contained in this
   * array.
   */
  List<UploadData> get raw => listify(proxy['raw'], _createUploadData);
}

class ChallengerWebRequest extends ChromeObject {
  ChallengerWebRequest();

  ChallengerWebRequest.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get host => proxy['host'];

  int get port => proxy['port'];
}

OnAuthRequiredEvent _createOnAuthRequiredEvent(JsObject details, JsObject callback) =>
    new OnAuthRequiredEvent(mapify(details), callback);
HttpHeaders _createHttpHeaders(JsObject proxy) => proxy == null ? null : new HttpHeaders.fromProxy(proxy);
AuthCredentialsWebRequest _createAuthCredentialsWebRequest(JsObject proxy) => proxy == null ? null : new AuthCredentialsWebRequest.fromProxy(proxy);
UploadData _createUploadData(JsObject proxy) => proxy == null ? null : new UploadData.fromProxy(proxy);
