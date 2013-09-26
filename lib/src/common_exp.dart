
library common_exp;

import 'dart:js';

/**
 * The abstract superclass of objects that can hold [JsObject] proxies.
 */
abstract class ChromeObject implements Serializable<JsObject> {
  JsObject proxy;

  /**
   * Create a new instance of a `ChromeObject`, which delegates to the given
   * JsObject proxy.
   */
  ChromeObject(this.proxy);

  JsObject toJs() => proxy;

  String toString() => proxy.toString();
}

/**
 * The abstract superclass of Chrome enums.
 */
abstract class ChromeEnum implements Serializable<String> {
  final String _value;

  const ChromeEnum(this._value);

  String get value => _value;
  String toJs() => _value;
  String toString() => _value;
}

// TODO:
class ArrayBuffer extends ChromeObject {
  static ArrayBuffer create(JsObject proxy) => new ArrayBuffer(proxy);

  ArrayBuffer(JsObject proxy): super(proxy);
}
