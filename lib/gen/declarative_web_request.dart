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

import 'events.dart';
import '../src/common.dart';

/// Accessor for the `chrome.declarativeWebRequest` namespace.
final ChromeDeclarativeWebRequest declarativeWebRequest = new ChromeDeclarativeWebRequest._();

class ChromeDeclarativeWebRequest {
  static final JsObject _declarativeWebRequest = context['chrome']['declarativeWebRequest'];

  ChromeDeclarativeWebRequest._();

  Stream get onRequest => _onRequest.stream;

  final ChromeStreamController _onRequest =
      new ChromeStreamController.noArgs(_declarativeWebRequest['onRequest']);

  /**
   * Fired when a message is sent via
   * [declarativeWebRequest.SendMessageToExtension] from an action of the
   * declarative web request API.
   */
  Stream<Map> get onMessage => _onMessage.stream;

  final ChromeStreamController<Map> _onMessage =
      new ChromeStreamController<Map>.oneArg(_declarativeWebRequest['onMessage'], mapify);
}

/**
 * Filters request headers for various criteria. Multiple criteria are evaluated
 * as a conjunction.
 * 
 * `namePrefix` Matches if the header name starts with the specified string.
 * 
 * `nameSuffix` Matches if the header name ends with the specified string.
 * 
 * `nameContains` Matches if the header name contains all of the specified
 * strings.
 * 
 * `nameEquals` Matches if the header name is equal to the specified string.
 * 
 * `valuePrefix` Matches if the header value starts with the specified string.
 * 
 * `valueSuffix` Matches if the header value ends with the specified string.
 * 
 * `valueContains` Matches if the header value contains all of the specified
 * strings.
 * 
 * `valueEquals` Matches if the header value is equal to the specified string.
 */
class HeaderFilter extends ChromeObject {
  static HeaderFilter create(JsObject proxy) => new HeaderFilter(proxy);

  HeaderFilter(JsObject proxy): super(proxy);

  /**
   * Matches if the header name starts with the specified string.
   */
  String get namePrefix => proxy['namePrefix'];

  /**
   * Matches if the header name ends with the specified string.
   */
  String get nameSuffix => proxy['nameSuffix'];

  /**
   * Matches if the header name contains all of the specified strings.
   */
  dynamic get nameContains => proxy['nameContains'];

  /**
   * Matches if the header name is equal to the specified string.
   */
  String get nameEquals => proxy['nameEquals'];

  /**
   * Matches if the header value starts with the specified string.
   */
  String get valuePrefix => proxy['valuePrefix'];

  /**
   * Matches if the header value ends with the specified string.
   */
  String get valueSuffix => proxy['valueSuffix'];

  /**
   * Matches if the header value contains all of the specified strings.
   */
  dynamic get valueContains => proxy['valueContains'];

  /**
   * Matches if the header value is equal to the specified string.
   */
  String get valueEquals => proxy['valueEquals'];
}

/**
 * Matches network events by various criteria.
 * 
 * `url` Matches if the conditions of the UrlFilter are fulfilled for the URL of
 * the request.
 * 
 * `firstPartyForCookiesUrl` Matches if the conditions of the UrlFilter are
 * fulfilled for the 'first party' URL of the request. The 'first party' URL of
 * a request, when present, can be different from the request's target URL, and
 * describes what is considered 'first party' for the sake of third-party checks
 * for cookies.
 * 
 * `resourceType` Matches if the request type of a request is contained in the
 * list. Requests that cannot match any of the types will be filtered out.
 * 
 * `contentType` Matches if the MIME media type of a response (from the HTTP
 * Content-Type header) is contained in the list.
 * 
 * `excludeContentType` Matches if the MIME media type of a response (from the
 * HTTP Content-Type header) is _not_ contained in the list.
 * 
 * `requestHeaders` Matches if some of the request headers is matched by one of
 * the HeaderFilters.
 * 
 * `excludeRequestHeaders` Matches if none of the request headers is matched by
 * any of the HeaderFilters.
 * 
 * `responseHeaders` Matches if some of the response headers is matched by one
 * of the HeaderFilters.
 * 
 * `excludeResponseHeaders` Matches if none of the response headers is matched
 * by any of the HeaderFilters.
 * 
 * `thirdPartyForCookies` If set to true, matches requests that are subject to
 * third-party cookie policies. If set to false, matches all other requests.
 * 
 * `stages` Contains a list of strings describing stages. Allowed values are
 * 'onBeforeRequest', 'onBeforeSendHeaders', 'onHeadersReceived',
 * 'onAuthRequired'. If this attribute is present, then it limits the applicable
 * stages to those listed. Note that the whole condition is only applicable in
 * stages compatible with all attributes.
 * 
 * `instanceType`
 */
class RequestMatcher extends ChromeObject {
  static RequestMatcher create(JsObject proxy) => new RequestMatcher(proxy);

  RequestMatcher(JsObject proxy): super(proxy);

  /**
   * Matches if the conditions of the UrlFilter are fulfilled for the URL of the
   * request.
   */
  UrlFilter get url => new UrlFilter(proxy['url']);

  /**
   * Matches if the conditions of the UrlFilter are fulfilled for the 'first
   * party' URL of the request. The 'first party' URL of a request, when
   * present, can be different from the request's target URL, and describes what
   * is considered 'first party' for the sake of third-party checks for cookies.
   */
  UrlFilter get firstPartyForCookiesUrl => new UrlFilter(proxy['firstPartyForCookiesUrl']);

  /**
   * Matches if the request type of a request is contained in the list. Requests
   * that cannot match any of the types will be filtered out.
   */
  List<String> get resourceType => listify(proxy['resourceType']);

  /**
   * Matches if the MIME media type of a response (from the HTTP Content-Type
   * header) is contained in the list.
   */
  List<String> get contentType => listify(proxy['contentType']);

  /**
   * Matches if the MIME media type of a response (from the HTTP Content-Type
   * header) is _not_ contained in the list.
   */
  List<String> get excludeContentType => listify(proxy['excludeContentType']);

  /**
   * Matches if some of the request headers is matched by one of the
   * HeaderFilters.
   */
  List<HeaderFilter> get requestHeaders => listify(proxy['requestHeaders'], HeaderFilter.create);

  /**
   * Matches if none of the request headers is matched by any of the
   * HeaderFilters.
   */
  List<HeaderFilter> get excludeRequestHeaders => listify(proxy['excludeRequestHeaders'], HeaderFilter.create);

  /**
   * Matches if some of the response headers is matched by one of the
   * HeaderFilters.
   */
  List<HeaderFilter> get responseHeaders => listify(proxy['responseHeaders'], HeaderFilter.create);

  /**
   * Matches if none of the response headers is matched by any of the
   * HeaderFilters.
   */
  List<HeaderFilter> get excludeResponseHeaders => listify(proxy['excludeResponseHeaders'], HeaderFilter.create);

  /**
   * If set to true, matches requests that are subject to third-party cookie
   * policies. If set to false, matches all other requests.
   */
  bool get thirdPartyForCookies => proxy['thirdPartyForCookies'];

  /**
   * Contains a list of strings describing stages. Allowed values are
   * 'onBeforeRequest', 'onBeforeSendHeaders', 'onHeadersReceived',
   * 'onAuthRequired'. If this attribute is present, then it limits the
   * applicable stages to those listed. Note that the whole condition is only
   * applicable in stages compatible with all attributes.
   */
  List<String> get stages => listify(proxy['stages']);
}

/**
 * Declarative event action that cancels a network request.
 * 
 * `instanceType`
 */
class CancelRequest extends ChromeObject {
  static CancelRequest create(JsObject proxy) => new CancelRequest(proxy);

  CancelRequest(JsObject proxy): super(proxy);
}

/**
 * Declarative event action that redirects a network request.
 * 
 * `instanceType`
 * 
 * `redirectUrl` Destination to where the request is redirected.
 */
class RedirectRequest extends ChromeObject {
  static RedirectRequest create(JsObject proxy) => new RedirectRequest(proxy);

  RedirectRequest(JsObject proxy): super(proxy);

  /**
   * Destination to where the request is redirected.
   */
  String get redirectUrl => proxy['redirectUrl'];
}

/**
 * Declarative event action that redirects a network request to a transparent
 * image.
 * 
 * `instanceType`
 */
class RedirectToTransparentImage extends ChromeObject {
  static RedirectToTransparentImage create(JsObject proxy) => new RedirectToTransparentImage(proxy);

  RedirectToTransparentImage(JsObject proxy): super(proxy);
}

/**
 * Declarative event action that redirects a network request to an empty
 * document.
 * 
 * `instanceType`
 */
class RedirectToEmptyDocument extends ChromeObject {
  static RedirectToEmptyDocument create(JsObject proxy) => new RedirectToEmptyDocument(proxy);

  RedirectToEmptyDocument(JsObject proxy): super(proxy);
}

/**
 * Redirects a request by applying a regular expression on the URL. The regular
 * expressions use the [RE2 syntax](http://code.google.com/p/re2/wiki/Syntax).
 * 
 * `instanceType`
 * 
 * `from` A match pattern that may contain capture groups. Capture groups are
 * referenced in the Perl syntax ($1, $2, ...) instead of the RE2 syntax (\1,
 * \2, ...) in order to be closer to JavaScript Regular Expressions.
 * 
 * `to` Destination pattern.
 */
class RedirectByRegEx extends ChromeObject {
  static RedirectByRegEx create(JsObject proxy) => new RedirectByRegEx(proxy);

  RedirectByRegEx(JsObject proxy): super(proxy);

  /**
   * A match pattern that may contain capture groups. Capture groups are
   * referenced in the Perl syntax ($1, $2, ...) instead of the RE2 syntax (\1,
   * \2, ...) in order to be closer to JavaScript Regular Expressions.
   */
  String get from => proxy['from'];

  /**
   * Destination pattern.
   */
  String get to => proxy['to'];
}

/**
 * Sets the request header of the specified name to the specified value. If a
 * header with the specified name did not exist before, a new one is created.
 * Header name comparison is always case-insensitive. Each request header name
 * occurs only once in each request.
 * 
 * `instanceType`
 * 
 * `name` HTTP request header name.
 * 
 * `value` HTTP request header value.
 */
class SetRequestHeader extends ChromeObject {
  static SetRequestHeader create(JsObject proxy) => new SetRequestHeader(proxy);

  SetRequestHeader(JsObject proxy): super(proxy);

  /**
   * HTTP request header name.
   */
  String get name => proxy['name'];

  /**
   * HTTP request header value.
   */
  String get value => proxy['value'];
}

/**
 * Removes the request header of the specified name. Do not use SetRequestHeader
 * and RemoveRequestHeader with the same header name on the same request. Each
 * request header name occurs only once in each request.
 * 
 * `instanceType`
 * 
 * `name` HTTP request header name (case-insensitive).
 */
class RemoveRequestHeader extends ChromeObject {
  static RemoveRequestHeader create(JsObject proxy) => new RemoveRequestHeader(proxy);

  RemoveRequestHeader(JsObject proxy): super(proxy);

  /**
   * HTTP request header name (case-insensitive).
   */
  String get name => proxy['name'];
}

/**
 * Adds the response header to the response of this web request. As multiple
 * response headers may share the same name, you need to first remove and then
 * add a new response header in order to replace one.
 * 
 * `instanceType`
 * 
 * `name` HTTP response header name.
 * 
 * `value` HTTP response header value.
 */
class AddResponseHeader extends ChromeObject {
  static AddResponseHeader create(JsObject proxy) => new AddResponseHeader(proxy);

  AddResponseHeader(JsObject proxy): super(proxy);

  /**
   * HTTP response header name.
   */
  String get name => proxy['name'];

  /**
   * HTTP response header value.
   */
  String get value => proxy['value'];
}

/**
 * Removes all response headers of the specified names and values.
 * 
 * `instanceType`
 * 
 * `name` HTTP request header name (case-insensitive).
 * 
 * `value` HTTP request header value (case-insensitive).
 */
class RemoveResponseHeader extends ChromeObject {
  static RemoveResponseHeader create(JsObject proxy) => new RemoveResponseHeader(proxy);

  RemoveResponseHeader(JsObject proxy): super(proxy);

  /**
   * HTTP request header name (case-insensitive).
   */
  String get name => proxy['name'];

  /**
   * HTTP request header value (case-insensitive).
   */
  String get value => proxy['value'];
}

/**
 * Masks all rules that match the specified criteria.
 * 
 * `instanceType`
 * 
 * `lowerPriorityThan` If set, rules with a lower priority than the specified
 * value are ignored. This boundary is not persisted, it affects only rules and
 * their actions of the same network request stage.
 * 
 * `hasTag` If set, rules with the specified tag are ignored. This ignoring is
 * not persisted, it affects only rules and their actions of the same network
 * request stage. Note that rules are executed in descending order of their
 * priorities. This action affects rules of lower priority than the current
 * rule. Rules with the same priority may or may not be ignored.
 */
class IgnoreRules extends ChromeObject {
  static IgnoreRules create(JsObject proxy) => new IgnoreRules(proxy);

  IgnoreRules(JsObject proxy): super(proxy);

  /**
   * If set, rules with a lower priority than the specified value are ignored.
   * This boundary is not persisted, it affects only rules and their actions of
   * the same network request stage.
   */
  int get lowerPriorityThan => proxy['lowerPriorityThan'];

  /**
   * If set, rules with the specified tag are ignored. This ignoring is not
   * persisted, it affects only rules and their actions of the same network
   * request stage. Note that rules are executed in descending order of their
   * priorities. This action affects rules of lower priority than the current
   * rule. Rules with the same priority may or may not be ignored.
   */
  String get hasTag => proxy['hasTag'];
}

/**
 * Triggers the [declarativeWebRequest.onMessage] event.
 * 
 * `instanceType`
 * 
 * `message` The value that will be passed in the `message` attribute of the
 * dictionary that is passed to the event handler.
 */
class SendMessageToExtension extends ChromeObject {
  static SendMessageToExtension create(JsObject proxy) => new SendMessageToExtension(proxy);

  SendMessageToExtension(JsObject proxy): super(proxy);

  /**
   * The value that will be passed in the `message` attribute of the dictionary
   * that is passed to the event handler.
   */
  String get message => proxy['message'];
}

/**
 * A filter or specification of a cookie in HTTP Requests.
 * 
 * `name` Name of a cookie.
 * 
 * `value` Value of a cookie, may be padded in double-quotes.
 */
class RequestCookie extends ChromeObject {
  static RequestCookie create(JsObject proxy) => new RequestCookie(proxy);

  RequestCookie(JsObject proxy): super(proxy);

  /**
   * Name of a cookie.
   */
  String get name => proxy['name'];

  /**
   * Value of a cookie, may be padded in double-quotes.
   */
  String get value => proxy['value'];
}

/**
 * A specification of a cookie in HTTP Responses.
 * 
 * `name` Name of a cookie.
 * 
 * `value` Value of a cookie, may be padded in double-quotes.
 * 
 * `expires` Value of the Expires cookie attribute.
 * 
 * `maxAge` Value of the Max-Age cookie attribute
 * 
 * `domain` Value of the Domain cookie attribute.
 * 
 * `path` Value of the Path cookie attribute.
 * 
 * `secure` Existence of the Secure cookie attribute.
 * 
 * `httpOnly` Existence of the HttpOnly cookie attribute.
 */
class ResponseCookie extends ChromeObject {
  static ResponseCookie create(JsObject proxy) => new ResponseCookie(proxy);

  ResponseCookie(JsObject proxy): super(proxy);

  /**
   * Name of a cookie.
   */
  String get name => proxy['name'];

  /**
   * Value of a cookie, may be padded in double-quotes.
   */
  String get value => proxy['value'];

  /**
   * Value of the Expires cookie attribute.
   */
  String get expires => proxy['expires'];

  /**
   * Value of the Max-Age cookie attribute
   */
  dynamic get maxAge => proxy['maxAge'];

  /**
   * Value of the Domain cookie attribute.
   */
  String get domain => proxy['domain'];

  /**
   * Value of the Path cookie attribute.
   */
  String get path => proxy['path'];

  /**
   * Existence of the Secure cookie attribute.
   */
  String get secure => proxy['secure'];

  /**
   * Existence of the HttpOnly cookie attribute.
   */
  String get httpOnly => proxy['httpOnly'];
}

/**
 * A filter of a cookie in HTTP Responses.
 * 
 * `name` Name of a cookie.
 * 
 * `value` Value of a cookie, may be padded in double-quotes.
 * 
 * `expires` Value of the Expires cookie attribute.
 * 
 * `maxAge` Value of the Max-Age cookie attribute
 * 
 * `domain` Value of the Domain cookie attribute.
 * 
 * `path` Value of the Path cookie attribute.
 * 
 * `secure` Existence of the Secure cookie attribute.
 * 
 * `httpOnly` Existence of the HttpOnly cookie attribute.
 * 
 * `ageUpperBound` Inclusive upper bound on the cookie lifetime (specified in
 * seconds after current time). Only cookies whose expiration date-time is in
 * the interval [now, now + ageUpperBound] fulfill this criterion. Session
 * cookies and cookies whose expiration date-time is in the past do not meet the
 * criterion of this filter. The cookie lifetime is calculated from either
 * 'max-age' or 'expires' cookie attributes. If both are specified, 'max-age' is
 * used to calculate the cookie lifetime.
 * 
 * `ageLowerBound` Inclusive lower bound on the cookie lifetime (specified in
 * seconds after current time). Only cookies whose expiration date-time is set
 * to 'now + ageLowerBound' or later fulfill this criterion. Session cookies do
 * not meet the criterion of this filter. The cookie lifetime is calculated from
 * either 'max-age' or 'expires' cookie attributes. If both are specified,
 * 'max-age' is used to calculate the cookie lifetime.
 * 
 * `sessionCookie` Filters session cookies. Session cookies have no lifetime
 * specified in any of 'max-age' or 'expires' attributes.
 */
class FilterResponseCookie extends ChromeObject {
  static FilterResponseCookie create(JsObject proxy) => new FilterResponseCookie(proxy);

  FilterResponseCookie(JsObject proxy): super(proxy);

  /**
   * Name of a cookie.
   */
  String get name => proxy['name'];

  /**
   * Value of a cookie, may be padded in double-quotes.
   */
  String get value => proxy['value'];

  /**
   * Value of the Expires cookie attribute.
   */
  String get expires => proxy['expires'];

  /**
   * Value of the Max-Age cookie attribute
   */
  dynamic get maxAge => proxy['maxAge'];

  /**
   * Value of the Domain cookie attribute.
   */
  String get domain => proxy['domain'];

  /**
   * Value of the Path cookie attribute.
   */
  String get path => proxy['path'];

  /**
   * Existence of the Secure cookie attribute.
   */
  String get secure => proxy['secure'];

  /**
   * Existence of the HttpOnly cookie attribute.
   */
  String get httpOnly => proxy['httpOnly'];

  /**
   * Inclusive upper bound on the cookie lifetime (specified in seconds after
   * current time). Only cookies whose expiration date-time is in the interval
   * [now, now + ageUpperBound] fulfill this criterion. Session cookies and
   * cookies whose expiration date-time is in the past do not meet the criterion
   * of this filter. The cookie lifetime is calculated from either 'max-age' or
   * 'expires' cookie attributes. If both are specified, 'max-age' is used to
   * calculate the cookie lifetime.
   */
  int get ageUpperBound => proxy['ageUpperBound'];

  /**
   * Inclusive lower bound on the cookie lifetime (specified in seconds after
   * current time). Only cookies whose expiration date-time is set to 'now +
   * ageLowerBound' or later fulfill this criterion. Session cookies do not meet
   * the criterion of this filter. The cookie lifetime is calculated from either
   * 'max-age' or 'expires' cookie attributes. If both are specified, 'max-age'
   * is used to calculate the cookie lifetime.
   */
  int get ageLowerBound => proxy['ageLowerBound'];

  /**
   * Filters session cookies. Session cookies have no lifetime specified in any
   * of 'max-age' or 'expires' attributes.
   */
  bool get sessionCookie => proxy['sessionCookie'];
}

/**
 * Adds a cookie to the request or overrides a cookie, in case another cookie of
 * the same name exists already. Note that it is preferred to use the Cookies
 * API because this is computationally less expensive.
 * 
 * `instanceType`
 * 
 * `cookie` Cookie to be added to the request. No field may be undefined.
 */
class AddRequestCookie extends ChromeObject {
  static AddRequestCookie create(JsObject proxy) => new AddRequestCookie(proxy);

  AddRequestCookie(JsObject proxy): super(proxy);

  /**
   * Cookie to be added to the request. No field may be undefined.
   */
  RequestCookie get cookie => new RequestCookie(proxy['cookie']);
}

/**
 * Adds a cookie to the response or overrides a cookie, in case another cookie
 * of the same name exists already. Note that it is preferred to use the Cookies
 * API because this is computationally less expensive.
 * 
 * `instanceType`
 * 
 * `cookie` Cookie to be added to the response. The name and value need to be
 * specified.
 */
class AddResponseCookie extends ChromeObject {
  static AddResponseCookie create(JsObject proxy) => new AddResponseCookie(proxy);

  AddResponseCookie(JsObject proxy): super(proxy);

  /**
   * Cookie to be added to the response. The name and value need to be
   * specified.
   */
  ResponseCookie get cookie => new ResponseCookie(proxy['cookie']);
}

/**
 * Edits one or more cookies of request. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 * 
 * `instanceType`
 * 
 * `filter` Filter for cookies that will be modified. All empty entries are
 * ignored.
 * 
 * `modification` Attributes that shall be overridden in cookies that machted
 * the filter. Attributes that are set to an empty string are removed.
 */
class EditRequestCookie extends ChromeObject {
  static EditRequestCookie create(JsObject proxy) => new EditRequestCookie(proxy);

  EditRequestCookie(JsObject proxy): super(proxy);

  /**
   * Filter for cookies that will be modified. All empty entries are ignored.
   */
  RequestCookie get filter => new RequestCookie(proxy['filter']);

  /**
   * Attributes that shall be overridden in cookies that machted the filter.
   * Attributes that are set to an empty string are removed.
   */
  RequestCookie get modification => new RequestCookie(proxy['modification']);
}

/**
 * Edits one or more cookies of response. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 * 
 * `instanceType`
 * 
 * `filter` Filter for cookies that will be modified. All empty entries are
 * ignored.
 * 
 * `modification` Attributes that shall be overridden in cookies that machted
 * the filter. Attributes that are set to an empty string are removed.
 */
class EditResponseCookie extends ChromeObject {
  static EditResponseCookie create(JsObject proxy) => new EditResponseCookie(proxy);

  EditResponseCookie(JsObject proxy): super(proxy);

  /**
   * Filter for cookies that will be modified. All empty entries are ignored.
   */
  FilterResponseCookie get filter => new FilterResponseCookie(proxy['filter']);

  /**
   * Attributes that shall be overridden in cookies that machted the filter.
   * Attributes that are set to an empty string are removed.
   */
  ResponseCookie get modification => new ResponseCookie(proxy['modification']);
}

/**
 * Removes one or more cookies of request. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 * 
 * `instanceType`
 * 
 * `filter` Filter for cookies that will be removed. All empty entries are
 * ignored.
 */
class RemoveRequestCookie extends ChromeObject {
  static RemoveRequestCookie create(JsObject proxy) => new RemoveRequestCookie(proxy);

  RemoveRequestCookie(JsObject proxy): super(proxy);

  /**
   * Filter for cookies that will be removed. All empty entries are ignored.
   */
  RequestCookie get filter => new RequestCookie(proxy['filter']);
}

/**
 * Removes one or more cookies of response. Note that it is preferred to use the
 * Cookies API because this is computationally less expensive.
 * 
 * `instanceType`
 * 
 * `filter` Filter for cookies that will be removed. All empty entries are
 * ignored.
 */
class RemoveResponseCookie extends ChromeObject {
  static RemoveResponseCookie create(JsObject proxy) => new RemoveResponseCookie(proxy);

  RemoveResponseCookie(JsObject proxy): super(proxy);

  /**
   * Filter for cookies that will be removed. All empty entries are ignored.
   */
  FilterResponseCookie get filter => new FilterResponseCookie(proxy['filter']);
}
