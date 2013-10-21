
library chrome.src.files;

import 'dart:async';
import 'dart:js';
//import 'dart:html' show EventStreamProvider;

import 'common.dart';

import '../src/files_exp.dart';
export '../src/files_exp.dart';

class CrFileSystem extends ChromeObject implements FileSystem {
  CrFileSystem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];

  DirectoryEntry get root => new CrDirectoryEntry.fromProxy(proxy['root']);

  bool operator==(Object other) => other is CrFileSystem &&
      (other as CrFileSystem).proxy == proxy;

  int get hashCode => proxy.hashCode;
}

class CrMetadata extends ChromeObject implements Metadata {
  CrMetadata.fromProxy(JsObject proxy) : super.fromProxy(proxy);

  int get size => proxy['size'];
  DateTime get modificationTime {
    return DateTime.parse(proxy['modificationTime'].callMethod('toISOString'));
  }
}

abstract class CrEntry extends ChromeObject implements Entry {
  // This factory returns either a FileEntry or a DirectoryEntry.
  factory CrEntry.fromProxy(JsObject proxy) {
    // TODO: the toString() hack below is unfortunate :(. I would like to use:
    // proxy.instanceof(context['DirectoryEntry'])

    if (proxy == null) {
      return null;
    } else if (proxy.toString().contains('FileEntry]')) {
      return new ChromeFileEntry.fromProxy(proxy);
    } else {
      return new CrDirectoryEntry.fromProxy(proxy);
    }
  }

  CrEntry._fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get isDirectory => proxy['isDirectory'];
  bool get isFile => proxy['isFile'];
  String get fullPath => proxy['fullPath'];
  String get name => proxy['name'];
  FileSystem get filesystem => new CrFileSystem.fromProxy(proxy['filesystem']);

  String toUrl() => this.proxy.callMethod('toURL');

  Future<Entry> copyTo(DirectoryEntry parent, {String name}) {
    // TODO:

  }

  Future<Entry> moveTo(DirectoryEntry parent, {String name}) {
    // TODO:

  }

  Future remove() {
    // TODO:

  }

  Future<Metadata> getMetadata() {
    var completer = new _ChromeCompleterWithError<Metadata>.oneArg((obj) => new CrMetadata.fromProxy(obj));
    proxy.callMethod('getMetadata', [completer.callback, completer.errorCallback]);
    return completer.future;
  }

  Future<Entry> getParent() {
    var completer = new _ChromeCompleterWithError<Entry>.oneArg((obj) => new CrDirectoryEntry.fromProxy(obj));
    proxy.callMethod('getParent', [completer.callback, completer.errorCallback]);
    return completer.future;
  }
}

class CrDirectoryEntry extends CrEntry implements DirectoryEntry {
  CrDirectoryEntry.fromProxy(JsObject proxy) : super._fromProxy(proxy);

  Future<Entry> createFile(String path, {bool exclusive: false}) {
    // TODO:

  }

  Future<Entry> createDirectory(String path, {bool exclusive: false}) {
    // TODO:

  }

  Future<Entry> getFile(String path) {
    var completer = new _ChromeCompleterWithError<Entry>.oneArg((obj) => new CrEntry.fromProxy(obj));
    proxy.callMethod('getFile', [path, completer.callback, completer.errorCallback]);
    return completer.future;
  }

  Future<Entry> getDirectory(String path) {
    // TODO:

  }

  DirectoryReader createReader() {
    return new CrDirectoryReader.fromProxy(proxy.callMethod('createReader'));
  }

  Future removeRecursively() {
    // TODO:

  }

  bool operator==(Object other) => other is CrDirectoryEntry &&
      (other as CrDirectoryEntry).proxy == proxy;

  int get hashCode => proxy.hashCode;
}

class CrDirectoryReader extends ChromeObject implements DirectoryReader {
  CrDirectoryReader.fromProxy(JsObject proxy) : super.fromProxy(proxy);

  /**
   * Return a list of child entries for this directory.
   */
  Future<List<Entry>> readEntries() {
    Completer<List<Entry>> completer = new Completer();

    List<Entry> entries = [];

    Function entriesCallback = null;
    Function errorCallback = (var domError) {
      completer.completeError(domError);
    };

    entriesCallback = (/*Entry[]*/ result) {
      if (result['length'] == 0) {
        completer.complete(entries);
      } else {
        entries.addAll(listify(result).map((e) => new CrEntry.fromProxy(e)));
        proxy.callMethod('readEntries', [entriesCallback, errorCallback]);
      }
    };

    proxy.callMethod('readEntries', [entriesCallback, errorCallback]);

    return completer.future;
  }
}

abstract class CrFileEntry extends CrEntry implements FileEntry {
  CrFileEntry.fromProxy(JsObject proxy) : super._fromProxy(proxy);

  Future<FileWriter> createWriter() {
    // TODO:

  }

  Future<File> file() {
    var completer = new _ChromeCompleterWithError<File>.oneArg((obj) => new CrFile.fromProxy(obj));
    proxy.callMethod('file', [completer.callback, completer.errorCallback]);
    return completer.future;
  }

  bool operator==(Object other) => other is CrDirectoryEntry &&
      (other as CrDirectoryEntry).proxy == proxy;

  int get hashCode => proxy.hashCode;
}

/**
 * A convience class for reading and writing file content.
 */
class ChromeFileEntry extends CrFileEntry {
  ChromeFileEntry.fromProxy(JsObject proxy) : super.fromProxy(proxy);

  /**
   * Return the contents of the file as a String.
   */
  Future<String> readText() {
    return file().then((File file) {
      Completer<String> completer = new Completer();

      var reader = new JsObject(context['FileReader']);
      reader['onload'] = (var event) {
        completer.complete(reader['result']);
      };
      reader['onerror'] = (var domError) {
        completer.completeError(domError);
      };
      reader.callMethod('readAsText', [file]);

      return completer.future;
    });
  }

  /**
   * Write out the given String to the file.
   */
  Future writeText(String text) {
    return _createWriter().then((ChromeObject _writer) {
      JsObject writer = _writer.proxy;

      Completer<FileEntry> completer = new Completer();

      JsObject blob = new JsObject(context['Blob'], [new JsObject.jsify([text])]);

      writer['onwrite'] = (var event) {
        writer['onwrite'] = null;
        writer.callMethod('truncate', [writer['length']]);
        completer.complete(this);
      };
      writer['onerror'] = (var event) {
        completer.completeError(event);
      };
      writer.callMethod('write', [blob, new JsObject.jsify({'type': 'text/plain'})]);

      return completer.future;
    });
  }

  Future<ChromeObject> _createWriter() {
    var completer = new _ChromeCompleterWithError<ChromeObject>.oneArg((obj) => new ChromeObject.fromProxy(obj));
    proxy.callMethod('createWriter', [completer.callback, completer.errorCallback]);
    return completer.future;
  }
}

abstract class CrBlob extends ChromeObject implements Blob {
  CrBlob.fromProxy(JsObject proxy) : super.fromProxy(proxy);

  int get size => proxy['size'];
  String get type => proxy['type'];

  Blob slice([int start, int end, String contentType]) {
    // TODO:
  }
}

class CrFile extends CrBlob implements File {
  CrFile.fromProxy(JsObject proxy) : super.fromProxy(proxy);

  DateTime get lastModifiedDate {
    JsObject jsDateTime = proxy['lastModifiedDate'];
    return new DateTime.fromMillisecondsSinceEpoch(
        jsDateTime.callMethod('getTime()'));
  }
  String get name => proxy['name'];
  String get relativePath => proxy['relativePath'];
}

//abstract class CrEventTarget extends ChromeObject implements EventTarget {
//  CrEventTarget.fromProxy(JsObject proxy) : super.fromProxy(proxy);
//  CrEventTarget();
//
//  // TODO: ?
//  Events get on => new Events(this);
//
//  bool dispatchEvent(Event event) { }
//
//  // won't implement
//  void $dom_addEventListener(String type, EventListener listener, [bool useCapture]) { }
//  void $dom_removeEventListener(String type, EventListener listener, [bool useCapture]) { }
//}
//
//class CrFileReader extends CrEventTarget implements FileReader {
//  static const EventStreamProvider<ProgressEvent> loadEvent = const EventStreamProvider<ProgressEvent>('load');
//  static const EventStreamProvider<Event> errorEvent = const EventStreamProvider<Event>('error');
//
//  CrFileReader.fromProxy(JsObject proxy) : super.fromProxy(proxy);
//  CrFileReader();
//
//  Stream<ProgressEvent> get onLoad => loadEvent.forTarget(this);
//  Stream<Event> get onError => errorEvent.forTarget(this);
//
//  void readAsText(Blob blob, [String encoding]) {
//    // TODO: sdkjhsdfkjh
//
//  }
//}
//
///**
// * An alias for [CrFileReader].
// */
//class ChromeFileReader extends CrFileReader {
//  ChromeFileReader.fromProxy(JsObject proxy) : super.fromProxy(proxy);
//  ChromeFileReader();
//}


// TODO: Blob, File, FileWriter, ...

/**
 * An object for handling completion callbacks that are common in the chrome.*
 * APIs.
 */
class _ChromeCompleterWithError<T> {
  final Completer<T> _completer = new Completer();
  Function _callback;

  _ChromeCompleterWithError.oneArg([Function transformer]) {
    this._callback = ([arg1]) {
      if (transformer != null) {
        arg1 = transformer(arg1);
      }
      _completer.complete(arg1);
    };
  }

  Future<T> get future => _completer.future;

  Function get callback => _callback;

  void errorCallback(dynamic domError) {
    _completer.completeError(domError);
  }
}
