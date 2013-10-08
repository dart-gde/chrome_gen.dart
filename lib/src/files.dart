
library chrome.src.files;

import 'common.dart';

// TODO:
class DirectoryEntry extends ChromeObject {
  static DirectoryEntry create(JsObject proxy) => new DirectoryEntry.fromProxy(proxy);

  DirectoryEntry();
  DirectoryEntry.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

// TODO:
class Entry extends ChromeObject {
  static Entry create(JsObject proxy) => new Entry.fromProxy(proxy);

  Entry();
  Entry.fromProxy(JsObject proxy): super.fromProxy(proxy);
}

// TODO:
class DOMFileSystem extends ChromeObject {
  static DOMFileSystem create(JsObject proxy) => new DOMFileSystem.fromProxy(proxy);

  DOMFileSystem();
  DOMFileSystem.fromProxy(JsObject proxy): super.fromProxy(proxy);
}
