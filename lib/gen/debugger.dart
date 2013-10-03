/* This file has been generated from debugger.json - do not edit */

/**
 * The `chrome.debugger` API serves as an alternate transport for Chrome's
 * [remote debugging
 * protocol](http://code.google.com/chrome/devtools/docs/remote-debugging.html).
 * Use `chrome.debugger` to attach to one or more tabs to instrument network
 * interaction, debug JavaScript, mutate the DOM and CSS, etc. Use the Debuggee
 * `tabId` to target tabs with sendCommand and route events by `tabId` from
 * onEvent callbacks.
 */
library chrome.debugger;

import '../src/common.dart';

/// Accessor for the `chrome.debugger` namespace.
final ChromeDebugger debugger = new ChromeDebugger._();

class ChromeDebugger {
  static final JsObject _debugger = context['chrome']['debugger'];

  ChromeDebugger._();

  /**
   * Attaches debugger to the given target.
   * 
   * [target] Debugging target to which you want to attach.
   * 
   * [requiredVersion] Required debugging protocol version ("0.1"). One can only
   * attach to the debuggee with matching major version and greater or equal
   * minor version. List of the protocol versions can be obtained
   * [here](http://code.google.com/chrome/devtools/docs/remote-debugging.html).
   */
  Future attach(Debuggee target, String requiredVersion) {
    var completer = new ChromeCompleter.noArgs();
    _debugger.callMethod('attach', [target, requiredVersion, completer.callback]);
    return completer.future;
  }

  /**
   * Detaches debugger from the given target.
   * 
   * [target] Debugging target from which you want to detach.
   */
  Future detach(Debuggee target) {
    var completer = new ChromeCompleter.noArgs();
    _debugger.callMethod('detach', [target, completer.callback]);
    return completer.future;
  }

  /**
   * Sends given command to the debugging target.
   * 
   * [target] Debugging target to which you want to send the command.
   * 
   * [method] Method name. Should be one of the methods defined by the [remote
   * debugging
   * protocol](http://code.google.com/chrome/devtools/docs/remote-debugging.html).
   * 
   * [commandParams] JSON object with request parameters. This object must
   * conform to the remote debugging params scheme for given method.
   * 
   * Returns:
   * JSON object with the response. Structure of the response varies depending
   * on the method and is defined by the remote debugging protocol.
   */
  Future<Map<String, dynamic>> sendCommand(Debuggee target, String method, [Map<String, dynamic> commandParams]) {
    var completer = new ChromeCompleter<Map<String, dynamic>>.oneArg(mapify);
    _debugger.callMethod('sendCommand', [target, method, jsify(commandParams), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the list of available debug targets.
   * 
   * Returns:
   * Array of TargetInfo objects corresponding to the available debug targets.
   */
  Future<List<TargetInfo>> getTargets() {
    var completer = new ChromeCompleter<List<TargetInfo>>.oneArg((e) => listify(e, TargetInfo.create));
    _debugger.callMethod('getTargets', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired whenever debugging target issues instrumentation event.
   */
  Stream<OnEventEvent> get onEvent => _onEvent.stream;

  final ChromeStreamController<OnEventEvent> _onEvent =
      new ChromeStreamController<OnEventEvent>.threeArgs(_debugger['onEvent'], OnEventEvent.create);

  /**
   * Fired when browser terminates debugging session for the tab. This happens
   * when either the tab is being closed or Chrome DevTools is being invoked for
   * the attached tab.
   */
  Stream<OnDetachEvent> get onDetach => _onDetach.stream;

  final ChromeStreamController<OnDetachEvent> _onDetach =
      new ChromeStreamController<OnDetachEvent>.twoArgs(_debugger['onDetach'], OnDetachEvent.create);
}

/**
 * Fired whenever debugging target issues instrumentation event.
 */
class OnEventEvent {
  static OnEventEvent create(JsObject source, String method, JsObject params) =>
      new OnEventEvent(Debuggee.create(source), method, mapify(params));

  /**
   * The debuggee that generated this event.
   */
  final Debuggee source;

  /**
   * Method name. Should be one of the notifications defined by the [remote
   * debugging
   * protocol](http://code.google.com/chrome/devtools/docs/remote-debugging.html).
   */
  final String method;

  /**
   * JSON object with the response. Structure of the response varies depending
   * on the method and is defined by the remote debugging protocol.
   * `optional`
   * 
   * JSON object with the response. Structure of the response varies depending
   * on the method and is defined by the remote debugging protocol.
   */
  final Map<String, dynamic> params;

  OnEventEvent(this.source, this.method, this.params);
}

/**
 * Fired when browser terminates debugging session for the tab. This happens
 * when either the tab is being closed or Chrome DevTools is being invoked for
 * the attached tab.
 */
class OnDetachEvent {
  static OnDetachEvent create(JsObject source, String reason) =>
      new OnDetachEvent(Debuggee.create(source), reason);

  /**
   * The debuggee that was detached.
   */
  final Debuggee source;

  /**
   * Connection termination reason.
   * enum of `target_closed`, `canceled_by_user`, `replaced_with_devtools`
   */
  final String reason;

  OnDetachEvent(this.source, this.reason);
}

/**
 * Debuggee identifier. Either tabId or extensionId must be specified
 */
class Debuggee extends ChromeObject {
  static Debuggee create(JsObject proxy) => proxy == null ? null : new Debuggee.fromProxy(proxy);

  Debuggee({int tabId, String extensionId, String targetId}) {
    if (tabId != null) this.tabId = tabId;
    if (extensionId != null) this.extensionId = extensionId;
    if (targetId != null) this.targetId = targetId;
  }

  Debuggee.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The id of the tab which you intend to debug.
   */
  int get tabId => proxy['tabId'];
  set tabId(int value) => proxy['tabId'] = value;

  /**
   * The id of the extension which you intend to debug. Attaching to an
   * extension background page is only possible when 'enable-silent-debugging'
   * flag is enabled on the target browser.
   */
  String get extensionId => proxy['extensionId'];
  set extensionId(String value) => proxy['extensionId'] = value;

  /**
   * The opaque id of the debug target.
   */
  String get targetId => proxy['targetId'];
  set targetId(String value) => proxy['targetId'] = value;
}

/**
 * Debug target information
 */
class TargetInfo extends ChromeObject {
  static TargetInfo create(JsObject proxy) => proxy == null ? null : new TargetInfo.fromProxy(proxy);

  TargetInfo({String type, String id, int tabId, String extensionId, bool attached, String title, String url, String faviconUrl}) {
    if (type != null) this.type = type;
    if (id != null) this.id = id;
    if (tabId != null) this.tabId = tabId;
    if (extensionId != null) this.extensionId = extensionId;
    if (attached != null) this.attached = attached;
    if (title != null) this.title = title;
    if (url != null) this.url = url;
    if (faviconUrl != null) this.faviconUrl = faviconUrl;
  }

  TargetInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Target type.
   * enum of `page`, `background_page`, `worker`, `other`
   */
  String get type => proxy['type'];
  set type(String value) => proxy['type'] = value;

  /**
   * Target id.
   */
  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  /**
   * The tab id, defined if type == 'page'.
   */
  int get tabId => proxy['tabId'];
  set tabId(int value) => proxy['tabId'] = value;

  /**
   * The extension id, defined if type = 'background_page'.
   */
  String get extensionId => proxy['extensionId'];
  set extensionId(String value) => proxy['extensionId'] = value;

  /**
   * True if debugger is already attached.
   */
  bool get attached => proxy['attached'];
  set attached(bool value) => proxy['attached'] = value;

  /**
   * Target page title.
   */
  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  /**
   * Target URL.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  /**
   * Target favicon URL.
   */
  String get faviconUrl => proxy['faviconUrl'];
  set faviconUrl(String value) => proxy['faviconUrl'] = value;
}
