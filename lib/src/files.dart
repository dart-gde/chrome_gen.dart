
library chrome.src.files;

import 'dart:async';
import 'dart:js';

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
      return new CrFileEntry.fromProxy(proxy);
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
    var completer = new _ChromeCompleterWithError<Metadata>.oneArg((obj) => new CrDirectoryEntry.fromProxy(obj));
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
    // TODO:

  }

  Future<Entry> getDirectory(String path) {
    // TODO:

  }

  DirectoryReader createReader() {
    // TODO:

  }

  Future removeRecursively() {
    // TODO:

  }

  bool operator==(Object other) => other is CrDirectoryEntry &&
      (other as CrDirectoryEntry).proxy == proxy;

  int get hashCode => proxy.hashCode;
}

class CrFileEntry extends CrEntry implements FileEntry {
  CrFileEntry.fromProxy(JsObject proxy) : super._fromProxy(proxy);

  Future<FileWriter> createWriter() {
    // TODO:

  }

  Future<File> file() {
    // TODO:

  }

  bool operator==(Object other) => other is CrDirectoryEntry &&
      (other as CrDirectoryEntry).proxy == proxy;

  int get hashCode => proxy.hashCode;
}

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
