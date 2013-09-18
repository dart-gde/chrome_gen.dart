// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from declarative_web_request.json - do not edit */

/**
 * Use the `chrome.declarativeWebRequest` API to intercept, block, or modify
 * requests in-flight. It is significantly faster than the <a
 * href='webRequest.html'>`chrome.webRequest` API</a> because you can register
 * rules that are evaluated in the browser rather than the JavaScript engine
 * with reduces roundtrip latencies and allows higher efficiency.
 */
library chrome.declarativeWebRequest;

import '../src/common.dart';

/// Accessor for the `chrome.declarativeWebRequest` namespace.
final ChromeDeclarativeWebRequest declarativeWebRequest = new ChromeDeclarativeWebRequest._();

class ChromeDeclarativeWebRequest {
  JsObject _declarativeWebRequest;

  ChromeDeclarativeWebRequest._() {
    _declarativeWebRequest = context['chrome']['declarativeWebRequest'];
  }

  Stream<dynamic> get onRequest => _onRequest.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onRequest = null;

  /**
   * Fired when a message is sent via
   * [declarativeWebRequest.SendMessageToExtension] from an action of the
   * declarative web request API.
   */
  Stream<dynamic> get onMessage => _onMessage.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onMessage = null;
}

/**
 * Filters request headers for various criteria. Multiple criteria are evaluated
 * as a conjunction.
 */
class HeaderFilter extends ChromeObject {
  HeaderFilter(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Matches network events by various criteria.
 */
class RequestMatcher extends ChromeObject {
  RequestMatcher(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Declarative event action that cancels a network request.
 */
class CancelRequest extends ChromeObject {
  CancelRequest(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Declarative event action that redirects a network request.
 */
class RedirectRequest extends ChromeObject {
  RedirectRequest(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Declarative event action that redirects a network request to a transparent
 * image.
 */
class RedirectToTransparentImage extends ChromeObject {
  RedirectToTransparentImage(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Declarative event action that redirects a network request to an empty
 * document.
 */
class RedirectToEmptyDocument extends ChromeObject {
  RedirectToEmptyDocument(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Redirects a request by applying a regular expression on the URL. The regular
 * expressions use the [RE2 syntax](http://code.google.com/p/re2/wiki/Syntax).
 */
class RedirectByRegEx extends ChromeObject {
  RedirectByRegEx(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Sets the request header of the specified name to the specified value. If a
 * header with the specified name did not exist before, a new one is created.
 * Header name comparison is always case-insensitive. Each request header name
 * occurs only once in each request.
 */
class SetRequestHeader extends ChromeObject {
  SetRequestHeader(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Removes the request header of the specified name. Do not use SetRequestHeader
 * and RemoveRequestHeader with the same header name on the same request. Each
 * request header name occurs only once in each request.
 */
class RemoveRequestHeader extends ChromeObject {
  RemoveRequestHeader(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Adds the response header to the response of this web request. As multiple
 * response headers may share the same name, you need to first remove and then
 * add a new response header in order to replace one.
 */
class AddResponseHeader extends ChromeObject {
  AddResponseHeader(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Removes all response headers of the specified names and values.
 */
class RemoveResponseHeader extends ChromeObject {
  RemoveResponseHeader(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Masks all rules that match the specified criteria.
 */
class IgnoreRules extends ChromeObject {
  IgnoreRules(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Triggers the [declarativeWebRequest.onMessage] event.
 */
class SendMessageToExtension extends ChromeObject {
  SendMessageToExtension(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A filter or specification of a cookie in HTTP Requests.
 */
class RequestCookie extends ChromeObject {
  RequestCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A specification of a cookie in HTTP Responses.
 */
class ResponseCookie extends ChromeObject {
  ResponseCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A filter of a cookie in HTTP Responses.
 */
class FilterResponseCookie extends ChromeObject {
  FilterResponseCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Adds a cookie to the request or overrides a cookie, in case another cookie of
 * the same name exists already. Note that it is preferred to use the Cookies
 * API because this is computationally less expensive.
 */
class AddRequestCookie extends ChromeObject {
  AddRequestCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Adds a cookie to the response or overrides a cookie, in case another cookie
 * of the same name exists already. Note that it is preferred to use the Cookies
 * API because this is computationally less expensive.
 */
class AddResponseCookie extends ChromeObject {
  AddResponseCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Edits one or more cookies of request. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 */
class EditRequestCookie extends ChromeObject {
  EditRequestCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Edits one or more cookies of response. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 */
class EditResponseCookie extends ChromeObject {
  EditResponseCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Removes one or more cookies of request. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 */
class RemoveRequestCookie extends ChromeObject {
  RemoveRequestCookie(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Removes one or more cookies of response. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 */
class RemoveResponseCookie extends ChromeObject {
  RemoveResponseCookie(JsObject proxy): super(proxy);
  // TODO:
}
