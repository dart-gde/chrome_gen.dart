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
  Future terminate(int processId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['processes'].callMethod('terminate', [processId, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the ID of the renderer process for the specified tab.
   * 
   * [tabId] The ID of the tab for which the renderer process ID is to be
   * returned.
   */
  Future getProcessIdForTab(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
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
  Future getProcessInfo(var processIds, bool includeMemory) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['processes'].callMethod('getProcessInfo', [processIds, includeMemory, completer.callback]);
    return completer.future;
  }

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID.
   */
  Stream get onUpdated => null;

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID. Identical
   * to onUpdate, with the addition of memory usage details included in each
   * Process object. Note, collecting memory usage information incurs extra CPU
   * usage and should only be listened for when needed.
   */
  Stream get onUpdatedWithMemory => null;

  /**
   * Fired each time a process is created, providing the corrseponding Process
   * object.
   */
  Stream get onCreated => null;

  /**
   * Fired each time a process becomes unresponsive, providing the corrseponding
   * Process object.
   */
  Stream get onUnresponsive => null;

  /**
   * Fired each time a process is terminated, providing the type of exit.
   */
  Stream get onExited => null;
}