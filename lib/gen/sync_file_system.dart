/* This file has been generated from sync_file_system.idl - do not edit */

library chrome.syncFileSystem;

import '../src/common.dart';

/// Accessor for the `chrome.syncFileSystem` namespace.
final ChromeSyncFileSystem syncFileSystem = new ChromeSyncFileSystem._();

class ChromeSyncFileSystem {
  static final JsObject _syncFileSystem = context['chrome']['syncFileSystem'];

  ChromeSyncFileSystem._();

  Future<dynamic> requestFileSystem() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _syncFileSystem.callMethod('requestFileSystem', [completer.callback]);
    return completer.future;
  }

  Future setConflictResolutionPolicy(ConflictResolutionPolicy policy) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('setConflictResolutionPolicy', [policy, completer.callback]);
    return completer.future;
  }

  Future<ConflictResolutionPolicy> getConflictResolutionPolicy() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(ConflictResolutionPolicy.create);
    _syncFileSystem.callMethod('getConflictResolutionPolicy', [completer.callback]);
    return completer.future;
  }

  Future<StorageInfo> getUsageAndQuota(var fileSystem) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(StorageInfo.create);
    _syncFileSystem.callMethod('getUsageAndQuota', [fileSystem, completer.callback]);
    return completer.future;
  }

  Future<FileStatus> getFileStatus(var fileEntry) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(FileStatus.create);
    _syncFileSystem.callMethod('getFileStatus', [fileEntry, completer.callback]);
    return completer.future;
  }

  Future<FileStatusInfo> getFileStatuses(var fileEntries) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(FileStatusInfo.create);
    _syncFileSystem.callMethod('getFileStatuses', [fileEntries, completer.callback]);
    return completer.future;
  }

  Future<ServiceStatus> getServiceStatus() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(ServiceStatus.create);
    _syncFileSystem.callMethod('getServiceStatus', [completer.callback]);
    return completer.future;
  }

  Stream<ServiceInfo> get onServiceStatusChanged => _onServiceStatusChanged.stream;

  final ChromeStreamController<ServiceInfo> _onServiceStatusChanged =
      new ChromeStreamController<ServiceInfo>.oneArg(_syncFileSystem['onServiceStatusChanged'], ServiceInfo.create);

  Stream<FileInfo> get onFileStatusChanged => _onFileStatusChanged.stream;

  final ChromeStreamController<FileInfo> _onFileStatusChanged =
      new ChromeStreamController<FileInfo>.oneArg(_syncFileSystem['onFileStatusChanged'], FileInfo.create);
}

class SyncAction extends ChromeEnum {
  static const SyncAction ADDED = const SyncAction._('added');
  static const SyncAction UPDATED = const SyncAction._('updated');
  static const SyncAction DELETED = const SyncAction._('deleted');

  static List<SyncAction> _values = [ADDED, UPDATED, DELETED];

  static List<SyncAction> get values => _values;

  static SyncAction create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const SyncAction._(String str): super(str);
}

class ServiceStatus extends ChromeEnum {
  static const ServiceStatus INITIALIZING = const ServiceStatus._('initializing');
  static const ServiceStatus RUNNING = const ServiceStatus._('running');
  static const ServiceStatus AUTHENTICATION_REQUIRED = const ServiceStatus._('authentication_required');
  static const ServiceStatus TEMPORARY_UNAVAILABLE = const ServiceStatus._('temporary_unavailable');
  static const ServiceStatus DISABLED = const ServiceStatus._('disabled');

  static List<ServiceStatus> _values = [INITIALIZING, RUNNING, AUTHENTICATION_REQUIRED, TEMPORARY_UNAVAILABLE, DISABLED];

  static List<ServiceStatus> get values => _values;

  static ServiceStatus create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const ServiceStatus._(String str): super(str);
}

class FileStatus extends ChromeEnum {
  static const FileStatus SYNCED = const FileStatus._('synced');
  static const FileStatus PENDING = const FileStatus._('pending');
  static const FileStatus CONFLICTING = const FileStatus._('conflicting');

  static List<FileStatus> _values = [SYNCED, PENDING, CONFLICTING];

  static List<FileStatus> get values => _values;

  static FileStatus create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const FileStatus._(String str): super(str);
}

class SyncDirection extends ChromeEnum {
  static const SyncDirection LOCAL_TO_REMOTE = const SyncDirection._('local_to_remote');
  static const SyncDirection REMOTE_TO_LOCAL = const SyncDirection._('remote_to_local');

  static List<SyncDirection> _values = [LOCAL_TO_REMOTE, REMOTE_TO_LOCAL];

  static List<SyncDirection> get values => _values;

  static SyncDirection create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const SyncDirection._(String str): super(str);
}

class ConflictResolutionPolicy extends ChromeEnum {
  static const ConflictResolutionPolicy LAST_WRITE_WIN = const ConflictResolutionPolicy._('last_write_win');
  static const ConflictResolutionPolicy MANUAL = const ConflictResolutionPolicy._('manual');

  static List<ConflictResolutionPolicy> _values = [LAST_WRITE_WIN, MANUAL];

  static List<ConflictResolutionPolicy> get values => _values;

  static ConflictResolutionPolicy create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const ConflictResolutionPolicy._(String str): super(str);
}

class FileInfo extends ChromeObject {
  static FileInfo create(JsObject proxy) => proxy == null ? null : new FileInfo.fromProxy(proxy);

  FileInfo({var fileEntry, FileStatus status, SyncAction action, SyncDirection direction}) {
    if (fileEntry != null) this.fileEntry = fileEntry;
    if (status != null) this.status = status;
    if (action != null) this.action = action;
    if (direction != null) this.direction = direction;
  }

  FileInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get fileEntry => proxy['fileEntry'];
  set fileEntry(var value) => proxy['fileEntry'] = value;

  FileStatus get status => FileStatus.create(proxy['status']);
  set status(FileStatus value) => proxy['status'] = value;

  SyncAction get action => SyncAction.create(proxy['action']);
  set action(SyncAction value) => proxy['action'] = value;

  SyncDirection get direction => SyncDirection.create(proxy['direction']);
  set direction(SyncDirection value) => proxy['direction'] = value;
}

class FileStatusInfo extends ChromeObject {
  static FileStatusInfo create(JsObject proxy) => proxy == null ? null : new FileStatusInfo.fromProxy(proxy);

  FileStatusInfo({var fileEntry, FileStatus status, String error}) {
    if (fileEntry != null) this.fileEntry = fileEntry;
    if (status != null) this.status = status;
    if (error != null) this.error = error;
  }

  FileStatusInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get fileEntry => proxy['fileEntry'];
  set fileEntry(var value) => proxy['fileEntry'] = value;

  FileStatus get status => FileStatus.create(proxy['status']);
  set status(FileStatus value) => proxy['status'] = value;

  String get error => proxy['error'];
  set error(String value) => proxy['error'] = value;
}

class StorageInfo extends ChromeObject {
  static StorageInfo create(JsObject proxy) => proxy == null ? null : new StorageInfo.fromProxy(proxy);

  StorageInfo({int usageBytes, int quotaBytes}) {
    if (usageBytes != null) this.usageBytes = usageBytes;
    if (quotaBytes != null) this.quotaBytes = quotaBytes;
  }

  StorageInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get usageBytes => proxy['usageBytes'];
  set usageBytes(int value) => proxy['usageBytes'] = value;

  int get quotaBytes => proxy['quotaBytes'];
  set quotaBytes(int value) => proxy['quotaBytes'] = value;
}

class ServiceInfo extends ChromeObject {
  static ServiceInfo create(JsObject proxy) => proxy == null ? null : new ServiceInfo.fromProxy(proxy);

  ServiceInfo({ServiceStatus state, String description}) {
    if (state != null) this.state = state;
    if (description != null) this.description = description;
  }

  ServiceInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  ServiceStatus get state => ServiceStatus.create(proxy['state']);
  set state(ServiceStatus value) => proxy['state'] = value;

  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;
}
