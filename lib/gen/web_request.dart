// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from web_request.json - do not edit */

/**
 * Use the `chrome.webRequest` API to observe and analyze traffic and to
 * intercept, block, or modify requests in-flight.
 */
library chrome.web_request;

import '../src/common.dart';

/// Accessor for the `chrome.web_request` namespace.
final ChromeWebRequest web_request = new ChromeWebRequest._();

class ChromeWebRequest {
  ChromeWebRequest._();

  /**
   * The maximum number of times that `handlerBehaviorChanged` can be called per
   * 10 minute sustained interval. `handlerBehaviorChanged` is an expensive
   * function call that shouldn't be called often.
   */
  int get MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES => chrome['web_request']['MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES'];

  /**
   * Needs to be called when the behavior of the webRequest handlers has changed
   * to prevent incorrect handling due to caching. This function call is
   * expensive. Don't call it often.
   */
  Future handlerBehaviorChanged() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['web_request'].callMethod('handlerBehaviorChanged', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a request is about to occur.
   */
  Stream get onBeforeRequest => null;

  /**
   * Fired before sending an HTTP request, once the request headers are
   * available. This may occur after a TCP connection is made to the server, but
   * before any HTTP data is sent.
   */
  Stream get onBeforeSendHeaders => null;

  /**
   * Fired just before a request is going to be sent to the server
   * (modifications of previous onBeforeSendHeaders callbacks are visible by the
   * time onSendHeaders is fired).
   */
  Stream get onSendHeaders => null;

  /**
   * Fired when HTTP response headers of a request have been received.
   */
  Stream get onHeadersReceived => null;

  /**
   * Fired when an authentication failure is received. The listener has three
   * options: it can provide authentication credentials, it can cancel the
   * request and display the error page, or it can take no action on the
   * challenge. If bad user credentials are provided, this may be called
   * multiple times for the same request.
   */
  Stream get onAuthRequired => null;

  /**
   * Fired when the first byte of the response body is received. For HTTP
   * requests, this means that the status line and response headers are
   * available.
   */
  Stream get onResponseStarted => null;

  /**
   * Fired when a server-initiated redirect is about to occur.
   */
  Stream get onBeforeRedirect => null;

  /**
   * Fired when a request is completed.
   */
  Stream get onCompleted => null;

  /**
   * Fired when an error occurs.
   */
  Stream get onErrorOccurred => null;
}
