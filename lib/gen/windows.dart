// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from windows.json - do not edit */

/**
 * Use the `chrome.windows` API to interact with browser windows. You can use
 * this API to create, modify, and rearrange windows in the browser.
 */
library chrome.windows;

import '../src/common.dart';

/// Accessor for the `chrome.windows` namespace.
final ChromeWindows windows = new ChromeWindows._();

class ChromeWindows {
  JsObject _windows;

  ChromeWindows._() {
    _windows = context['chrome']['windows'];
  }

  /**
   * The windowId value that represents the absence of a chrome browser window.
   */
  int get WINDOW_ID_NONE => _windows['WINDOW_ID_NONE'];

  /**
   * The windowId value that represents the [current
   * window](windows.html#current-window).
   */
  int get WINDOW_ID_CURRENT => _windows['WINDOW_ID_CURRENT'];

  /**
   * Gets details about a window.
   * 
   * [getInfo]
   */
  Future<dynamic> get(int windowId, var getInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _windows.callMethod('get', [windowId, getInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the [current window](#current-window).
   * 
   * [getInfo]
   */
  Future<dynamic> getCurrent(var getInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _windows.callMethod('getCurrent', [getInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the window that was most recently focused - typically the window 'on
   * top'.
   * 
   * [getInfo]
   */
  Future<dynamic> getLastFocused(var getInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _windows.callMethod('getLastFocused', [getInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Gets all windows.
   * 
   * [getInfo]
   */
  Future<dynamic> getAll(var getInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _windows.callMethod('getAll', [getInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Creates (opens) a new browser with any optional sizing, position or default
   * URL provided.
   */
  Future<dynamic> create(var createData) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _windows.callMethod('create', [createData, completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties of a window. Specify only the properties that you
   * want to change; unspecified properties will be left unchanged.
   */
  Future<dynamic> update(int windowId, var updateInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _windows.callMethod('update', [windowId, updateInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Removes (closes) a window, and all the tabs inside it.
   */
  Future remove(int windowId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _windows.callMethod('remove', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a window is created.
   */
  Stream get onCreated => _onCreated.stream;

  final ChromeStreamController _onCreated = null;

  /**
   * Fired when a window is removed (closed).
   */
  Stream get onRemoved => _onRemoved.stream;

  final ChromeStreamController _onRemoved = null;

  /**
   * Fired when the currently focused window changes. Will be
   * chrome.windows.WINDOW_ID_NONE if all chrome windows have lost focus. Note:
   * On some Linux window managers, WINDOW_ID_NONE will always be sent
   * immediately preceding a switch from one chrome window to another.
   */
  Stream get onFocusChanged => _onFocusChanged.stream;

  final ChromeStreamController _onFocusChanged = null;
}
