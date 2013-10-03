/* This file has been generated from system_display.idl - do not edit */

library chrome.system_display;

import '../src/common.dart';

/// Accessor for the `chrome.system.display` namespace.
final ChromeSystemDisplay system_display = (ChromeSystemDisplay._system_display == null ? null : new ChromeSystemDisplay._());

class ChromeSystemDisplay {
  static final JsObject _system_display = context['chrome']['system']['display'];

  ChromeSystemDisplay._();

  bool get available => _system_display != null;

  /**
   * Get the information of all attached display devices.
   */
  Future<DisplayUnitInfo> getInfo() {
    var completer = new ChromeCompleter<DisplayUnitInfo>.oneArg(_createDisplayUnitInfo);
    _system_display.callMethod('getInfo', [completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties for the display specified by
   * [id], according to the information provided in
   * [info]. On failure, $ref:runtime.lastError will be set.
   * [id]: The display's unique identifier.
   * [info]: The information about display properties that should be changed.
   * A property will be changed only if a new value for it is specified in
   * [info].
   * [callback]: Empty function called when the function finishes. To find out
   * whether the function succeeded, $ref:runtime.lastError should be
   * queried.
   */
  Future setDisplayProperties(String id, DisplayProperties info) {
    var completer = new ChromeCompleter.noArgs();
    _system_display.callMethod('setDisplayProperties', [id, info, completer.callback]);
    return completer.future;
  }

  Stream get onDisplayChanged => _onDisplayChanged.stream;

  final ChromeStreamController _onDisplayChanged =
      new ChromeStreamController.noArgs(_system_display['onDisplayChanged']);
}

class Insets extends ChromeObject {

  Insets({int left, int top, int right, int bottom}) {
    if (left != null) this.left = left;
    if (top != null) this.top = top;
    if (right != null) this.right = right;
    if (bottom != null) this.bottom = bottom;
  }

  Insets.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get left => proxy['left'];
  set left(int value) => proxy['left'] = value;

  int get top => proxy['top'];
  set top(int value) => proxy['top'] = value;

  int get right => proxy['right'];
  set right(int value) => proxy['right'] = value;

  int get bottom => proxy['bottom'];
  set bottom(int value) => proxy['bottom'] = value;
}

class DisplayUnitInfo extends ChromeObject {

  DisplayUnitInfo({String id, String name, String mirroringSourceId, bool isPrimary, bool isInternal, bool isEnabled, double dpiX, double dpiY, int rotation, Bounds bounds, Insets overscan, Bounds workArea}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (mirroringSourceId != null) this.mirroringSourceId = mirroringSourceId;
    if (isPrimary != null) this.isPrimary = isPrimary;
    if (isInternal != null) this.isInternal = isInternal;
    if (isEnabled != null) this.isEnabled = isEnabled;
    if (dpiX != null) this.dpiX = dpiX;
    if (dpiY != null) this.dpiY = dpiY;
    if (rotation != null) this.rotation = rotation;
    if (bounds != null) this.bounds = bounds;
    if (overscan != null) this.overscan = overscan;
    if (workArea != null) this.workArea = workArea;
  }

  DisplayUnitInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  String get mirroringSourceId => proxy['mirroringSourceId'];
  set mirroringSourceId(String value) => proxy['mirroringSourceId'] = value;

  bool get isPrimary => proxy['isPrimary'];
  set isPrimary(bool value) => proxy['isPrimary'] = value;

  bool get isInternal => proxy['isInternal'];
  set isInternal(bool value) => proxy['isInternal'] = value;

  bool get isEnabled => proxy['isEnabled'];
  set isEnabled(bool value) => proxy['isEnabled'] = value;

  double get dpiX => proxy['dpiX'];
  set dpiX(double value) => proxy['dpiX'] = value;

  double get dpiY => proxy['dpiY'];
  set dpiY(double value) => proxy['dpiY'] = value;

  int get rotation => proxy['rotation'];
  set rotation(int value) => proxy['rotation'] = value;

  Bounds get bounds => _createBounds(proxy['bounds']);
  set bounds(Bounds value) => proxy['bounds'] = value;

  Insets get overscan => _createInsets(proxy['overscan']);
  set overscan(Insets value) => proxy['overscan'] = value;

  Bounds get workArea => _createBounds(proxy['workArea']);
  set workArea(Bounds value) => proxy['workArea'] = value;
}

class DisplayProperties extends ChromeObject {

  DisplayProperties({String mirroringSourceId, bool isPrimary, Insets overscan, int rotation, int boundsOriginX, int boundsOriginY}) {
    if (mirroringSourceId != null) this.mirroringSourceId = mirroringSourceId;
    if (isPrimary != null) this.isPrimary = isPrimary;
    if (overscan != null) this.overscan = overscan;
    if (rotation != null) this.rotation = rotation;
    if (boundsOriginX != null) this.boundsOriginX = boundsOriginX;
    if (boundsOriginY != null) this.boundsOriginY = boundsOriginY;
  }

  DisplayProperties.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get mirroringSourceId => proxy['mirroringSourceId'];
  set mirroringSourceId(String value) => proxy['mirroringSourceId'] = value;

  bool get isPrimary => proxy['isPrimary'];
  set isPrimary(bool value) => proxy['isPrimary'] = value;

  Insets get overscan => _createInsets(proxy['overscan']);
  set overscan(Insets value) => proxy['overscan'] = value;

  int get rotation => proxy['rotation'];
  set rotation(int value) => proxy['rotation'] = value;

  int get boundsOriginX => proxy['boundsOriginX'];
  set boundsOriginX(int value) => proxy['boundsOriginX'] = value;

  int get boundsOriginY => proxy['boundsOriginY'];
  set boundsOriginY(int value) => proxy['boundsOriginY'] = value;
}

DisplayUnitInfo _createDisplayUnitInfo(JsObject proxy) => proxy == null ? null : new DisplayUnitInfo.fromProxy(proxy);
Bounds _createBounds(JsObject proxy) => proxy == null ? null : new Bounds.fromProxy(proxy);
Insets _createInsets(JsObject proxy) => proxy == null ? null : new Insets.fromProxy(proxy);
