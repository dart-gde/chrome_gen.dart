/* This file has been generated from system_memory.idl - do not edit */

library chrome.system_memory;

import '../src/common.dart';

/// Accessor for the `chrome.system.memory` namespace.
final ChromeSystemMemory system_memory = ChromeSystemMemory._system_memory == null ? apiNotAvailable('chrome.system.memory') : new ChromeSystemMemory._();

class ChromeSystemMemory {
  static final JsObject _system_memory = chrome['system']['memory'];

  ChromeSystemMemory._();

  /**
   * Get physical memory information.
   */
  Future<MemoryInfo> getInfo() {
    var completer = new ChromeCompleter<MemoryInfo>.oneArg(_createMemoryInfo);
    _system_memory.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class MemoryInfo extends ChromeObject {

  MemoryInfo({double capacity, double availableCapacity}) {
    if (capacity != null) this.capacity = capacity;
    if (availableCapacity != null) this.availableCapacity = availableCapacity;
  }

  MemoryInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  double get capacity => proxy['capacity'];
  set capacity(double value) => proxy['capacity'] = value;

  double get availableCapacity => proxy['availableCapacity'];
  set availableCapacity(double value) => proxy['availableCapacity'] = value;
}

MemoryInfo _createMemoryInfo(JsObject proxy) => proxy == null ? null : new MemoryInfo.fromProxy(proxy);
