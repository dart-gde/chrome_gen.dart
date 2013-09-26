/* This file has been generated from app_runtime.idl - do not edit */

library chrome.app_runtime;

import '../src/common.dart';

/// Accessor for the `chrome.app.runtime` namespace.
final ChromeAppRuntime app_runtime = new ChromeAppRuntime._();

class ChromeAppRuntime {
  static final JsObject _app_runtime = context['chrome']['app']['runtime'];

  ChromeAppRuntime._();

  Stream<LaunchData> get onLaunched => _onLaunched.stream;

  final ChromeStreamController<LaunchData> _onLaunched =
      new ChromeStreamController<LaunchData>.oneArg(_app_runtime['onLaunched'], LaunchData.create);

  Stream get onRestarted => _onRestarted.stream;

  final ChromeStreamController _onRestarted =
      new ChromeStreamController.noArgs(_app_runtime['onRestarted']);
}

class LaunchItem extends ChromeObject {
  static LaunchItem create(JsObject proxy) => proxy == null ? null : new LaunchItem.fromProxy(proxy);

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
  static LaunchData create(JsObject proxy) => proxy == null ? null : new LaunchData.fromProxy(proxy);

  LaunchData({String id, LaunchItem items}) {
    if (id != null) this.id = id;
    if (items != null) this.items = items;
  }

  LaunchData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  LaunchItem get items => LaunchItem.create(proxy['items']);
  set items(LaunchItem value) => proxy['items'] = value;
}
