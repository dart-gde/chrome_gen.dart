
import 'common.dart';

// TODO:
class DirectoryEntry extends ChromeObject {
  static DirectoryEntry create(JsObject proxy) => new DirectoryEntry(proxy);

  DirectoryEntry(JsObject proxy): super(proxy);
}
