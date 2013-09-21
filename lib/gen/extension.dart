// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from extension.json - do not edit */

/**
 * The `chrome.extension` API has utilities that can be used by any extension
 * page. It includes support for exchanging messages between an extension and
 * its content scripts or between extensions, as described in detail in [Message
 * Passing](messaging.html).
 */
library chrome.extension;

import 'runtime.dart';
import '../src/common.dart';

/// Accessor for the `chrome.extension` namespace.
final ChromeExtension extension = new ChromeExtension._();

class ChromeExtension {
  JsObject _extension;

  ChromeExtension._() {
    _extension = context['chrome']['extension'];
  }

  /**
   * Set for the lifetime of a callback if an ansychronous extension api has
   * resulted in an error. If no error has occured lastError will be
   * [undefined].
   */
  Map get lastError => mapify(_extension['lastError']);

  /**
   * True for content scripts running inside incognito tabs, and for extension
   * pages running inside an incognito process. The latter only applies to
   * extensions with 'split' incognito_behavior.
   */
  bool get inIncognitoContext => _extension['inIncognitoContext'];

  /**
   * Deprecated: Please use sendMessage.
   * 
   * [extensionId] The extension ID of the extension you want to connect to. If
   * omitted, default is your own extension.
   * 
   * Returns:
   * The JSON response object sent by the handler of the request. If an error
   * occurs while connecting to the extension, the callback will be called with
   * no arguments and [runtime.lastError] will be set to the error message.
   */
  Future<dynamic> sendRequest(var request, [String extensionId]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _extension.callMethod('sendRequest', [extensionId, request, completer.callback]);
    return completer.future;
  }

  /**
   * Converts a relative path within an extension install directory to a
   * fully-qualified URL.
   * 
   * [path] A path to a resource within an extension expressed relative to its
   * install directory.
   * 
   * Returns:
   * The fully-qualified URL to the resource.
   */
  String getURL(String path) {
    return _extension.callMethod('getURL', [path]);
  }

  /**
   * Returns an array of the JavaScript 'window' objects for each of the pages
   * running inside the current extension.
   * 
   * Returns:
   * Array of global objects
   */
  List<dynamic> getViews([Map fetchProperties]) {
    return _extension.callMethod('getViews', [jsify(fetchProperties)]);
  }

  /**
   * Returns the JavaScript 'window' object for the background page running
   * inside the current extension. Returns null if the extension has no
   * background page.
   */
  dynamic getBackgroundPage() {
    return _extension.callMethod('getBackgroundPage');
  }

  /**
   * Deprecated. Please use getViews({type: 'TAB'}). Returns an array of the
   * JavaScript 'window' objects for each of the tabs running inside the current
   * extension. If windowId is specified, returns only the 'window' objects of
   * tabs attached to the specified window.
   * 
   * Returns:
   * Array of global window objects
   */
  List<dynamic> getExtensionTabs([int windowId]) {
    return _extension.callMethod('getExtensionTabs', [windowId]);
  }

  /**
   * Retrieves the state of the extension's access to Incognito-mode (as
   * determined by the user-controlled 'Allowed in Incognito' checkbox.
   * 
   * Returns:
   * True if the extension has access to Incognito mode, false otherwise.
   */
  Future<bool> isAllowedIncognitoAccess() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _extension.callMethod('isAllowedIncognitoAccess', [completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the state of the extension's access to the 'file://' scheme (as
   * determined by the user-controlled 'Allow access to File URLs' checkbox.
   * 
   * Returns:
   * True if the extension can access the 'file://' scheme, false otherwise.
   */
  Future<bool> isAllowedFileSchemeAccess() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _extension.callMethod('isAllowedFileSchemeAccess', [completer.callback]);
    return completer.future;
  }

  /**
   * Sets the value of the ap CGI parameter used in the extension's update URL.
   * This value is ignored for extensions that are hosted in the Chrome
   * Extension Gallery.
   */
  void setUpdateUrlData(String data) {
    _extension.callMethod('setUpdateUrlData', [data]);
  }

  /**
   * Deprecated: please use onMessage.
   */
  Stream<dynamic> get onRequest => _onRequest.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onRequest = null;

  /**
   * Deprecated: please use onMessageExternal.
   */
  Stream<dynamic> get onRequestExternal => _onRequestExternal.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onRequestExternal = null;
}
