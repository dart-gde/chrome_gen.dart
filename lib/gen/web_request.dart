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
  JsObject _webRequest;

  ChromeWebRequest._() {
    _webRequest = context['chrome']['webRequest'];
  }

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
  Stream<dynamic> get onBeforeRequest => _onBeforeRequest.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onBeforeRequest = null;

  /**
   * Fired before sending an HTTP request, once the request headers are
   * available. This may occur after a TCP connection is made to the server, but
   * before any HTTP data is sent.
   */
  Stream<dynamic> get onBeforeSendHeaders => _onBeforeSendHeaders.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onBeforeSendHeaders = null;

  /**
   * Fired just before a request is going to be sent to the server
   * (modifications of previous onBeforeSendHeaders callbacks are visible by the
   * time onSendHeaders is fired).
   */
  Stream<dynamic> get onSendHeaders => _onSendHeaders.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onSendHeaders = null;

  /**
   * Fired when HTTP response headers of a request have been received.
   */
  Stream<dynamic> get onHeadersReceived => _onHeadersReceived.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onHeadersReceived = null;

  /**
   * Fired when an authentication failure is received. The listener has three
   * options: it can provide authentication credentials, it can cancel the
   * request and display the error page, or it can take no action on the
   * challenge. If bad user credentials are provided, this may be called
   * multiple times for the same request.
   */
  Stream<dynamic> get onAuthRequired => _onAuthRequired.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onAuthRequired = null;

  /**
   * Fired when the first byte of the response body is received. For HTTP
   * requests, this means that the status line and response headers are
   * available.
   */
  Stream<dynamic> get onResponseStarted => _onResponseStarted.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onResponseStarted = null;

  /**
   * Fired when a server-initiated redirect is about to occur.
   */
  Stream<dynamic> get onBeforeRedirect => _onBeforeRedirect.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onBeforeRedirect = null;

  /**
   * Fired when a request is completed.
   */
  Stream<dynamic> get onCompleted => _onCompleted.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onCompleted = null;

  /**
   * Fired when an error occurs.
   */
  Stream<dynamic> get onErrorOccurred => _onErrorOccurred.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onErrorOccurred = null;
}

/**
 * An object describing filters to apply to webRequest events.
 */
class RequestFilter extends ChromeObject {
  RequestFilter(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * An array of HTTP headers. Each header is represented as a dictionary
 * containing the keys `name` and either `value` or `binaryValue`.
 */
class HttpHeaders extends ChromeObject {
  HttpHeaders(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Returns value for event handlers that have the 'blocking' extraInfoSpec
 * applied. Allows the event handler to modify network requests.
 */
class BlockingResponse extends ChromeObject {
  BlockingResponse(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Contains data uploaded in a URL request.
 */
class UploadData extends ChromeObject {
  UploadData(JsObject proxy): super(proxy);
  // TODO:
}
