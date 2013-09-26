/* This file has been generated from file_system.idl - do not edit */

library chrome.fileSystem;

import '../src/common.dart';

/// Accessor for the `chrome.fileSystem` namespace.
final ChromeFileSystem fileSystem = new ChromeFileSystem._();

class ChromeFileSystem {
  static final JsObject _fileSystem = context['chrome']['fileSystem'];

  ChromeFileSystem._();

  Future getDisplayPath(var entry) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fileSystem.callMethod('getDisplayPath', [entry, completer.callback]);
    return completer.future;
  }

  Future getWritableEntry(var entry) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fileSystem.callMethod('getWritableEntry', [entry, completer.callback]);
    return completer.future;
  }

  Future isWritableEntry(var entry) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fileSystem.callMethod('isWritableEntry', [entry, completer.callback]);
    return completer.future;
  }

  Future chooseEntry([ChooseEntryOptions options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fileSystem.callMethod('chooseEntry', [options, completer.callback]);
    return completer.future;
  }

  Future restoreEntry(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fileSystem.callMethod('restoreEntry', [id, completer.callback]);
    return completer.future;
  }

  Future isRestorable(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fileSystem.callMethod('isRestorable', [id, completer.callback]);
    return completer.future;
  }

  void retainEntry(var entry) {
    _fileSystem.callMethod('retainEntry', [entry]);
  }
}

class ChooseEntryType extends ChromeEnum {
  static const ChooseEntryType OPENFILE = const ChooseEntryType._('openFile');

  static List<ChooseEntryType> _values = [OPENFILE];

  static List<ChooseEntryType> get values => _values;

  static ChooseEntryType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const ChooseEntryType._(String str): super(str);
}

class AcceptOption extends ChromeObject {
  static AcceptOption create(JsObject proxy) => proxy == null ? null : new AcceptOption(proxy);

  AcceptOption(JsObject proxy): super(proxy);
}

class ChooseEntryOptions extends ChromeObject {
  static ChooseEntryOptions create(JsObject proxy) => proxy == null ? null : new ChooseEntryOptions(proxy);

  ChooseEntryOptions(JsObject proxy): super(proxy);
}
