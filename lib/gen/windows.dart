// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from windows.json - do not edit */

/**
 * Use the `chrome.windows` API to interact with browser windows. You can use
 * this API to create, modify, and rearrange windows in the browser.
 */
library chrome.windows;

import 'tabs.dart';
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
  Future<Window> get(int windowId, [Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('get', [windowId, jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the [current window](#current-window).
   * 
   * [getInfo]
   */
  Future<Window> getCurrent([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('getCurrent', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the window that was most recently focused - typically the window 'on
   * top'.
   * 
   * [getInfo]
   */
  Future<Window> getLastFocused([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('getLastFocused', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Gets all windows.
   * 
   * [getInfo]
   */
  Future<List<Window>> getAll([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _windows.callMethod('getAll', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Creates (opens) a new browser with any optional sizing, position or default
   * URL provided.
   * 
   * Returns:
   * Contains details about the created window.
   */
  Future<Window> create([Map createData]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('create', [jsify(createData), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties of a window. Specify only the properties that you
   * want to change; unspecified properties will be left unchanged.
   */
  Future<Window> update(int windowId, Map updateInfo) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Window.create);
    _windows.callMethod('update', [windowId, jsify(updateInfo), completer.callback]);
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
  Stream<dynamic> get onCreated => _onCreated.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onCreated = null;

  /**
   * Fired when a window is removed (closed).
   */
  Stream<dynamic> get onRemoved => _onRemoved.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onRemoved = null;

  /**
   * Fired when the currently focused window changes. Will be
   * chrome.windows.WINDOW_ID_NONE if all chrome windows have lost focus. Note:
   * On some Linux window managers, WINDOW_ID_NONE will always be sent
   * immediately preceding a switch from one chrome window to another.
   */
  Stream<dynamic> get onFocusChanged => _onFocusChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onFocusChanged = null;
}

class Window extends ChromeObject {
  static Window create(JsObject proxy) => new Window(proxy);

  Window(JsObject proxy): super(proxy);

  /**
   * The ID of the window. Window IDs are unique within a browser session. Under
   * some circumstances a Window may not be assigned an ID, for example when
   * querying windows using the [sessions] API, in which case a session ID may
   * be present.
   */
  int get id => this.proxy['id'];

  /**
   * Whether the window is currently the focused window.
   */
  bool get focused => this.proxy['focused'];

  /**
   * The offset of the window from the top edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned top property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get top => this.proxy['top'];

  /**
   * The offset of the window from the left edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned left property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get left => this.proxy['left'];

  /**
   * The width of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned width property, for example when
   * querying closed windows from the [sessions] API.
   */
  int get width => this.proxy['width'];

  /**
   * The height of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned height property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get height => this.proxy['height'];

  /**
   * Array of [tabs.Tab] objects representing the current tabs in the window.
   */
  List<Tab> get tabs => this.proxy['tabs'];

  /**
   * Whether the window is incognito.
   */
  bool get incognito => this.proxy['incognito'];

  /**
   * The type of browser window this is. Under some circumstances a Window may
   * not be assigned type property, for example when querying closed windows
   * from the [sessions] API.
   */
  String get type => this.proxy['type'];

  /**
   * The state of this browser window. Under some circumstances a Window may not
   * be assigned state property, for example when querying closed windows from
   * the [sessions] API.
   */
  String get state => this.proxy['state'];

  /**
   * Whether the window is set to be always on top.
   */
  bool get alwaysOnTop => this.proxy['alwaysOnTop'];

  /**
   * The session ID used to uniquely identify a Window obtained from the
   * [sessions] API.
   */
  String get sessionId => this.proxy['sessionId'];
}
