// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from processes.json - do not edit */

/**
 * Use the `chrome.processes` API to interact with the browser's processes.
 */
library chrome.processes;

import '../src/common.dart';

/// Accessor for the `chrome.processes` namespace.
final ChromeProcesses processes = new ChromeProcesses._();

class ChromeProcesses {
  JsObject _processes;

  ChromeProcesses._() {
    _processes = context['chrome']['processes'];
  }

  /**
   * Terminates the specified renderer process. Equivalent to visiting
   * about:crash, but without changing the tab's URL.
   * 
   * [processId] The ID of the process to be terminated.
   * 
   * Returns:
   * True if terminating the process was successful, otherwise false.
   */
  Future<bool> terminate(int processId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _processes.callMethod('terminate', [processId, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the ID of the renderer process for the specified tab.
   * 
   * [tabId] The ID of the tab for which the renderer process ID is to be
   * returned.
   * 
   * Returns:
   * Process ID of the tab's renderer process.
   */
  Future<int> getProcessIdForTab(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _processes.callMethod('getProcessIdForTab', [tabId, completer.callback]);
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
   * Returns:
   * A dictionary of Process objects for each requested process that is a live
   * child process of the current browser process, indexed by process ID.
   * Metrics requiring aggregation over time will not be populated in each
   * Process object.
   */
  Future<dynamic> getProcessInfo(var processIds, bool includeMemory) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _processes.callMethod('getProcessInfo', [processIds, includeMemory, completer.callback]);
    return completer.future;
  }

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID.
   */
  Stream<dynamic> get onUpdated => _onUpdated.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onUpdated = null;

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID. Identical
   * to onUpdate, with the addition of memory usage details included in each
   * Process object. Note, collecting memory usage information incurs extra CPU
   * usage and should only be listened for when needed.
   */
  Stream<dynamic> get onUpdatedWithMemory => _onUpdatedWithMemory.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onUpdatedWithMemory = null;

  /**
   * Fired each time a process is created, providing the corrseponding Process
   * object.
   */
  Stream<dynamic> get onCreated => _onCreated.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onCreated = null;

  /**
   * Fired each time a process becomes unresponsive, providing the corrseponding
   * Process object.
   */
  Stream<dynamic> get onUnresponsive => _onUnresponsive.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onUnresponsive = null;

  /**
   * Fired each time a process is terminated, providing the type of exit.
   */
  Stream<dynamic> get onExited => _onExited.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onExited = null;
}

/**
 * An object containing information about one of the browser's processes.
 */
class Process extends ChromeObject {
  static Process create(JsObject proxy) => new Process(proxy);

  Process(JsObject proxy): super(proxy);

  /**
   * Unique ID of the process provided by the browser.
   */
  int get id => this.proxy['id'];

  /**
   * The ID of the process, as provided by the OS.
   */
  int get osProcessId => this.proxy['osProcessId'];

  /**
   * The type of process.
   */
  String get type => this.proxy['type'];

  /**
   * The profile which the process is associated with.
   */
  String get profile => this.proxy['profile'];

  /**
   * Array of Tab IDs that have a page rendered by this process. The list will
   * be non-empty for renderer processes only.
   */
  List<int> get tabs => listify(this.proxy['tabs']);

  /**
   * The most recent measurement of the process CPU usage, between 0 and 100%.
   * Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get cpu => this.proxy['cpu'];

  /**
   * The most recent measurement of the process network usage, in bytes per
   * second. Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get network => this.proxy['network'];

  /**
   * The most recent measurement of the process private memory usage, in bytes.
   * Only available when receiving the object as part of a callback from
   * onUpdatedWithMemory or getProcessInfo with the includeMemory flag.
   */
  dynamic get privateMemory => this.proxy['privateMemory'];

  /**
   * The most recent measurement of the process JavaScript allocated memory, in
   * bytes. Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get jsMemoryAllocated => this.proxy['jsMemoryAllocated'];

  /**
   * The most recent measurement of the process JavaScript memory used, in
   * bytes. Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get jsMemoryUsed => this.proxy['jsMemoryUsed'];

  /**
   * The most recent measurement of the process’s SQLite memory usage, in bytes.
   * Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get sqliteMemory => this.proxy['sqliteMemory'];

  /**
   * The most recent measurement of the process frames per second. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  dynamic get fps => this.proxy['fps'];

  /**
   * The most recent information about the image cache for the process. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  Cache get imageCache => new Cache(this.proxy['imageCache']);

  /**
   * The most recent information about the script cache for the process. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  Cache get scriptCache => new Cache(this.proxy['scriptCache']);

  /**
   * The most recent information about the CSS cache for the process. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  Cache get cssCache => new Cache(this.proxy['cssCache']);
}

/**
 * The Cache object contains information about the size and utilization of a
 * cache used by the browser.
 */
class Cache extends ChromeObject {
  static Cache create(JsObject proxy) => new Cache(proxy);

  Cache(JsObject proxy): super(proxy);

  /**
   * The size of the cache, in bytes.
   */
  dynamic get size => this.proxy['size'];

  /**
   * The part of the cache that is utilized, in bytes.
   */
  dynamic get liveSize => this.proxy['liveSize'];
}
