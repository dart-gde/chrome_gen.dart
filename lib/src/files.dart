
library chrome.src.files;

import 'common.dart';

// TODO:
class DirectoryEntry extends ChromeObject {
  static DirectoryEntry create(JsObject proxy) => new DirectoryEntry.fromProxy(proxy);

  DirectoryEntry();
  DirectoryEntry.fromProxy(JsObject proxy): super.fromProxy(proxy);
}
