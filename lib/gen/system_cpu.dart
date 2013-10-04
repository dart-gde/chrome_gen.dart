/* This file has been generated from system_cpu.idl - do not edit */

library chrome.system_cpu;

import '../src/common.dart';

/// Accessor for the `chrome.system.cpu` namespace.
final ChromeSystemCpu system_cpu = ChromeSystemCpu._system_cpu == null ? apiNotAvailable('chrome.system.cpu') : new ChromeSystemCpu._();

class ChromeSystemCpu {
  static final JsObject _system_cpu = context['chrome']['system']['cpu'];

  ChromeSystemCpu._();

  /**
   * Queries basic CPU information of the system.
   */
  Future<CpuInfo> getInfo() {
    var completer = new ChromeCompleter<CpuInfo>.oneArg(_createCpuInfo);
    _system_cpu.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class CpuInfo extends ChromeObject {
  CpuInfo({int numOfProcessors, String archName, String modelName}) {
    if (numOfProcessors != null) this.numOfProcessors = numOfProcessors;
    if (archName != null) this.archName = archName;
    if (modelName != null) this.modelName = modelName;
  }

  CpuInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get numOfProcessors => proxy['numOfProcessors'];
  set numOfProcessors(int value) => proxy['numOfProcessors'] = value;

  String get archName => proxy['archName'];
  set archName(String value) => proxy['archName'] = value;

  String get modelName => proxy['modelName'];
  set modelName(String value) => proxy['modelName'] = value;
}

CpuInfo _createCpuInfo(JsObject proxy) => proxy == null ? null : new CpuInfo.fromProxy(proxy);
