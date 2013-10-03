/* This file has been generated from file_system.idl - do not edit */

library chrome.fileSystem;

import '../src/common.dart';

/// Accessor for the `chrome.fileSystem` namespace.
final ChromeFileSystem fileSystem = new ChromeFileSystem._();

class ChromeFileSystem {
  static final JsObject _fileSystem = context['chrome']['fileSystem'];

  ChromeFileSystem._();

  Future<String> getDisplayPath(dynamic entry) {
    var completer = new ChromeCompleter<String>.oneArg();
    _fileSystem.callMethod('getDisplayPath', [entry, completer.callback]);
    return completer.future;
  }

  Future<dynamic> getWritableEntry(dynamic entry) {
    var completer = new ChromeCompleter<dynamic>.oneArg();
    _fileSystem.callMethod('getWritableEntry', [entry, completer.callback]);
    return completer.future;
  }

  Future<bool> isWritableEntry(dynamic entry) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _fileSystem.callMethod('isWritableEntry', [entry, completer.callback]);
    return completer.future;
  }

  Future<JsObject> chooseEntry([ChooseEntryOptions options]) {
    var completer = new ChromeCompleter<JsObject>.oneArg();
    _fileSystem.callMethod('chooseEntry', [options, completer.callback]);
    return completer.future;
  }

  Future<dynamic> restoreEntry(String id) {
    var completer = new ChromeCompleter<dynamic>.oneArg();
    _fileSystem.callMethod('restoreEntry', [id, completer.callback]);
    return completer.future;
  }

  Future<bool> isRestorable(String id) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _fileSystem.callMethod('isRestorable', [id, completer.callback]);
    return completer.future;
  }

  String retainEntry(dynamic entry) {
    return _fileSystem.callMethod('retainEntry', [entry]);
  }
}

class ChooseEntryType extends ChromeEnum {
  static const ChooseEntryType OPENFILE = const ChooseEntryType._('openFile');
  static const ChooseEntryType OPENWRITABLEFILE = const ChooseEntryType._('openWritableFile');
  static const ChooseEntryType SAVEFILE = const ChooseEntryType._('saveFile');
  static const ChooseEntryType OPENDIRECTORY = const ChooseEntryType._('openDirectory');

  static const List<ChooseEntryType> VALUES = const[OPENFILE, OPENWRITABLEFILE, SAVEFILE, OPENDIRECTORY];

  const ChooseEntryType._(String str): super(str);
}

class AcceptOption extends ChromeObject {

  AcceptOption({String description, String mimeTypes, String extensions}) {
    if (description != null) this.description = description;
    if (mimeTypes != null) this.mimeTypes = mimeTypes;
    if (extensions != null) this.extensions = extensions;
  }

  AcceptOption.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;

  String get mimeTypes => proxy['mimeTypes'];
  set mimeTypes(String value) => proxy['mimeTypes'] = value;

  String get extensions => proxy['extensions'];
  set extensions(String value) => proxy['extensions'] = value;
}

class ChooseEntryOptions extends ChromeObject {

  ChooseEntryOptions({ChooseEntryType type, String suggestedName, AcceptOption accepts, bool acceptsAllTypes, bool acceptsMultiple}) {
    if (type != null) this.type = type;
    if (suggestedName != null) this.suggestedName = suggestedName;
    if (accepts != null) this.accepts = accepts;
    if (acceptsAllTypes != null) this.acceptsAllTypes = acceptsAllTypes;
    if (acceptsMultiple != null) this.acceptsMultiple = acceptsMultiple;
  }

  ChooseEntryOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  ChooseEntryType get type => _createChooseEntryType(proxy['type']);
  set type(ChooseEntryType value) => proxy['type'] = value;

  String get suggestedName => proxy['suggestedName'];
  set suggestedName(String value) => proxy['suggestedName'] = value;

  AcceptOption get accepts => _createAcceptOption(proxy['accepts']);
  set accepts(AcceptOption value) => proxy['accepts'] = value;

  bool get acceptsAllTypes => proxy['acceptsAllTypes'];
  set acceptsAllTypes(bool value) => proxy['acceptsAllTypes'] = value;

  bool get acceptsMultiple => proxy['acceptsMultiple'];
  set acceptsMultiple(bool value) => proxy['acceptsMultiple'] = value;
}

ChooseEntryType _createChooseEntryType(String value) => ChooseEntryType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
AcceptOption _createAcceptOption(JsObject proxy) => proxy == null ? null : new AcceptOption.fromProxy(proxy);
