/* This file has been generated from system_memory.idl - do not edit */

library chrome.system_memory;

import '../src/common.dart';

/// Accessor for the `chrome.system.memory` namespace.
final ChromeSystemMemory system_memory = new ChromeSystemMemory._();

class ChromeSystemMemory {
  static final JsObject _system_memory = context['chrome']['system']['memory'];

  ChromeSystemMemory._();

  Future<MemoryInfo> getInfo() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(MemoryInfo.create);
    _system_memory.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class MemoryInfo extends ChromeObject {
  static MemoryInfo create(JsObject proxy) => proxy == null ? null : new MemoryInfo.fromProxy(proxy);

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
