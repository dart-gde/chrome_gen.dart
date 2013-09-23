
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

// TODO:
class ArrayBuffer extends ChromeObject {
  static ArrayBuffer create(JsObject proxy) => new ArrayBuffer(proxy);

  ArrayBuffer(JsObject proxy): super(proxy);
}
