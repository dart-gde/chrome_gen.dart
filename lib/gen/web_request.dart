// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from web_request.json - do not edit */

/**
 * Use the `chrome.webRequest` API to observe and analyze traffic and to
 * intercept, block, or modify requests in-flight.
 */
library chrome.webRequest;

import '../src/common.dart';

/// Accessor for the `chrome.webRequest` namespace.
final ChromeWebRequest webRequest = new ChromeWebRequest._();

class ChromeWebRequest {
  static final JsObject _webRequest = context['chrome']['webRequest'];

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
    ChromeCompleter completer = new ChromeCompleter.noArgs();
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
  Stream<dynamic> get onAuthRequired => _onAuthRequired.stream;

  final ChromeStreamController<dynamic> _onAuthRequired =
      new ChromeStreamController<dynamic>.oneArg(_webRequest['onAuthRequired'], selfConverter);

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
 * An object describing filters to apply to webRequest events.
 * 
 * `urls` A list of URLs or URL patterns. Requests that cannot match any of the
 * URLs will be filtered out.
 * 
 * `types` A list of request types. Requests that cannot match any of the types
 * will be filtered out.
 * 
 * `tabId`
 * 
 * `windowId`
 */
class RequestFilter extends ChromeObject {
  static RequestFilter create(JsObject proxy) => new RequestFilter(proxy);

  RequestFilter(JsObject proxy): super(proxy);

  /**
   * A list of URLs or URL patterns. Requests that cannot match any of the URLs
   * will be filtered out.
   */
  List<String> get urls => listify(proxy['urls']);

  /**
   * A list of request types. Requests that cannot match any of the types will
   * be filtered out.
   */
  List<String> get types => listify(proxy['types']);

  int get tabId => proxy['tabId'];

  int get windowId => proxy['windowId'];
}

/**
 * An array of HTTP headers. Each header is represented as a dictionary
 * containing the keys `name` and either `value` or `binaryValue`.
 */
class HttpHeaders extends ChromeObject {
  static HttpHeaders create(JsObject proxy) => new HttpHeaders(proxy);

  HttpHeaders(JsObject proxy): super(proxy);
}

/**
 * Returns value for event handlers that have the 'blocking' extraInfoSpec
 * applied. Allows the event handler to modify network requests.
 * 
 * `cancel` If true, the request is cancelled. Used in onBeforeRequest, this
 * prevents the request from being sent.
 * 
 * `redirectUrl` Only used as a response to the onBeforeRequest event. If set,
 * the original request is prevented from being sent and is instead redirected
 * to the given URL.
 * 
 * `requestHeaders` Only used as a response to the onBeforeSendHeaders event. If
 * set, the request is made with these request headers instead.
 * 
 * `responseHeaders` Only used as a response to the onHeadersReceived event. If
 * set, the server is assumed to have responded with these response headers
 * instead. Only return `responseHeaders` if you really want to modify the
 * headers in order to limit the number of conflicts (only one extension may
 * modify `responseHeaders` for each request).
 * 
 * `authCredentials` Only used as a response to the onAuthRequired event. If
 * set, the request is made using the supplied credentials.
 */
class BlockingResponse extends ChromeObject {
  static BlockingResponse create(JsObject proxy) => new BlockingResponse(proxy);

  BlockingResponse(JsObject proxy): super(proxy);

  /**
   * If true, the request is cancelled. Used in onBeforeRequest, this prevents
   * the request from being sent.
   */
  bool get cancel => proxy['cancel'];

  /**
   * Only used as a response to the onBeforeRequest event. If set, the original
   * request is prevented from being sent and is instead redirected to the given
   * URL.
   */
  String get redirectUrl => proxy['redirectUrl'];

  /**
   * Only used as a response to the onBeforeSendHeaders event. If set, the
   * request is made with these request headers instead.
   */
  HttpHeaders get requestHeaders => new HttpHeaders(proxy['requestHeaders']);

  /**
   * Only used as a response to the onHeadersReceived event. If set, the server
   * is assumed to have responded with these response headers instead. Only
   * return `responseHeaders` if you really want to modify the headers in order
   * to limit the number of conflicts (only one extension may modify
   * `responseHeaders` for each request).
   */
  HttpHeaders get responseHeaders => new HttpHeaders(proxy['responseHeaders']);

  /**
   * Only used as a response to the onAuthRequired event. If set, the request is
   * made using the supplied credentials.
   * 
   * `username`
   * 
   * `password`
   */
  Map get authCredentials => mapify(proxy['authCredentials']);
}

/**
 * Contains data uploaded in a URL request.
 * 
 * `bytes` An ArrayBuffer with a copy of the data.
 * 
 * `file` A string with the file's path and name.
 */
class UploadData extends ChromeObject {
  static UploadData create(JsObject proxy) => new UploadData(proxy);

  UploadData(JsObject proxy): super(proxy);

  /**
   * An ArrayBuffer with a copy of the data.
   */
  dynamic get bytes => proxy['bytes'];

  /**
   * A string with the file's path and name.
   */
  String get file => proxy['file'];
}
