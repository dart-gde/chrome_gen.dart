/* This file has been generated from sync_file_system.idl - do not edit */

library chrome.syncFileSystem;

import '../src/common.dart';

/// Accessor for the `chrome.syncFileSystem` namespace.
final ChromeSyncFileSystem syncFileSystem = new ChromeSyncFileSystem._();

class ChromeSyncFileSystem {
  static final JsObject _syncFileSystem = context['chrome']['syncFileSystem'];

  ChromeSyncFileSystem._();

  Future<dynamic> requestFileSystem() {
    var completer = new ChromeCompleter<dynamic>.oneArg();
    _syncFileSystem.callMethod('requestFileSystem', [completer.callback]);
    return completer.future;
  }

  Future setConflictResolutionPolicy(ConflictResolutionPolicy policy) {
    var completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('setConflictResolutionPolicy', [policy, completer.callback]);
    return completer.future;
  }

  Future<ConflictResolutionPolicy> getConflictResolutionPolicy() {
    var completer = new ChromeCompleter<ConflictResolutionPolicy>.oneArg(_createConflictResolutionPolicy);
    _syncFileSystem.callMethod('getConflictResolutionPolicy', [completer.callback]);
    return completer.future;
  }

  Future<StorageInfo> getUsageAndQuota(dynamic fileSystem) {
    var completer = new ChromeCompleter<StorageInfo>.oneArg(_createStorageInfo);
    _syncFileSystem.callMethod('getUsageAndQuota', [fileSystem, completer.callback]);
    return completer.future;
  }

  Future<FileStatus> getFileStatus(dynamic fileEntry) {
    var completer = new ChromeCompleter<FileStatus>.oneArg(_createFileStatus);
    _syncFileSystem.callMethod('getFileStatus', [fileEntry, completer.callback]);
    return completer.future;
  }

  Future<FileStatusInfo> getFileStatuses(dynamic fileEntries) {
    var completer = new ChromeCompleter<FileStatusInfo>.oneArg(_createFileStatusInfo);
    _syncFileSystem.callMethod('getFileStatuses', [fileEntries, completer.callback]);
    return completer.future;
  }

  Future<ServiceStatus> getServiceStatus() {
    var completer = new ChromeCompleter<ServiceStatus>.oneArg(_createServiceStatus);
    _syncFileSystem.callMethod('getServiceStatus', [completer.callback]);
    return completer.future;
  }

  Stream<ServiceInfo> get onServiceStatusChanged => _onServiceStatusChanged.stream;

  final ChromeStreamController<ServiceInfo> _onServiceStatusChanged =
      new ChromeStreamController<ServiceInfo>.oneArg(_syncFileSystem['onServiceStatusChanged'], _createServiceInfo);

  Stream<FileInfo> get onFileStatusChanged => _onFileStatusChanged.stream;

  final ChromeStreamController<FileInfo> _onFileStatusChanged =
      new ChromeStreamController<FileInfo>.oneArg(_syncFileSystem['onFileStatusChanged'], _createFileInfo);
}

class SyncAction extends ChromeEnum {
  static const SyncAction ADDED = const SyncAction._('added');
  static const SyncAction UPDATED = const SyncAction._('updated');
  static const SyncAction DELETED = const SyncAction._('deleted');

  static const List<SyncAction> VALUES = const[ADDED, UPDATED, DELETED];

  const SyncAction._(String str): super(str);
}

class ServiceStatus extends ChromeEnum {
  static const ServiceStatus INITIALIZING = const ServiceStatus._('initializing');
  static const ServiceStatus RUNNING = const ServiceStatus._('running');
  static const ServiceStatus AUTHENTICATION_REQUIRED = const ServiceStatus._('authentication_required');
  static const ServiceStatus TEMPORARY_UNAVAILABLE = const ServiceStatus._('temporary_unavailable');
  static const ServiceStatus DISABLED = const ServiceStatus._('disabled');

  static const List<ServiceStatus> VALUES = const[INITIALIZING, RUNNING, AUTHENTICATION_REQUIRED, TEMPORARY_UNAVAILABLE, DISABLED];

  const ServiceStatus._(String str): super(str);
}

class FileStatus extends ChromeEnum {
  static const FileStatus SYNCED = const FileStatus._('synced');
  static const FileStatus PENDING = const FileStatus._('pending');
  static const FileStatus CONFLICTING = const FileStatus._('conflicting');

  static const List<FileStatus> VALUES = const[SYNCED, PENDING, CONFLICTING];

  const FileStatus._(String str): super(str);
}

class SyncDirection extends ChromeEnum {
  static const SyncDirection LOCAL_TO_REMOTE = const SyncDirection._('local_to_remote');
  static const SyncDirection REMOTE_TO_LOCAL = const SyncDirection._('remote_to_local');

  static const List<SyncDirection> VALUES = const[LOCAL_TO_REMOTE, REMOTE_TO_LOCAL];

  const SyncDirection._(String str): super(str);
}

class ConflictResolutionPolicy extends ChromeEnum {
  static const ConflictResolutionPolicy LAST_WRITE_WIN = const ConflictResolutionPolicy._('last_write_win');
  static const ConflictResolutionPolicy MANUAL = const ConflictResolutionPolicy._('manual');

  static const List<ConflictResolutionPolicy> VALUES = const[LAST_WRITE_WIN, MANUAL];

  const ConflictResolutionPolicy._(String str): super(str);
}

class FileInfo extends ChromeObject {

  FileInfo({var fileEntry, FileStatus status, SyncAction action, SyncDirection direction}) {
    if (fileEntry != null) this.fileEntry = fileEntry;
    if (status != null) this.status = status;
    if (action != null) this.action = action;
    if (direction != null) this.direction = direction;
  }

  FileInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get fileEntry => proxy['fileEntry'];
  set fileEntry(var value) => proxy['fileEntry'] = value;

  FileStatus get status => _createFileStatus(proxy['status']);
  set status(FileStatus value) => proxy['status'] = value;

  SyncAction get action => _createSyncAction(proxy['action']);
  set action(SyncAction value) => proxy['action'] = value;

  SyncDirection get direction => _createSyncDirection(proxy['direction']);
  set direction(SyncDirection value) => proxy['direction'] = value;
}

class FileStatusInfo extends ChromeObject {

  FileStatusInfo({var fileEntry, FileStatus status, String error}) {
    if (fileEntry != null) this.fileEntry = fileEntry;
    if (status != null) this.status = status;
    if (error != null) this.error = error;
  }

  FileStatusInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get fileEntry => proxy['fileEntry'];
  set fileEntry(var value) => proxy['fileEntry'] = value;

  FileStatus get status => _createFileStatus(proxy['status']);
  set status(FileStatus value) => proxy['status'] = value;

  String get error => proxy['error'];
  set error(String value) => proxy['error'] = value;
}

class StorageInfo extends ChromeObject {

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

  ServiceInfo({ServiceStatus state, String description}) {
    if (state != null) this.state = state;
    if (description != null) this.description = description;
  }

  ServiceInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  ServiceStatus get state => _createServiceStatus(proxy['state']);
  set state(ServiceStatus value) => proxy['state'] = value;

  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;
}

ConflictResolutionPolicy _createConflictResolutionPolicy(String value) => ConflictResolutionPolicy.VALUES.singleWhere((ChromeEnum e) => e.value == value);
StorageInfo _createStorageInfo(JsObject proxy) => proxy == null ? null : new StorageInfo.fromProxy(proxy);
FileStatus _createFileStatus(String value) => FileStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
FileStatusInfo _createFileStatusInfo(JsObject proxy) => proxy == null ? null : new FileStatusInfo.fromProxy(proxy);
ServiceStatus _createServiceStatus(String value) => ServiceStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ServiceInfo _createServiceInfo(JsObject proxy) => proxy == null ? null : new ServiceInfo.fromProxy(proxy);
FileInfo _createFileInfo(JsObject proxy) => proxy == null ? null : new FileInfo.fromProxy(proxy);
SyncAction _createSyncAction(String value) => SyncAction.VALUES.singleWhere((ChromeEnum e) => e.value == value);
SyncDirection _createSyncDirection(String value) => SyncDirection.VALUES.singleWhere((ChromeEnum e) => e.value == value);
