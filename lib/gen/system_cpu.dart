/* This file has been generated from system_cpu.idl - do not edit */

library chrome.system_cpu;

import '../src/common.dart';

/// Accessor for the `chrome.system.cpu` namespace.
final ChromeSystemCpu system_cpu = new ChromeSystemCpu._();

class ChromeSystemCpu {
  static final JsObject _system_cpu = context['chrome']['system']['cpu'];

  ChromeSystemCpu._();

  Future<CpuInfo> getInfo() {
    var completer = new ChromeCompleter<CpuInfo>.oneArg(CpuInfo.create);
    _system_cpu.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }
}

class CpuInfo extends ChromeObject {
  static CpuInfo create(JsObject proxy) => proxy == null ? null : new CpuInfo.fromProxy(proxy);

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
