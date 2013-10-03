/* This file has been generated from sessions.json - do not edit */

/**
 * Use the `chrome.sessions` API to query and restore tabs and windows from a
 * browsing session.
 */
library chrome.sessions;

import 'tabs.dart';
import 'windows.dart';
import '../src/common.dart';

/// Accessor for the `chrome.sessions` namespace.
final ChromeSessions sessions = new ChromeSessions._();

class ChromeSessions {
  static final JsObject _sessions = context['chrome']['sessions'];

  ChromeSessions._();

  /**
   * The maximum number of [Session] that will be included in a requested list.
   */
  int get MAX_SESSION_RESULTS => _sessions['MAX_SESSION_RESULTS'];

  /**
   * Gets the list of recently closed tabs and/or windows.
   * 
   * Returns:
   * The list of closed entries in reverse order that they were closed (the most
   * recently closed tab or window will be at index `0`).The entries may contain
   * either tabs or windows.
   */
  Future<List<Session>> getRecentlyClosed([Filter filter]) {
    var completer = new ChromeCompleter<List<Session>>.oneArg((e) => listify(e, _createSession));
    _sessions.callMethod('getRecentlyClosed', [filter, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves all devices with synced sessions.
   * 
   * Returns:
   * The list of [Device] objects for each synced session, sorted in order from
   * device with most recently modified session to device with least recently
   * modified session. [tabs.Tab] objects are sorted by recency in the
   * [windows.Window] of the [Session] objects.
   */
  Future<List<Device>> getDevices([Filter filter]) {
    var completer = new ChromeCompleter<List<Device>>.oneArg((e) => listify(e, _createDevice));
    _sessions.callMethod('getDevices', [filter, completer.callback]);
    return completer.future;
  }

  /**
   * Reopens a [windows.Window] or [tabs.Tab], with an optional callback to run
   * when the entry has been restored.
   * 
   * [sessionId] The [windows.Window.sessionId], or [tabs.Tab.sessionId] to
   * restore.
   * 
   * Returns:
   * A [Session] containing the restored [windows.Window] or [tabs.Tab] object.
   */
  Future<Session> restore([String sessionId]) {
    var completer = new ChromeCompleter<Session>.oneArg(_createSession);
    _sessions.callMethod('restore', [sessionId, completer.callback]);
    return completer.future;
  }
}

class Filter extends ChromeObject {

  Filter({int maxResults}) {
    if (maxResults != null) this.maxResults = maxResults;
  }

  Filter.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The maximum number of entries to be fetched in the requested list. Omit
   * this parameter to fetch the maximum number of entries
   * ([MAX_SESSION_RESULTS]).
   */
  int get maxResults => proxy['maxResults'];
  set maxResults(int value) => proxy['maxResults'] = value;
}

class Session extends ChromeObject {

  Session({int lastModified, Tab tab, Window window}) {
    if (lastModified != null) this.lastModified = lastModified;
    if (tab != null) this.tab = tab;
    if (window != null) this.window = window;
  }

  Session.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The time when the window or tab was closed or modified, represented in
   * milliseconds since the epoch.
   */
  int get lastModified => proxy['lastModified'];
  set lastModified(int value) => proxy['lastModified'] = value;

  /**
   * The [tabs.Tab], if this entry describes a tab. Either this or
   * [Session.window] will be set.
   */
  Tab get tab => _createTab(proxy['tab']);
  set tab(Tab value) => proxy['tab'] = value;

  /**
   * The [windows.Window], if this entry describes a window. Either this or
   * [Session.tab] will be set.
   */
  Window get window => _createWindow(proxy['window']);
  set window(Window value) => proxy['window'] = value;
}

class Device extends ChromeObject {

  Device({String info, List<Session> sessions}) {
    if (info != null) this.info = info;
    if (sessions != null) this.sessions = sessions;
  }

  Device.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Represents all information about a foreign device.
   */
  String get info => proxy['info'];
  set info(String value) => proxy['info'] = value;

  /**
   * A list of open window sessions for the foreign device, sorted from most
   * recently to least recently modified session.
   */
  List<Session> get sessions => listify(proxy['sessions'], _createSession);
  set sessions(List<Session> value) => proxy['sessions'] = value;
}

Session _createSession(JsObject proxy) => proxy == null ? null : new Session.fromProxy(proxy);
Device _createDevice(JsObject proxy) => proxy == null ? null : new Device.fromProxy(proxy);
Tab _createTab(JsObject proxy) => proxy == null ? null : new Tab.fromProxy(proxy);
Window _createWindow(JsObject proxy) => proxy == null ? null : new Window.fromProxy(proxy);
