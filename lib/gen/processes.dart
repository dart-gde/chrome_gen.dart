// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from processes.json - do not edit */

/// Use the `chrome.processes` API to interact with the browser's processes.
library chrome.processes;

import '../src/common.dart';

/// Accessor for the `chrome.processes` namespace.
final ChromeProcesses processes = new ChromeProcesses._();

class ChromeProcesses {
  ChromeProcesses._();

  /**
   * Terminates the specified renderer process. Equivalent to visiting
   * about:crash, but without changing the tab's URL.
   * 
   * [processId] The ID of the process to be terminated.
   */
  Future<bool> terminate(int processId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['processes'].callMethod('terminate', [processId, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the ID of the renderer process for the specified tab.
   * 
   * [tabId] The ID of the tab for which the renderer process ID is to be
   * returned.
   */
  Future<int> getProcessIdForTab(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    chrome['processes'].callMethod('getProcessIdForTab', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the process information for each process ID specified.
   * 
   * [processIds] The list of process IDs or single process ID for which to
   * return the process information. An empty list indicates all processes are
   * requested.
   * 
   * [includeMemory] True if detailed memory usage is required. Note, collecting
   * memory usage information incurs extra CPU usage and should only be queried
   * for when needed.
   * 
   * [callback] Called when the processes information is collected.
   */
  Future<dynamic> getProcessInfo(var processIds, bool includeMemory) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['processes'].callMethod('getProcessInfo', [processIds, includeMemory, completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onUpdated = null;

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID.
   */
  Stream get onUpdated => _onUpdated.stream;

  final ChromeStreamController _onUpdatedWithMemory = null;

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID. Identical
   * to onUpdate, with the addition of memory usage details included in each
   * Process object. Note, collecting memory usage information incurs extra CPU
   * usage and should only be listened for when needed.
   */
  Stream get onUpdatedWithMemory => _onUpdatedWithMemory.stream;

  final ChromeStreamController _onCreated = null;

  /**
   * Fired each time a process is created, providing the corrseponding Process
   * object.
   */
  Stream get onCreated => _onCreated.stream;

  final ChromeStreamController _onUnresponsive = null;

  /**
   * Fired each time a process becomes unresponsive, providing the corrseponding
   * Process object.
   */
  Stream get onUnresponsive => _onUnresponsive.stream;

  final ChromeStreamController _onExited = null;

  /**
   * Fired each time a process is terminated, providing the type of exit.
   */
  Stream get onExited => _onExited.stream;
}
