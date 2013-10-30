/* This file has been generated from file_system.idl - do not edit */

library chrome.fileSystem;

import '../src/files.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.fileSystem` namespace.
 */
final ChromeFileSystem fileSystem = new ChromeFileSystem._();

class ChromeFileSystem extends ChromeApi {
  static final JsObject _fileSystem = chrome['fileSystem'];

  ChromeFileSystem._();

  bool get available => _fileSystem != null;

  /**
   * Get the display path of an Entry object. The display path is based on the
   * full path of the file or directory on the local file system, but may be
   * made more readable for display purposes.
   */
  Future<String> getDisplayPath(Entry entry) {
    if (_fileSystem == null) _throwNotAvailable();

    var completer = new ChromeCompleter<String>.oneArg();
    _fileSystem.callMethod('getDisplayPath', [jsify(entry), completer.callback]);
    return completer.future;
  }

  /**
   * Get a writable Entry from another Entry. This call will fail with a runtime
   * error if the application does not have the 'write' permission under
   * 'fileSystem'. If entry is a DirectoryEntry, this call will fail if the
   * application does not have the 'directory' permission under 'fileSystem'.
   */
  Future<Entry> getWritableEntry(Entry entry) {
    if (_fileSystem == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Entry>.oneArg(_createEntry);
    _fileSystem.callMethod('getWritableEntry', [jsify(entry), completer.callback]);
    return completer.future;
  }

  /**
   * Gets whether this Entry is writable or not.
   */
  Future<bool> isWritableEntry(Entry entry) {
    if (_fileSystem == null) _throwNotAvailable();

    var completer = new ChromeCompleter<bool>.oneArg();
    _fileSystem.callMethod('isWritableEntry', [jsify(entry), completer.callback]);
    return completer.future;
  }

  /**
   * Ask the user to choose a file or directory.
   * 
   * Returns:
   * [entry] null
   * [fileEntries] null
   */
  Future<ChooseEntryResult> chooseEntry([ChooseEntryOptions options]) {
    if (_fileSystem == null) _throwNotAvailable();

    var completer = new ChromeCompleter<ChooseEntryResult>.twoArgs(ChooseEntryResult._create);
    _fileSystem.callMethod('chooseEntry', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the file entry with the given id if it can be restored. This call
   * will fail with a runtime error otherwise. This method is new in Chrome 31.
   */
  Future<Entry> restoreEntry(String id) {
    if (_fileSystem == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Entry>.oneArg(_createEntry);
    _fileSystem.callMethod('restoreEntry', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns whether the app has permission to restore the entry with the given
   * id. This method is new in Chrome 31.
   */
  Future<bool> isRestorable(String id) {
    if (_fileSystem == null) _throwNotAvailable();

    var completer = new ChromeCompleter<bool>.oneArg();
    _fileSystem.callMethod('isRestorable', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns an id that can be passed to restoreEntry to regain access to a
   * given file entry. Only the 500 most recently used entries are retained,
   * where calls to retainEntry and restoreEntry count as use. If the app has
   * the 'retainEntries' permission under 'fileSystem', entries are retained
   * indefinitely. Otherwise, entries are retained only while the app is running
   * and across restarts. This method is new in Chrome 31.
   */
  String retainEntry(Entry entry) {
    if (_fileSystem == null) _throwNotAvailable();

    return _fileSystem.callMethod('retainEntry', [jsify(entry)]);
  }

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.fileSystem' is not available");
  }
}

/**
 * Prompts the user to open an existing file and returns a FileEntry on success.
 * From Chrome 31 onwards, the FileEntry will be writable if the application has
 * the 'write' permission under 'fileSystem'; otherwise, the FileEntry will be
 * read-only. Prompts the user to open an existing file and returns a writable
 * FileEntry on success. Calls using this type will fail with a runtime error if
 * the application doesn't have the 'write' permission under 'fileSystem'.
 * Prompts the user to open an existing file or a new file and returns a
 * writable FileEntry on success. Calls using this type will fail with a runtime
 * error if the application doesn't have the 'write' permission under
 * 'fileSystem'. Prompts the user to open a directory and returns a
 * DirectoryEntry on success. Calls using this type will fail with a runtime
 * error if the application doesn't have the 'directory' permission under
 * 'fileSystem'. If the application has the 'write' permission under
 * 'fileSystem', the returned DirectoryEntry will be writable; otherwise it will
 * be read-only. New in Chrome 31.
 */
class ChooseEntryType extends ChromeEnum {
  static const ChooseEntryType OPEN_FILE = const ChooseEntryType._('openFile');
  static const ChooseEntryType OPEN_WRITABLE_FILE = const ChooseEntryType._('openWritableFile');
  static const ChooseEntryType SAVE_FILE = const ChooseEntryType._('saveFile');
  static const ChooseEntryType OPEN_DIRECTORY = const ChooseEntryType._('openDirectory');

  static const List<ChooseEntryType> VALUES = const[OPEN_FILE, OPEN_WRITABLE_FILE, SAVE_FILE, OPEN_DIRECTORY];

  const ChooseEntryType._(String str): super(str);
}

class AcceptOption extends ChromeObject {
  AcceptOption({String description, String mimeTypes, String extensions}) {
    if (description != null) this.description = description;
    if (mimeTypes != null) this.mimeTypes = mimeTypes;
    if (extensions != null) this.extensions = extensions;
  }
  AcceptOption.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get description => jsProxy['description'];
  set description(String value) => jsProxy['description'] = value;

  String get mimeTypes => jsProxy['mimeTypes'];
  set mimeTypes(String value) => jsProxy['mimeTypes'] = value;

  String get extensions => jsProxy['extensions'];
  set extensions(String value) => jsProxy['extensions'] = value;
}

class ChooseEntryOptions extends ChromeObject {
  ChooseEntryOptions({ChooseEntryType type, String suggestedName, AcceptOption accepts, bool acceptsAllTypes, bool acceptsMultiple}) {
    if (type != null) this.type = type;
    if (suggestedName != null) this.suggestedName = suggestedName;
    if (accepts != null) this.accepts = accepts;
    if (acceptsAllTypes != null) this.acceptsAllTypes = acceptsAllTypes;
    if (acceptsMultiple != null) this.acceptsMultiple = acceptsMultiple;
  }
  ChooseEntryOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  ChooseEntryType get type => _createChooseEntryType(jsProxy['type']);
  set type(ChooseEntryType value) => jsProxy['type'] = jsify(value);

  String get suggestedName => jsProxy['suggestedName'];
  set suggestedName(String value) => jsProxy['suggestedName'] = value;

  AcceptOption get accepts => _createAcceptOption(jsProxy['accepts']);
  set accepts(AcceptOption value) => jsProxy['accepts'] = jsify(value);

  bool get acceptsAllTypes => jsProxy['acceptsAllTypes'];
  set acceptsAllTypes(bool value) => jsProxy['acceptsAllTypes'] = value;

  bool get acceptsMultiple => jsProxy['acceptsMultiple'];
  set acceptsMultiple(bool value) => jsProxy['acceptsMultiple'] = value;
}

/**
 * The return type for [chooseEntry].
 */
class ChooseEntryResult {
  static ChooseEntryResult _create(entry, fileEntries) {
    return new ChooseEntryResult._(_createEntry(entry), _createFileEntry(fileEntries));
  }

  Entry entry;
  FileEntry fileEntries;

  ChooseEntryResult._(this.entry, this.fileEntries);
}

Entry _createEntry(JsObject jsProxy) => jsProxy == null ? null : new CrEntry.fromProxy(jsProxy);
ChooseEntryType _createChooseEntryType(String value) => ChooseEntryType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
AcceptOption _createAcceptOption(JsObject jsProxy) => jsProxy == null ? null : new AcceptOption.fromProxy(jsProxy);
FileEntry _createFileEntry(JsObject jsProxy) => jsProxy == null ? null : new ChromeFileEntry.fromProxy(jsProxy);
