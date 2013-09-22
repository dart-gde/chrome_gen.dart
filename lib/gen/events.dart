// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from events.json - do not edit */

/**
 * Use the `chrome.events` API to notify you when something interesting happens.
 */
library chrome.events;

import '../src/common.dart';

/// Accessor for the `chrome.events` namespace.
final ChromeEvents events = new ChromeEvents._();

class ChromeEvents {
  static final JsObject _events = context['chrome']['events'];

  ChromeEvents._();
}

/**
 * Description of a declarative rule for handling events.
 * 
 * `id` Optional identifier that allows referencing this rule.
 * 
 * `tags` Tags can be used to annotate rules and perform operations on sets of
 * rules.
 * 
 * `conditions` List of conditions that can trigger the actions.
 * 
 * `actions` List of actions that are triggered if one of the condtions is
 * fulfilled.
 * 
 * `priority` Optional priority of this rule. Defaults to 100.
 */
class Rule extends ChromeObject {
  static Rule create(JsObject proxy) => new Rule(proxy);

  Rule(JsObject proxy): super(proxy);

  /**
   * Optional identifier that allows referencing this rule.
   */
  String get id => proxy['id'];

  /**
   * Tags can be used to annotate rules and perform operations on sets of rules.
   */
  List<String> get tags => listify(proxy['tags']);

  /**
   * List of conditions that can trigger the actions.
   */
  List<dynamic> get conditions => listify(proxy['conditions']);

  /**
   * List of actions that are triggered if one of the condtions is fulfilled.
   */
  List<dynamic> get actions => listify(proxy['actions']);

  /**
   * Optional priority of this rule. Defaults to 100.
   */
  int get priority => proxy['priority'];
}

/**
 * An object which allows the addition and removal of listeners for a Chrome
 * event.
 */
class Event extends ChromeObject {
  static Event create(JsObject proxy) => new Event(proxy);

  Event(JsObject proxy): super(proxy);
}

/**
 * Filters URLs for various criteria. See [event filtering](#filtered). All
 * criteria are case sensitive.
 * 
 * `hostContains` Matches if the host name of the URL contains a specified
 * string. To test whether a host name component has a prefix 'foo', use
 * hostContains: '.foo'. This matches 'www.foobar.com' and 'foo.com', because an
 * implicit dot is added at the beginning of the host name. Similarly,
 * hostContains can be used to match against component suffix ('foo.') and to
 * exactly match against components ('.foo.'). Suffix- and exact-matching for
 * the last components need to be done separately using hostSuffix, because no
 * implicit dot is added at the end of the host name.
 * 
 * `hostEquals` Matches if the host name of the URL is equal to a specified
 * string.
 * 
 * `hostPrefix` Matches if the host name of the URL starts with a specified
 * string.
 * 
 * `hostSuffix` Matches if the host name of the URL ends with a specified
 * string.
 * 
 * `pathContains` Matches if the path segment of the URL contains a specified
 * string.
 * 
 * `pathEquals` Matches if the path segment of the URL is equal to a specified
 * string.
 * 
 * `pathPrefix` Matches if the path segment of the URL starts with a specified
 * string.
 * 
 * `pathSuffix` Matches if the path segment of the URL ends with a specified
 * string.
 * 
 * `queryContains` Matches if the query segment of the URL contains a specified
 * string.
 * 
 * `queryEquals` Matches if the query segment of the URL is equal to a specified
 * string.
 * 
 * `queryPrefix` Matches if the query segment of the URL starts with a specified
 * string.
 * 
 * `querySuffix` Matches if the query segment of the URL ends with a specified
 * string.
 * 
 * `urlContains` Matches if the URL (without fragment identifier) contains a
 * specified string. Port numbers are stripped from the URL if they match the
 * default port number.
 * 
 * `urlEquals` Matches if the URL (without fragment identifier) is equal to a
 * specified string. Port numbers are stripped from the URL if they match the
 * default port number.
 * 
 * `urlMatches` Matches if the URL (without fragment identifier) matches a
 * specified regular expression. Port numbers are stripped from the URL if they
 * match the default port number. The regular expressions use the [RE2
 * syntax](http://code.google.com/p/re2/wiki/Syntax).
 * 
 * `originAndPathMatches` Matches if the URL without query segment and fragment
 * identifier matches a specified regular expression. Port numbers are stripped
 * from the URL if they match the default port number. The regular expressions
 * use the [RE2 syntax](http://code.google.com/p/re2/wiki/Syntax).
 * 
 * `urlPrefix` Matches if the URL (without fragment identifier) starts with a
 * specified string. Port numbers are stripped from the URL if they match the
 * default port number.
 * 
 * `urlSuffix` Matches if the URL (without fragment identifier) ends with a
 * specified string. Port numbers are stripped from the URL if they match the
 * default port number.
 * 
 * `schemes` Matches if the scheme of the URL is equal to any of the schemes
 * specified in the array.
 * 
 * `ports` Matches if the port of the URL is contained in any of the specified
 * port lists. For example `[80, 443, [1000, 1200]]` matches all requests on
 * port 80, 443 and in the range 1000-1200.
 */
class UrlFilter extends ChromeObject {
  static UrlFilter create(JsObject proxy) => new UrlFilter(proxy);

  UrlFilter(JsObject proxy): super(proxy);

  /**
   * Matches if the host name of the URL contains a specified string. To test
   * whether a host name component has a prefix 'foo', use hostContains: '.foo'.
   * This matches 'www.foobar.com' and 'foo.com', because an implicit dot is
   * added at the beginning of the host name. Similarly, hostContains can be
   * used to match against component suffix ('foo.') and to exactly match
   * against components ('.foo.'). Suffix- and exact-matching for the last
   * components need to be done separately using hostSuffix, because no implicit
   * dot is added at the end of the host name.
   */
  String get hostContains => proxy['hostContains'];

  /**
   * Matches if the host name of the URL is equal to a specified string.
   */
  String get hostEquals => proxy['hostEquals'];

  /**
   * Matches if the host name of the URL starts with a specified string.
   */
  String get hostPrefix => proxy['hostPrefix'];

  /**
   * Matches if the host name of the URL ends with a specified string.
   */
  String get hostSuffix => proxy['hostSuffix'];

  /**
   * Matches if the path segment of the URL contains a specified string.
   */
  String get pathContains => proxy['pathContains'];

  /**
   * Matches if the path segment of the URL is equal to a specified string.
   */
  String get pathEquals => proxy['pathEquals'];

  /**
   * Matches if the path segment of the URL starts with a specified string.
   */
  String get pathPrefix => proxy['pathPrefix'];

  /**
   * Matches if the path segment of the URL ends with a specified string.
   */
  String get pathSuffix => proxy['pathSuffix'];

  /**
   * Matches if the query segment of the URL contains a specified string.
   */
  String get queryContains => proxy['queryContains'];

  /**
   * Matches if the query segment of the URL is equal to a specified string.
   */
  String get queryEquals => proxy['queryEquals'];

  /**
   * Matches if the query segment of the URL starts with a specified string.
   */
  String get queryPrefix => proxy['queryPrefix'];

  /**
   * Matches if the query segment of the URL ends with a specified string.
   */
  String get querySuffix => proxy['querySuffix'];

  /**
   * Matches if the URL (without fragment identifier) contains a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlContains => proxy['urlContains'];

  /**
   * Matches if the URL (without fragment identifier) is equal to a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlEquals => proxy['urlEquals'];

  /**
   * Matches if the URL (without fragment identifier) matches a specified
   * regular expression. Port numbers are stripped from the URL if they match
   * the default port number. The regular expressions use the [RE2
   * syntax](http://code.google.com/p/re2/wiki/Syntax).
   */
  String get urlMatches => proxy['urlMatches'];

  /**
   * Matches if the URL without query segment and fragment identifier matches a
   * specified regular expression. Port numbers are stripped from the URL if
   * they match the default port number. The regular expressions use the [RE2
   * syntax](http://code.google.com/p/re2/wiki/Syntax).
   */
  String get originAndPathMatches => proxy['originAndPathMatches'];

  /**
   * Matches if the URL (without fragment identifier) starts with a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlPrefix => proxy['urlPrefix'];

  /**
   * Matches if the URL (without fragment identifier) ends with a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlSuffix => proxy['urlSuffix'];

  /**
   * Matches if the scheme of the URL is equal to any of the schemes specified
   * in the array.
   */
  List<String> get schemes => listify(proxy['schemes']);

  /**
   * Matches if the port of the URL is contained in any of the specified port
   * lists. For example `[80, 443, [1000, 1200]]` matches all requests on port
   * 80, 443 and in the range 1000-1200.
   */
  List<dynamic> get ports => listify(proxy['ports']);
}
