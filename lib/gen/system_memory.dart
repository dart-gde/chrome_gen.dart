/* This file has been generated from system_memory.idl - do not edit */

library chrome.system_memory;

import '../src/common.dart';

/// Accessor for the `chrome.system.memory` namespace.
final ChromeSystemMemory system_memory = new ChromeSystemMemory._();

class ChromeSystemMemory {
  static final JsObject _system_memory = context['chrome']['system']['memory'];

  ChromeSystemMemory._();

  Future getInfo() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_memory.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class MemoryInfo extends ChromeObject {
  static MemoryInfo create(JsObject proxy) => proxy == null ? null : new MemoryInfo(proxy);

  MemoryInfo(JsObject proxy): super(proxy);
}
