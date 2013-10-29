/* This file has been generated from events.json - do not edit */

/**
 * Use the `chrome.events` API to notify you when something interesting happens.
 */
library chrome.events;

import '../src/common.dart';

/**
 * Accessor for the `chrome.events` namespace.
 */
final ChromeEvents events = new ChromeEvents._();

class ChromeEvents extends ChromeApi {
  static final JsObject _events = chrome['events'];

  ChromeEvents._();

  bool get available => _events != null;

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.events' is not available");
  }
}

/**
 * Description of a declarative rule for handling events.
 */
class Rule extends ChromeObject {
  Rule({String id, List<String> tags, List<dynamic> conditions, List<dynamic> actions, int priority}) {
    if (id != null) this.id = id;
    if (tags != null) this.tags = tags;
    if (conditions != null) this.conditions = conditions;
    if (actions != null) this.actions = actions;
    if (priority != null) this.priority = priority;
  }
  Rule.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Optional identifier that allows referencing this rule.
   */
  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  /**
   * Tags can be used to annotate rules and perform operations on sets of rules.
   */
  List<String> get tags => listify(proxy['tags']);
  set tags(List<String> value) => proxy['tags'] = jsify(value);

  /**
   * List of conditions that can trigger the actions.
   */
  List<dynamic> get conditions => listify(proxy['conditions']);
  set conditions(List<dynamic> value) => proxy['conditions'] = jsify(value);

  /**
   * List of actions that are triggered if one of the condtions is fulfilled.
   */
  List<dynamic> get actions => listify(proxy['actions']);
  set actions(List<dynamic> value) => proxy['actions'] = jsify(value);

  /**
   * Optional priority of this rule. Defaults to 100.
   */
  int get priority => proxy['priority'];
  set priority(int value) => proxy['priority'] = value;
}

/**
 * An object which allows the addition and removal of listeners for a Chrome
 * event.
 */
class Event extends ChromeObject {
  Event();
  Event.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Registers an event listener _callback_ to an event.
   */
  Future addListener() {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('addListener', [completer.callback]);
    return completer.future;
  }

  /**
   * Deregisters an event listener _callback_ from an event.
   */
  Future removeListener() {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('removeListener', [completer.callback]);
    return completer.future;
  }

  bool hasListener(dynamic callback) {
    return proxy.callMethod('hasListener', [jsify(callback)]);
  }

  bool hasListeners() {
    return proxy.callMethod('hasListeners');
  }

  /**
   * Registers rules to handle events.
   * 
   * [eventName] Name of the event this function affects.
   * 
   * [rules] Rules to be registered. These do not replace previously registered
   * rules.
   * 
   * Returns:
   * Rules that were registered, the optional parameters are filled with values.
   */
  Future<List<Rule>> addRules(String eventName, List<Rule> rules) {
    var completer = new ChromeCompleter<List<Rule>>.oneArg((e) => listify(e, _createRule));
    proxy.callMethod('addRules', [eventName, jsify(rules), completer.callback]);
    return completer.future;
  }

  /**
   * Returns currently registered rules.
   * 
   * [eventName] Name of the event this function affects.
   * 
   * [ruleIdentifiers] If an array is passed, only rules with identifiers
   * contained in this array are returned.
   * 
   * Returns:
   * Rules that were registered, the optional parameters are filled with values.
   */
  Future<List<Rule>> getRules(String eventName, [List<String> ruleIdentifiers]) {
    var completer = new ChromeCompleter<List<Rule>>.oneArg((e) => listify(e, _createRule));
    proxy.callMethod('getRules', [eventName, jsify(ruleIdentifiers), completer.callback]);
    return completer.future;
  }

  /**
   * Unregisters currently registered rules.
   * 
   * [eventName] Name of the event this function affects.
   * 
   * [ruleIdentifiers] If an array is passed, only rules with identifiers
   * contained in this array are unregistered.
   */
  Future removeRules(String eventName, [List<String> ruleIdentifiers]) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('removeRules', [eventName, jsify(ruleIdentifiers), completer.callback]);
    return completer.future;
  }
}

/**
 * Filters URLs for various criteria. See [event filtering](#filtered). All
 * criteria are case sensitive.
 */
class UrlFilter extends ChromeObject {
  UrlFilter({String hostContains, String hostEquals, String hostPrefix, String hostSuffix, String pathContains, String pathEquals, String pathPrefix, String pathSuffix, String queryContains, String queryEquals, String queryPrefix, String querySuffix, String urlContains, String urlEquals, String urlMatches, String originAndPathMatches, String urlPrefix, String urlSuffix, List<String> schemes, List<dynamic> ports}) {
    if (hostContains != null) this.hostContains = hostContains;
    if (hostEquals != null) this.hostEquals = hostEquals;
    if (hostPrefix != null) this.hostPrefix = hostPrefix;
    if (hostSuffix != null) this.hostSuffix = hostSuffix;
    if (pathContains != null) this.pathContains = pathContains;
    if (pathEquals != null) this.pathEquals = pathEquals;
    if (pathPrefix != null) this.pathPrefix = pathPrefix;
    if (pathSuffix != null) this.pathSuffix = pathSuffix;
    if (queryContains != null) this.queryContains = queryContains;
    if (queryEquals != null) this.queryEquals = queryEquals;
    if (queryPrefix != null) this.queryPrefix = queryPrefix;
    if (querySuffix != null) this.querySuffix = querySuffix;
    if (urlContains != null) this.urlContains = urlContains;
    if (urlEquals != null) this.urlEquals = urlEquals;
    if (urlMatches != null) this.urlMatches = urlMatches;
    if (originAndPathMatches != null) this.originAndPathMatches = originAndPathMatches;
    if (urlPrefix != null) this.urlPrefix = urlPrefix;
    if (urlSuffix != null) this.urlSuffix = urlSuffix;
    if (schemes != null) this.schemes = schemes;
    if (ports != null) this.ports = ports;
  }
  UrlFilter.fromProxy(JsObject proxy): super.fromProxy(proxy);

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
  set hostContains(String value) => proxy['hostContains'] = value;

  /**
   * Matches if the host name of the URL is equal to a specified string.
   */
  String get hostEquals => proxy['hostEquals'];
  set hostEquals(String value) => proxy['hostEquals'] = value;

  /**
   * Matches if the host name of the URL starts with a specified string.
   */
  String get hostPrefix => proxy['hostPrefix'];
  set hostPrefix(String value) => proxy['hostPrefix'] = value;

  /**
   * Matches if the host name of the URL ends with a specified string.
   */
  String get hostSuffix => proxy['hostSuffix'];
  set hostSuffix(String value) => proxy['hostSuffix'] = value;

  /**
   * Matches if the path segment of the URL contains a specified string.
   */
  String get pathContains => proxy['pathContains'];
  set pathContains(String value) => proxy['pathContains'] = value;

  /**
   * Matches if the path segment of the URL is equal to a specified string.
   */
  String get pathEquals => proxy['pathEquals'];
  set pathEquals(String value) => proxy['pathEquals'] = value;

  /**
   * Matches if the path segment of the URL starts with a specified string.
   */
  String get pathPrefix => proxy['pathPrefix'];
  set pathPrefix(String value) => proxy['pathPrefix'] = value;

  /**
   * Matches if the path segment of the URL ends with a specified string.
   */
  String get pathSuffix => proxy['pathSuffix'];
  set pathSuffix(String value) => proxy['pathSuffix'] = value;

  /**
   * Matches if the query segment of the URL contains a specified string.
   */
  String get queryContains => proxy['queryContains'];
  set queryContains(String value) => proxy['queryContains'] = value;

  /**
   * Matches if the query segment of the URL is equal to a specified string.
   */
  String get queryEquals => proxy['queryEquals'];
  set queryEquals(String value) => proxy['queryEquals'] = value;

  /**
   * Matches if the query segment of the URL starts with a specified string.
   */
  String get queryPrefix => proxy['queryPrefix'];
  set queryPrefix(String value) => proxy['queryPrefix'] = value;

  /**
   * Matches if the query segment of the URL ends with a specified string.
   */
  String get querySuffix => proxy['querySuffix'];
  set querySuffix(String value) => proxy['querySuffix'] = value;

  /**
   * Matches if the URL (without fragment identifier) contains a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlContains => proxy['urlContains'];
  set urlContains(String value) => proxy['urlContains'] = value;

  /**
   * Matches if the URL (without fragment identifier) is equal to a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlEquals => proxy['urlEquals'];
  set urlEquals(String value) => proxy['urlEquals'] = value;

  /**
   * Matches if the URL (without fragment identifier) matches a specified
   * regular expression. Port numbers are stripped from the URL if they match
   * the default port number. The regular expressions use the [RE2
   * syntax](http://code.google.com/p/re2/wiki/Syntax).
   */
  String get urlMatches => proxy['urlMatches'];
  set urlMatches(String value) => proxy['urlMatches'] = value;

  /**
   * Matches if the URL without query segment and fragment identifier matches a
   * specified regular expression. Port numbers are stripped from the URL if
   * they match the default port number. The regular expressions use the [RE2
   * syntax](http://code.google.com/p/re2/wiki/Syntax).
   */
  String get originAndPathMatches => proxy['originAndPathMatches'];
  set originAndPathMatches(String value) => proxy['originAndPathMatches'] = value;

  /**
   * Matches if the URL (without fragment identifier) starts with a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlPrefix => proxy['urlPrefix'];
  set urlPrefix(String value) => proxy['urlPrefix'] = value;

  /**
   * Matches if the URL (without fragment identifier) ends with a specified
   * string. Port numbers are stripped from the URL if they match the default
   * port number.
   */
  String get urlSuffix => proxy['urlSuffix'];
  set urlSuffix(String value) => proxy['urlSuffix'] = value;

  /**
   * Matches if the scheme of the URL is equal to any of the schemes specified
   * in the array.
   */
  List<String> get schemes => listify(proxy['schemes']);
  set schemes(List<String> value) => proxy['schemes'] = jsify(value);

  /**
   * Matches if the port of the URL is contained in any of the specified port
   * lists. For example `[80, 443, [1000, 1200]]` matches all requests on port
   * 80, 443 and in the range 1000-1200.
   */
  List<dynamic> get ports => listify(proxy['ports']);
  set ports(List<dynamic> value) => proxy['ports'] = jsify(value);
}

Rule _createRule(JsObject proxy) => proxy == null ? null : new Rule.fromProxy(proxy);
