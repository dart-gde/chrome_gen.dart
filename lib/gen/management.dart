// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from management.json - do not edit */

/**
 * The `chrome.management` API provides ways to manage the list of
 * extensions/apps that are installed and running. It is particularly useful for
 * extensions that [override](override.html) the built-in New Tab page.
 */
library chrome.management;

import '../src/common.dart';

/// Accessor for the `chrome.management` namespace.
final ChromeManagement management = new ChromeManagement._();

class ChromeManagement {
  JsObject _management;

  ChromeManagement._() {
    _management = context['chrome']['management'];
  }

  /**
   * Returns a list of information about installed extensions and apps.
   */
  Future<dynamic> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _management.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Returns information about the installed extension, app, or theme that has
   * the given ID.
   * 
   * [id] The ID from an item of [ExtensionInfo.]
   */
  Future<dynamic> get(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _management.callMethod('get', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns a list of [permission warnings](permission_warnings.html) for the
   * given extension id.
   * 
   * [id] The ID of an already installed extension.
   */
  Future<dynamic> getPermissionWarningsById(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _management.callMethod('getPermissionWarningsById', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns a list of [permission warnings](permission_warnings.html) for the
   * given extension manifest string. Note: This function can be used without
   * requesting the 'management' permission in the manifest.
   * 
   * [manifestStr] Extension manifest JSON string.
   */
  Future<dynamic> getPermissionWarningsByManifest(String manifestStr) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _management.callMethod('getPermissionWarningsByManifest', [manifestStr, completer.callback]);
    return completer.future;
  }

  /**
   * Enables or disables an app or extension.
   * 
   * [id] This should be the id from an item of [ExtensionInfo.]
   * 
   * [enabled] Whether this item should be enabled or disabled.
   */
  Future setEnabled(String id, bool enabled) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('setEnabled', [id, enabled, completer.callback]);
    return completer.future;
  }

  /**
   * Uninstalls a currently installed app or extension.
   * 
   * [id] This should be the id from an item of [ExtensionInfo.]
   */
  Future uninstall(String id, var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('uninstall', [id, options, completer.callback]);
    return completer.future;
  }

  /**
   * Uninstalls the calling extension. Note: This function can be used without
   * requesting the 'management' permission in the manifest.
   */
  Future uninstallSelf(var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('uninstallSelf', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Launches an application.
   * 
   * [id] The extension id of the application.
   */
  Future launchApp(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('launchApp', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when an app or extension has been installed.
   */
  Stream<dynamic> get onInstalled => _onInstalled.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onInstalled = null;

  /**
   * Fired when an app or extension has been uninstalled.
   */
  Stream<dynamic> get onUninstalled => _onUninstalled.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onUninstalled = null;

  /**
   * Fired when an app or extension has been enabled.
   */
  Stream<dynamic> get onEnabled => _onEnabled.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onEnabled = null;

  /**
   * Fired when an app or extension has been disabled.
   */
  Stream<dynamic> get onDisabled => _onDisabled.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onDisabled = null;
}

/**
 * Information about an icon belonging to an extension, app, or theme.
 */
class IconInfo extends ChromeObject {
  IconInfo(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Information about an installed extension, app, or theme.
 */
class ExtensionInfo extends ChromeObject {
  ExtensionInfo(JsObject proxy): super(proxy);
  // TODO:
}
