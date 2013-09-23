/* This file has been generated from sync_file_system.idl - do not edit */

library chrome.syncFileSystem;

import '../src/common.dart';

/// Accessor for the `chrome.syncFileSystem` namespace.
final ChromeSyncFileSystem syncFileSystem = new ChromeSyncFileSystem._();

class ChromeSyncFileSystem {
  static final JsObject _syncFileSystem = context['chrome']['syncFileSystem'];

  ChromeSyncFileSystem._();

  Future requestFileSystem() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('requestFileSystem', [completer.callback]);
    return completer.future;
  }

  Future setConflictResolutionPolicy(ConflictResolutionPolicy policy) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('setConflictResolutionPolicy', [policy, completer.callback]);
    return completer.future;
  }

  Future getConflictResolutionPolicy() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('getConflictResolutionPolicy', [completer.callback]);
    return completer.future;
  }

  Future getUsageAndQuota(var fileSystem) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('getUsageAndQuota', [fileSystem, completer.callback]);
    return completer.future;
  }

  Future getFileStatus(var fileEntry) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('getFileStatus', [fileEntry, completer.callback]);
    return completer.future;
  }

  Future getFileStatuses(var fileEntries) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('getFileStatuses', [fileEntries, completer.callback]);
    return completer.future;
  }

  Future getServiceStatus() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _syncFileSystem.callMethod('getServiceStatus', [completer.callback]);
    return completer.future;
  }

  Stream<ServiceInfo> get onServiceStatusChanged => _onServiceStatusChanged.stream;

  final ChromeStreamController<ServiceInfo> _onServiceStatusChanged =
      new ChromeStreamController<ServiceInfo>.oneArg(_syncFileSystem['onServiceStatusChanged'], selfConverter);

  Stream<FileInfo> get onFileStatusChanged => _onFileStatusChanged.stream;

  final ChromeStreamController<FileInfo> _onFileStatusChanged =
      new ChromeStreamController<FileInfo>.oneArg(_syncFileSystem['onFileStatusChanged'], selfConverter);
}

class FileInfo extends ChromeObject {
  static FileInfo create(JsObject proxy) => proxy == null ? null : new FileInfo(proxy);

  FileInfo(JsObject proxy): super(proxy);
}

class FileStatusInfo extends ChromeObject {
  static FileStatusInfo create(JsObject proxy) => proxy == null ? null : new FileStatusInfo(proxy);

  FileStatusInfo(JsObject proxy): super(proxy);
}

class StorageInfo extends ChromeObject {
  static StorageInfo create(JsObject proxy) => proxy == null ? null : new StorageInfo(proxy);

  StorageInfo(JsObject proxy): super(proxy);
}

class ServiceInfo extends ChromeObject {
  static ServiceInfo create(JsObject proxy) => proxy == null ? null : new ServiceInfo(proxy);

  ServiceInfo(JsObject proxy): super(proxy);
}
