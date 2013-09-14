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
   * 
   * [callback] Called once the attach operation succeeds or fails. Callback
   * receives no arguments. If the attach fails, [runtime.lastError] will be set
   * to the error message.
   */
  Future attach(var target, String requiredVersion) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['debugger'].callMethod('attach', [target, requiredVersion, completer.callback]);
    return completer.future;
  }

  /**
   * Detaches debugger from the given target.
   * 
   * [target] Debugging target from which you want to detach.
   * 
   * [callback] Called once the detach operation succeeds or fails. Callback
   * receives no arguments. If the detach fails, [runtime.lastError] will be set
   * to the error message.
   */
  Future detach(var target) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['debugger'].callMethod('detach', [target, completer.callback]);
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
   * [callback] Response body. If an error occurs while posting the message, the
   * callback will be called with no arguments and [runtime.lastError] will be
   * set to the error message.
   */
  Future<dynamic> sendCommand(var target, String method, var commandParams) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['debugger'].callMethod('sendCommand', [target, method, commandParams, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the list of available debug targets.
   */
  Future<dynamic> getTargets() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['debugger'].callMethod('getTargets', [completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onEvent = null;

  /**
   * Fired whenever debugging target issues instrumentation event.
   */
  Stream get onEvent => _onEvent.stream;

  final ChromeStreamController _onDetach = null;

  /**
   * Fired when browser terminates debugging session for the tab. This happens
   * when either the tab is being closed or Chrome DevTools is being invoked for
   * the attached tab.
   */
  Stream get onDetach => _onDetach.stream;
}
