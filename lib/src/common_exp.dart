
library chrome.src.common_exp;

import 'dart:js';

/**
 * The abstract superclass of objects that can hold [JsObject] proxies.
 */
class ChromeObject {
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
 * A common super class for the Chrome APIs.
 */
abstract class ChromeApi {
  /**
   * Returns true if the API is available. The common causes of an API not being
   * avilable are:
   *
   *  * a permission is missing in the application's manifest.json file
   *  * the API is defined on a newer version of Chrome then the current runtime
   */
  bool get available;
}

/**
 * The abstract superclass of Chrome enums.
 */
abstract class ChromeEnum {
  final String value;

  const ChromeEnum(this.value);

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

class ArrayBuffer extends ChromeObject {
  static ArrayBuffer create(JsObject proxy) => new ArrayBuffer.fromProxy(proxy);

  ArrayBuffer();
  ArrayBuffer.fromProxy(JsObject proxy): super.fromProxy(proxy);

  factory ArrayBuffer.fromBytes(List<int> data) {
    var uint8Array = new JsObject(context['Uint8Array'], [new JsObject.jsify(data)]);

    return new ArrayBuffer.fromProxy(uint8Array['buffer']);
  }

  factory ArrayBuffer.fromString(String str) {
    var uint8Array = new JsObject(context['Uint8Array'], [new JsObject.jsify(str.codeUnits)]);

    return new ArrayBuffer.fromProxy(uint8Array['buffer']);
  }

  List<int> getBytes() {
    var int8View = new JsObject(context['Uint8Array'], [proxy]);

    List<int> result = new List<int>(int8View['length']);

    // TODO: this is _very_ slow
    // can we instead do: jsArray = Array.apply([], int8View);
    for (int i = 0; i < result.length; i++) {
      result[i] = int8View[i];
    }

    return result;
  }
}

// TODO: this is a hack, to eliminate analysis warnings. remove as soon as possible
class BluetoothDeviceCallback {
  BluetoothDeviceCallback.fromProxy(JsObject proxy);
}

// TODO: this is a hack, to eliminate analysis warnings. remove as soon as possible
class SuggestFilenameCallback {
  SuggestFilenameCallback.fromProxy(JsObject proxy);
}

// TODO:
class LocalMediaStream extends ChromeObject {
  static LocalMediaStream create(JsObject proxy) => new LocalMediaStream.fromProxy(proxy);

  LocalMediaStream();
  LocalMediaStream.fromProxy(JsObject proxy): super.fromProxy(proxy);
}
