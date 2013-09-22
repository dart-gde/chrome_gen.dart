// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
  JsObject _debugger;

  ChromeDebugger._() {
    _debugger = context['chrome']['debugger'];
  }

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
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _debugger.callMethod('attach', [target, requiredVersion, completer.callback]);
    return completer.future;
  }

  /**
   * Detaches debugger from the given target.
   * 
   * [target] Debugging target from which you want to detach.
   */
  Future detach(Debuggee target) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
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
  Future<dynamic> sendCommand(Debuggee target, String method, [var commandParams]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _debugger.callMethod('sendCommand', [target, method, commandParams, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the list of available debug targets.
   * 
   * Returns:
   * Array of TargetInfo objects corresponding to the available debug targets.
   */
  Future<List<TargetInfo>> getTargets() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _debugger.callMethod('getTargets', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired whenever debugging target issues instrumentation event.
   */
  Stream<dynamic> get onEvent => _onEvent.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onEvent = null;

  /**
   * Fired when browser terminates debugging session for the tab. This happens
   * when either the tab is being closed or Chrome DevTools is being invoked for
   * the attached tab.
   */
  Stream<dynamic> get onDetach => _onDetach.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onDetach = null;
}

/**
 * Debuggee identifier. Either tabId or extensionId must be specified
 */
class Debuggee extends ChromeObject {
  static Debuggee create(JsObject proxy) => new Debuggee(proxy);

  Debuggee(JsObject proxy): super(proxy);

  /**
   * The id of the tab which you intend to debug.
   */
  int get tabId => this.proxy['tabId'];

  /**
   * The id of the extension which you intend to debug. Attaching to an
   * extension background page is only possible when 'enable-silent-debugging'
   * flag is enabled on the target browser.
   */
  String get extensionId => this.proxy['extensionId'];

  /**
   * The opaque id of the debug target.
   */
  String get targetId => this.proxy['targetId'];
}

/**
 * Debug target information
 */
class TargetInfo extends ChromeObject {
  static TargetInfo create(JsObject proxy) => new TargetInfo(proxy);

  TargetInfo(JsObject proxy): super(proxy);

  /**
   * Target type.
   */
  String get type => this.proxy['type'];

  /**
   * Target id.
   */
  String get id => this.proxy['id'];

  /**
   * The tab id, defined if type == 'page'.
   */
  int get tabId => this.proxy['tabId'];

  /**
   * The extension id, defined if type = 'background_page'.
   */
  String get extensionId => this.proxy['extensionId'];

  /**
   * True if debugger is already attached.
   */
  bool get attached => this.proxy['attached'];

  /**
   * Target page title.
   */
  String get title => this.proxy['title'];

  /**
   * Target URL.
   */
  String get url => this.proxy['url'];

  /**
   * Target favicon URL.
   */
  String get faviconUrl => this.proxy['faviconUrl'];
}
