/* This file has been generated from processes.json - do not edit */

/**
 * Use the `chrome.processes` API to interact with the browser's processes.
 */
library chrome.processes;

import '../src/common.dart';

/// Accessor for the `chrome.processes` namespace.
final ChromeProcesses processes = new ChromeProcesses._();

class ChromeProcesses {
  static final JsObject _processes = context['chrome']['processes'];

  ChromeProcesses._();

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
  Future<Map> getProcessInfo(var processIds, bool includeMemory) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(mapify);
    _processes.callMethod('getProcessInfo', [processIds, includeMemory, completer.callback]);
    return completer.future;
  }

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID.
   */
  Stream<Map> get onUpdated => _onUpdated.stream;

  final ChromeStreamController<Map> _onUpdated =
      new ChromeStreamController<Map>.oneArg(_processes['onUpdated'], mapify);

  /**
   * Fired each time the Task Manager updates its process statistics, providing
   * the dictionary of updated Process objects, indexed by process ID. Identical
   * to onUpdate, with the addition of memory usage details included in each
   * Process object. Note, collecting memory usage information incurs extra CPU
   * usage and should only be listened for when needed.
   */
  Stream<Map> get onUpdatedWithMemory => _onUpdatedWithMemory.stream;

  final ChromeStreamController<Map> _onUpdatedWithMemory =
      new ChromeStreamController<Map>.oneArg(_processes['onUpdatedWithMemory'], mapify);

  /**
   * Fired each time a process is created, providing the corrseponding Process
   * object.
   */
  Stream<Process> get onCreated => _onCreated.stream;

  final ChromeStreamController<Process> _onCreated =
      new ChromeStreamController<Process>.oneArg(_processes['onCreated'], Process.create);

  /**
   * Fired each time a process becomes unresponsive, providing the corrseponding
   * Process object.
   */
  Stream<Process> get onUnresponsive => _onUnresponsive.stream;

  final ChromeStreamController<Process> _onUnresponsive =
      new ChromeStreamController<Process>.oneArg(_processes['onUnresponsive'], Process.create);

  /**
   * Fired each time a process is terminated, providing the type of exit.
   */
  Stream<OnExitedEvent> get onExited => _onExited.stream;

  final ChromeStreamController<OnExitedEvent> _onExited =
      new ChromeStreamController<OnExitedEvent>.threeArgs(_processes['onExited'], OnExitedEvent.create);
}

/**
 * Fired each time a process is terminated, providing the type of exit.
 */
class OnExitedEvent {
  static OnExitedEvent create(int processId, int exitType, int exitCode) =>
      new OnExitedEvent(processId, exitType, exitCode);

  /**
   * The ID of the process that exited.
   */
  int processId;

  /**
   * The type of exit that occurred for the process - normal, abnormal, killed,
   * crashed. Only available for renderer processes.
   */
  int exitType;

  /**
   * The exit code if the process exited abnormally. Only available for renderer
   * processes.
   */
  int exitCode;

  OnExitedEvent(this.processId, this.exitType, this.exitCode);
}

/**
 * An object containing information about one of the browser's processes.
 */
class Process extends ChromeObject {
  static Process create(JsObject proxy) => proxy == null ? null : new Process(proxy);

  Process(JsObject proxy): super(proxy);

  /**
   * Unique ID of the process provided by the browser.
   */
  int get id => proxy['id'];

  /**
   * The ID of the process, as provided by the OS.
   */
  int get osProcessId => proxy['osProcessId'];

  /**
   * The type of process.
   */
  String get type => proxy['type'];

  /**
   * The profile which the process is associated with.
   */
  String get profile => proxy['profile'];

  /**
   * Array of Tab IDs that have a page rendered by this process. The list will
   * be non-empty for renderer processes only.
   */
  List<int> get tabs => listify(proxy['tabs']);

  /**
   * The most recent measurement of the process CPU usage, between 0 and 100%.
   * Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get cpu => proxy['cpu'];

  /**
   * The most recent measurement of the process network usage, in bytes per
   * second. Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get network => proxy['network'];

  /**
   * The most recent measurement of the process private memory usage, in bytes.
   * Only available when receiving the object as part of a callback from
   * onUpdatedWithMemory or getProcessInfo with the includeMemory flag.
   */
  dynamic get privateMemory => proxy['privateMemory'];

  /**
   * The most recent measurement of the process JavaScript allocated memory, in
   * bytes. Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get jsMemoryAllocated => proxy['jsMemoryAllocated'];

  /**
   * The most recent measurement of the process JavaScript memory used, in
   * bytes. Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get jsMemoryUsed => proxy['jsMemoryUsed'];

  /**
   * The most recent measurement of the process’s SQLite memory usage, in bytes.
   * Only available when receiving the object as part of a callback from
   * onUpdated or onUpdatedWithMemory.
   */
  dynamic get sqliteMemory => proxy['sqliteMemory'];

  /**
   * The most recent measurement of the process frames per second. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  dynamic get fps => proxy['fps'];

  /**
   * The most recent information about the image cache for the process. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  Cache get imageCache => new Cache(proxy['imageCache']);

  /**
   * The most recent information about the script cache for the process. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  Cache get scriptCache => new Cache(proxy['scriptCache']);

  /**
   * The most recent information about the CSS cache for the process. Only
   * available when receiving the object as part of a callback from onUpdated or
   * onUpdatedWithMemory.
   */
  Cache get cssCache => new Cache(proxy['cssCache']);
}

/**
 * The Cache object contains information about the size and utilization of a
 * cache used by the browser.
 */
class Cache extends ChromeObject {
  static Cache create(JsObject proxy) => proxy == null ? null : new Cache(proxy);

  Cache(JsObject proxy): super(proxy);

  /**
   * The size of the cache, in bytes.
   */
  dynamic get size => proxy['size'];

  /**
   * The part of the cache that is utilized, in bytes.
   */
  dynamic get liveSize => proxy['liveSize'];
}
