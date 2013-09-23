/* This file has been generated from system_cpu.idl - do not edit */

/**
 * 
 */
library chrome.system_cpu;

import '../src/common.dart';

/// Accessor for the `chrome.system.cpu` namespace.
final ChromeSystemCpu system_cpu = new ChromeSystemCpu._();

class ChromeSystemCpu {
  static final JsObject _system_cpu = context['chrome']['system']['cpu'];

  ChromeSystemCpu._();

  Future getInfo() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _system_cpu.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class CpuInfo extends ChromeObject {
  static CpuInfo create(JsObject proxy) => new CpuInfo(proxy);

  CpuInfo(JsObject proxy): super(proxy);
}
