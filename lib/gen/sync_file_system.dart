// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from sync_file_system.idl - do not edit */

/**
 * 
 */
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
