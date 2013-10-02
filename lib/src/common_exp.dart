
library chrome.src.common_exp;

import 'dart:js';

/**
 * The abstract superclass of objects that can hold [JsObject] proxies.
 */
abstract class ChromeObject implements Serializable<JsObject> {
  final JsObject proxy;

  /**
   * Create a new instance of a `ChromeObject`, which creates and delegates to
   * a JsObject proxy.
   */
  ChromeObject() : proxy = new JsObject(context['Object']);

  /**
   * Create a new instance of a `ChromeObject`, which delegates to the given
   * JsObject proxy.
   */
  ChromeObject.fromProxy(this.proxy);

  JsObject toJs() => proxy;

  String toString() => proxy.toString();
}

/**
 * The abstract superclass of Chrome enums.
 */
abstract class ChromeEnum implements Serializable<String> {
  final String value;

  const ChromeEnum(this.value);

  String toJs() => value;
  String toString() => value;
}

// This is chared in common by app.window and system.display.
class Bounds extends ChromeObject {
  static Bounds create(JsObject proxy) => proxy == null ? null : new Bounds.fromProxy(proxy);

  Bounds();
  Bounds.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get left => proxy['left'];
  set left(int value) => proxy['left'] = value;

  int get top => proxy['top'];
  set top(int value) => proxy['top'] = value;

  int get width => proxy['width'];
  set width(int value) => proxy['width'] = value;

  int get height => proxy['height'];
  set height(int value) => proxy['height'] = value;
}

// TODO: this implementation needs to be fleshed out
class ArrayBuffer extends ChromeObject {
  static ArrayBuffer create(JsObject proxy) => new ArrayBuffer.fromProxy(proxy);

  ArrayBuffer();
  ArrayBuffer.fromProxy(JsObject proxy): super.fromProxy(proxy);

  factory ArrayBuffer.fromString(String str) {
    var uint8Array = new JsObject(context['Uint8Array'], [jsify(str.codeUnits)]);

    return new ArrayBuffer.fromProxy(uint8Array['buffer']);
  }
}

// TODO: this is a hack, to eliminate analysis warnings. remove as soon as possible
class BluetoothDeviceCallback {
  static BluetoothDeviceCallback create(JsObject proxy) => new BluetoothDeviceCallback();
}

// TODO: this is a hack, to eliminate analysis warnings. remove as soon as possible
class SuggestFilenameCallback {
  static SuggestFilenameCallback create(JsObject proxy) => new SuggestFilenameCallback();
}
