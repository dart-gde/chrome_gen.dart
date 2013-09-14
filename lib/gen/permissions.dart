// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from permissions.json - do not edit */

/**
 * Use the `chrome.permissions` API to request [declared optional
 * permissions](#manifest) at run time rather than install time, so users
 * understand why the permissions are needed and grant only those that are
 * necessary.
 */
library chrome.permissions;

import '../src/common.dart';

/// Accessor for the `chrome.permissions` namespace.
final ChromePermissions permissions = new ChromePermissions._();

class ChromePermissions {
  JsObject _permissions;

  ChromePermissions._() {
    _permissions = context['chrome']['permissions'];
  }

  /**
   * Gets the extension's current set of permissions.
   */
  Future<dynamic> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _permissions.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Checks if the extension has the specified permissions.
   */
  Future<bool> contains(var permissions) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _permissions.callMethod('contains', [permissions, completer.callback]);
    return completer.future;
  }

  /**
   * Requests access to the specified permissions. These permissions must be
   * defined in the optional_permissions field of the manifest. If there are any
   * problems requesting the permissions, [runtime.lastError] will be set.
   */
  Future<bool> request(var permissions) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _permissions.callMethod('request', [permissions, completer.callback]);
    return completer.future;
  }

  /**
   * Removes access to the specified permissions. If there are any problems
   * removing the permissions, [runtime.lastError] will be set.
   */
  Future<bool> remove(var permissions) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _permissions.callMethod('remove', [permissions, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when the extension acquires new permissions.
   */
  Stream get onAdded => _onAdded.stream;

  final ChromeStreamController _onAdded = null;

  /**
   * Fired when access to permissions has been removed from the extension.
   */
  Stream get onRemoved => _onRemoved.stream;

  final ChromeStreamController _onRemoved = null;
}
