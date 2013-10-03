/* This file has been generated from file_system.idl - do not edit */

library chrome.fileSystem;

import '../src/common.dart';

/// Accessor for the `chrome.fileSystem` namespace.
final ChromeFileSystem fileSystem = new ChromeFileSystem._();

class ChromeFileSystem extends ChromeApi {
  static final JsObject _fileSystem = context['chrome']['fileSystem'];

  ChromeFileSystem._();

  /**
   * Get the display path of an Entry object. The display path is based on the
   * full path of the file or directory on the local file system, but may be
   * made more readable for display purposes.
   */
  Future<String> getDisplayPath(dynamic entry) {
    _checkAvailability();

    var completer = new ChromeCompleter<String>.oneArg();
    _fileSystem.callMethod('getDisplayPath', [entry, completer.callback]);
    return completer.future;
  }

  /**
   * Get a writable Entry from another Entry. This call will fail if the
   * application does not have the 'write' permission under 'fileSystem'. If
   * entry is a DirectoryEntry, this call will fail if the application does not
   * have the 'directory' permission under 'fileSystem'.
   */
  Future<dynamic> getWritableEntry(dynamic entry) {
    _checkAvailability();

    var completer = new ChromeCompleter<dynamic>.oneArg();
    _fileSystem.callMethod('getWritableEntry', [entry, completer.callback]);
    return completer.future;
  }

  /**
   * Gets whether this Entry is writable or not.
   */
  Future<bool> isWritableEntry(dynamic entry) {
    _checkAvailability();

    var completer = new ChromeCompleter<bool>.oneArg();
    _fileSystem.callMethod('isWritableEntry', [entry, completer.callback]);
    return completer.future;
  }

  /**
   * Ask the user to choose a file or directory.
   * 
   * Returns:
   * [entry] null
   * [fileEntries] null
   */
  Future<JsObject> chooseEntry([ChooseEntryOptions options]) {
    _checkAvailability();

    var completer = new ChromeCompleter<JsObject>.oneArg();
    _fileSystem.callMethod('chooseEntry', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the file entry with the given id if it can be restored. This call
   * will fail otherwise. This method is new in Chrome 30.
   */
  Future<dynamic> restoreEntry(String id) {
    _checkAvailability();

    var completer = new ChromeCompleter<dynamic>.oneArg();
    _fileSystem.callMethod('restoreEntry', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns whether a file entry for the given id can be restored, i.e. whether
   * restoreEntry would succeed with this id now. This method is new in Chrome
   * 30.
   */
  Future<bool> isRestorable(String id) {
    _checkAvailability();

    var completer = new ChromeCompleter<bool>.oneArg();
    _fileSystem.callMethod('isRestorable', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns an id that can be passed to restoreEntry to regain access to a
   * given file entry. Only the 500 most recently used entries are retained,
   * where calls to retainEntry and restoreEntry count as use. If the app has
   * the 'retainEntries' permission under 'fileSystem' (currently restricted to
   * dev channel), entries are retained indefinitely. Otherwise, entries are
   * retained only while the app is running and across restarts. This method is
   * new in Chrome 30.
   */
  String retainEntry(dynamic entry) {
    _checkAvailability();

    return _fileSystem.callMethod('retainEntry', [entry]);
  }

  bool get available => _fileSystem != null;

  void _checkAvailability() {
    if (_fileSystem == null) {
      throw new Exception('chrome.fileSystem API not available');
    }
  }
}

/**
 * Prompts the user to open an existing file and returns a FileEntry on success.
 * From Chrome 31 onwards, the FileEntry will be writable if the application has
 * the 'write' permission under 'fileSystem'; otherwise, the FileEntry will be
 * read-only. Prompts the user to open an existing file and returns a writable
 * FileEntry on success. Calls using this type will fail unless the application
 * has the 'write' permission under 'fileSystem'. Prompts the user to open an
 * existing file or a new file and returns a writable FileEntry on success.
 * Calls using this type will fail unless the application has the 'write'
 * permission under 'fileSystem'. Prompts the user to open a directory and
 * returns a DirectoryEntry on success. Calls using this type will fail unless
 * the application has the 'directory' permission under 'fileSystem'. If the
 * application has the 'write' permission under 'fileSystem', the returned
 * DirectoryEntry will be writable; otherwise it will be read-only. New in
 * Chrome 31.
 */
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
