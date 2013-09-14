// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from runtime.json - do not edit */

/**
 * Use the `chrome.runtime` API to retrieve the background page, return details
 * about the manifest, and listen for and respond to events in the app or
 * extension lifecycle. You can also use this API to convert the relative path
 * of URLs to fully-qualified URLs.
 */
library chrome.runtime;

import '../src/common.dart';

/// Accessor for the `chrome.runtime` namespace.
final ChromeRuntime runtime = new ChromeRuntime._();

class ChromeRuntime {
  JsObject _runtime;

  ChromeRuntime._() {
    _runtime = context['chrome']['runtime'];
  }

  /**
   * This will be defined during an API method callback if there was an error
   */
  dynamic get lastError => _runtime['lastError'];

  /**
   * The ID of the extension/app.
   */
  String get id => _runtime['id'];

  /**
   * Retrieves the JavaScript 'window' object for the background page running
   * inside the current extension/app. If the background page is an event page,
   * the system will ensure it is loaded before calling the callback. If there
   * is no background page, an error is set.
   */
  Future<dynamic> getBackgroundPage() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _runtime.callMethod('getBackgroundPage', [completer.callback]);
    return completer.future;
  }

  /**
   * Returns details about the app or extension from the manifest. The object
   * returned is a serialization of the full [manifest file](manifest.html).
   */
  dynamic getManifest() {
    return _runtime.callMethod('getManifest');
  }

  /**
   * Converts a relative path within an app/extension install directory to a
   * fully-qualified URL.
   * 
   * [path] A path to a resource within an app/extension expressed relative to
   * its install directory.
   */
  String getURL(String path) {
    return _runtime.callMethod('getURL', [path]);
  }

  /**
   * Sets the URL to be visited upon uninstallation. This may be used to clean
   * up server-side data, do analytics, and implement surveys. Maximum 255
   * characters.
   */
  void setUninstallUrl(String url) {
    _runtime.callMethod('setUninstallUrl', [url]);
  }

  /**
   * Reloads the app or extension.
   */
  void reload() {
    _runtime.callMethod('reload');
  }

  /**
   * Requests an update check for this app/extension.
   */
  Future<String> requestUpdateCheck() {
    ChromeCompleter completer = new ChromeCompleter.twoArgs((arg1, arg2) {
      return null;
    });
    _runtime.callMethod('requestUpdateCheck', [completer.callback]);
    return completer.future;
  }

  /**
   * Attempts to connect to other listeners within the extension/app (such as
   * the background page), or other extensions/apps. This is useful for content
   * scripts connecting to their extension processes. Note that this does not
   * connect to any listeners in a content script. Extensions may connect to
   * content scripts embedded in tabs via [tabs.connect.]
   * 
   * [extensionId] The ID of the extension/app you want to connect to. If
   * omitted, default is your own extension.
   */
  dynamic connect(String extensionId, var connectInfo) {
    return _runtime.callMethod('connect', [extensionId, connectInfo]);
  }

  /**
   * Connects to a native application in the host machine.
   * 
   * [application] The name of the registered application to connect to.
   */
  dynamic connectNative(String application) {
    return _runtime.callMethod('connectNative', [application]);
  }

  /**
   * Sends a single message to onMessage event listeners within the extension
   * (or another extension/app). Similar to chrome.runtime.connect, but only
   * sends a single message with an optional response. The [runtime.onMessage]
   * event is fired in each extension page of the extension. Note that
   * extensions cannot send messages to content scripts using this method. To
   * send messages to content scripts, use [tabs.sendMessage.]
   * 
   * [extensionId] The extension ID of the extension you want to connect to. If
   * omitted, default is your own extension.
   */
  Future<dynamic> sendMessage(String extensionId, var message) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _runtime.callMethod('sendMessage', [extensionId, message, completer.callback]);
    return completer.future;
  }

  /**
   * Send a single message to a native application.
   * 
   * [application] The name of the native messaging host.
   * 
   * [message] The message that will be passed to the native messaging host.
   */
  Future<dynamic> sendNativeMessage(String application, var message) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _runtime.callMethod('sendNativeMessage', [application, message, completer.callback]);
    return completer.future;
  }

  /**
   * Returns information about the current platform.
   * 
   * [callback] Called with results
   */
  Future<dynamic> getPlatformInfo() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _runtime.callMethod('getPlatformInfo', [completer.callback]);
    return completer.future;
  }

  /**
   * Returns a DirectoryEntry for the package directory.
   */
  Future<dynamic> getPackageDirectoryEntry() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _runtime.callMethod('getPackageDirectoryEntry', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a profile that has this extension installed first starts up.
   * This event is not fired when an incognito profile is started, even if this
   * extension is operating in 'split' incognito mode.
   */
  Stream get onStartup => _onStartup.stream;

  final ChromeStreamController _onStartup = null;

  /**
   * Fired when the extension is first installed, when the extension is updated
   * to a new version, and when Chrome is updated to a new version.
   */
  Stream get onInstalled => _onInstalled.stream;

  final ChromeStreamController _onInstalled = null;

  /**
   * Sent to the event page just before it is unloaded. This gives the extension
   * opportunity to do some clean up. Note that since the page is unloading, any
   * asynchronous operations started while handling this event are not
   * guaranteed to complete. If more activity for the event page occurs before
   * it gets unloaded the onSuspendCanceled event will be sent and the page
   * won't be unloaded.
   */
  Stream get onSuspend => _onSuspend.stream;

  final ChromeStreamController _onSuspend = null;

  /**
   * Sent after onSuspend to indicate that the app won't be unloaded after all.
   */
  Stream get onSuspendCanceled => _onSuspendCanceled.stream;

  final ChromeStreamController _onSuspendCanceled = null;

  /**
   * Fired when an update is available, but isn't installed immediately because
   * the app is currently running. If you do nothing, the update will be
   * installed the next time the background page gets unloaded, if you want it
   * to be installed sooner you can explicitly call chrome.runtime.reload().
   */
  Stream get onUpdateAvailable => _onUpdateAvailable.stream;

  final ChromeStreamController _onUpdateAvailable = null;

  /**
   * Fired when a Chrome update is available, but isn't installed immediately
   * because a browser restart is required.
   */
  Stream get onBrowserUpdateAvailable => _onBrowserUpdateAvailable.stream;

  final ChromeStreamController _onBrowserUpdateAvailable = null;

  /**
   * Fired when a connection is made from either an extension process or a
   * content script.
   */
  Stream get onConnect => _onConnect.stream;

  final ChromeStreamController _onConnect = null;

  /**
   * Fired when a connection is made from another extension.
   */
  Stream get onConnectExternal => _onConnectExternal.stream;

  final ChromeStreamController _onConnectExternal = null;

  /**
   * Fired when a message is sent from either an extension process or a content
   * script.
   */
  Stream get onMessage => _onMessage.stream;

  final ChromeStreamController _onMessage = null;

  /**
   * Fired when a message is sent from another extension/app. Cannot be used in
   * a content script.
   */
  Stream get onMessageExternal => _onMessageExternal.stream;

  final ChromeStreamController _onMessageExternal = null;

  /**
   * Fired when an app or the device that it runs on needs to be restarted. The
   * app should close all its windows at its earliest convenient time to let the
   * restart to happen. If the app does nothing, a restart will be enforced
   * after a 24-hour grace period has passed. Currently, this event is only
   * fired for Chrome OS kiosk apps.
   */
  Stream get onRestartRequired => _onRestartRequired.stream;

  final ChromeStreamController _onRestartRequired = null;
}
