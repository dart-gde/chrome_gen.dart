/* This file has been generated from app_runtime.idl - do not edit */

library chrome.app_runtime;

import '../src/common.dart';

/// Accessor for the `chrome.app.runtime` namespace.
final ChromeAppRuntime app_runtime = (ChromeAppRuntime._app_runtime == null ? null : new ChromeAppRuntime._());

class ChromeAppRuntime {
  static final JsObject _app_runtime = context['chrome']['app']['runtime'];

  ChromeAppRuntime._();

  bool get available => _app_runtime != null;

  Stream<LaunchData> get onLaunched => _onLaunched.stream;

  final ChromeStreamController<LaunchData> _onLaunched =
      new ChromeStreamController<LaunchData>.oneArg(_app_runtime['onLaunched'], _createLaunchData);

  Stream get onRestarted => _onRestarted.stream;

  final ChromeStreamController _onRestarted =
      new ChromeStreamController.noArgs(_app_runtime['onRestarted']);
}

class LaunchItem extends ChromeObject {

  LaunchItem({var entry, String type}) {
    if (entry != null) this.entry = entry;
    if (type != null) this.type = type;
  }

  LaunchItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get entry => proxy['entry'];
  set entry(var value) => proxy['entry'] = value;

  String get type => proxy['type'];
  set type(String value) => proxy['type'] = value;
}

class LaunchData extends ChromeObject {

  LaunchData({String id, LaunchItem items}) {
    if (id != null) this.id = id;
    if (items != null) this.items = items;
  }

  LaunchData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  LaunchItem get items => _createLaunchItem(proxy['items']);
  set items(LaunchItem value) => proxy['items'] = value;
}

LaunchData _createLaunchData(JsObject proxy) => proxy == null ? null : new LaunchData.fromProxy(proxy);
LaunchItem _createLaunchItem(JsObject proxy) => proxy == null ? null : new LaunchItem.fromProxy(proxy);
