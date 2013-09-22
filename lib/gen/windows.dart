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
  static final JsObject _windows = context['chrome']['windows'];

  ChromeWindows._();

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
   * 
   * `populate` If true, the [windows.Window] object will have a [tabs] property
   * that contains a list of the [tabs.Tab] objects. The `Tab` objects only
   * contain the `url`, `title` and `favIconUrl` properties if the extension's
   * manifest file includes the `"tabs"` permission.
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
   * 
   * `populate` If true, the [windows.Window] object will have a [tabs] property
   * that contains a list of the [tabs.Tab] objects. The `Tab` objects only
   * contain the `url`, `title` and `favIconUrl` properties if the extension's
   * manifest file includes the `"tabs"` permission.
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
   * 
   * `populate` If true, the [windows.Window] object will have a [tabs] property
   * that contains a list of the [tabs.Tab] objects. The `Tab` objects only
   * contain the `url`, `title` and `favIconUrl` properties if the extension's
   * manifest file includes the `"tabs"` permission.
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
   * 
   * `populate` If true, each [windows.Window] object will have a [tabs]
   * property that contains a list of the [tabs.Tab] objects for that window.
   * The `Tab` objects only contain the `url`, `title` and `favIconUrl`
   * properties if the extension's manifest file includes the `"tabs"`
   * permission.
   */
  Future<List<Window>> getAll([Map getInfo]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Window.create));
    _windows.callMethod('getAll', [jsify(getInfo), completer.callback]);
    return completer.future;
  }

  /**
   * Creates (opens) a new browser with any optional sizing, position or default
   * URL provided.
   * 
   * [createData] `url` A URL or array of URLs to open as tabs in the window.
   * Fully-qualified URLs must include a scheme (i.e. 'http://www.google.com',
   * not 'www.google.com'). Relative URLs will be relative to the current page
   * within the extension. Defaults to the New Tab Page.
   * 
   * `tabId` The id of the tab for which you want to adopt to the new window.
   * 
   * `left` The number of pixels to position the new window from the left edge
   * of the screen. If not specified, the new window is offset naturally from
   * the last focused window. This value is ignored for panels.
   * 
   * `top` The number of pixels to position the new window from the top edge of
   * the screen. If not specified, the new window is offset naturally from the
   * last focused window. This value is ignored for panels.
   * 
   * `width` The width in pixels of the new window, including the frame. If not
   * specified defaults to a natural width.
   * 
   * `height` The height in pixels of the new window, including the frame. If
   * not specified defaults to a natural height.
   * 
   * `focused` If true, opens an active window. If false, opens an inactive
   * window.
   * 
   * `incognito` Whether the new window should be an incognito window.
   * 
   * `type` Specifies what type of browser window to create. The 'panel' and
   * 'detached_panel' types create a popup unless the '--enable-panels' flag is
   * set.
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
   * 
   * [updateInfo] `left` The offset from the left edge of the screen to move the
   * window to in pixels. This value is ignored for panels.
   * 
   * `top` The offset from the top edge of the screen to move the window to in
   * pixels. This value is ignored for panels.
   * 
   * `width` The width to resize the window to in pixels. This value is ignored
   * for panels.
   * 
   * `height` The height to resize the window to in pixels. This value is
   * ignored for panels.
   * 
   * `focused` If true, brings the window to the front. If false, brings the
   * next window in the z-order to the front.
   * 
   * `drawAttention` If true, causes the window to be displayed in a manner that
   * draws the user's attention to the window, without changing the focused
   * window. The effect lasts until the user changes focus to the window. This
   * option has no effect if the window already has focus. Set to false to
   * cancel a previous draw attention request.
   * 
   * `state` The new state of the window. The 'minimized', 'maximized' and
   * 'fullscreen' states cannot be combined with 'left', 'top', 'width' or
   * 'height'.
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
  Stream<Window> get onCreated => _onCreated.stream;

  final ChromeStreamController<Window> _onCreated =
      new ChromeStreamController<Window>.oneArg(_windows['onCreated'], Window.create);

  /**
   * Fired when a window is removed (closed).
   */
  Stream<int> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<int> _onRemoved =
      new ChromeStreamController<int>.oneArg(_windows['onRemoved'], selfConverter);

  /**
   * Fired when the currently focused window changes. Will be
   * chrome.windows.WINDOW_ID_NONE if all chrome windows have lost focus. Note:
   * On some Linux window managers, WINDOW_ID_NONE will always be sent
   * immediately preceding a switch from one chrome window to another.
   */
  Stream<int> get onFocusChanged => _onFocusChanged.stream;

  final ChromeStreamController<int> _onFocusChanged =
      new ChromeStreamController<int>.oneArg(_windows['onFocusChanged'], selfConverter);
}

/**
 * `id` The ID of the window. Window IDs are unique within a browser session.
 * Under some circumstances a Window may not be assigned an ID, for example when
 * querying windows using the [sessions] API, in which case a session ID may be
 * present.
 * 
 * `focused` Whether the window is currently the focused window.
 * 
 * `top` The offset of the window from the top edge of the screen in pixels.
 * Under some circumstances a Window may not be assigned top property, for
 * example when querying closed windows from the [sessions] API.
 * 
 * `left` The offset of the window from the left edge of the screen in pixels.
 * Under some circumstances a Window may not be assigned left property, for
 * example when querying closed windows from the [sessions] API.
 * 
 * `width` The width of the window, including the frame, in pixels. Under some
 * circumstances a Window may not be assigned width property, for example when
 * querying closed windows from the [sessions] API.
 * 
 * `height` The height of the window, including the frame, in pixels. Under some
 * circumstances a Window may not be assigned height property, for example when
 * querying closed windows from the [sessions] API.
 * 
 * `tabs` Array of [tabs.Tab] objects representing the current tabs in the
 * window.
 * 
 * `incognito` Whether the window is incognito.
 * 
 * `type` The type of browser window this is. Under some circumstances a Window
 * may not be assigned type property, for example when querying closed windows
 * from the [sessions] API.
 * 
 * `state` The state of this browser window. Under some circumstances a Window
 * may not be assigned state property, for example when querying closed windows
 * from the [sessions] API.
 * 
 * `alwaysOnTop` Whether the window is set to be always on top.
 * 
 * `sessionId` The session ID used to uniquely identify a Window obtained from
 * the [sessions] API.
 */
class Window extends ChromeObject {
  static Window create(JsObject proxy) => new Window(proxy);

  Window(JsObject proxy): super(proxy);

  /**
   * The ID of the window. Window IDs are unique within a browser session. Under
   * some circumstances a Window may not be assigned an ID, for example when
   * querying windows using the [sessions] API, in which case a session ID may
   * be present.
   */
  int get id => proxy['id'];

  /**
   * Whether the window is currently the focused window.
   */
  bool get focused => proxy['focused'];

  /**
   * The offset of the window from the top edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned top property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get top => proxy['top'];

  /**
   * The offset of the window from the left edge of the screen in pixels. Under
   * some circumstances a Window may not be assigned left property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get left => proxy['left'];

  /**
   * The width of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned width property, for example when
   * querying closed windows from the [sessions] API.
   */
  int get width => proxy['width'];

  /**
   * The height of the window, including the frame, in pixels. Under some
   * circumstances a Window may not be assigned height property, for example
   * when querying closed windows from the [sessions] API.
   */
  int get height => proxy['height'];

  /**
   * Array of [tabs.Tab] objects representing the current tabs in the window.
   */
  List<Tab> get tabs => listify(proxy['tabs'], Tab.create);

  /**
   * Whether the window is incognito.
   */
  bool get incognito => proxy['incognito'];

  /**
   * The type of browser window this is. Under some circumstances a Window may
   * not be assigned type property, for example when querying closed windows
   * from the [sessions] API.
   */
  String get type => proxy['type'];

  /**
   * The state of this browser window. Under some circumstances a Window may not
   * be assigned state property, for example when querying closed windows from
   * the [sessions] API.
   */
  String get state => proxy['state'];

  /**
   * Whether the window is set to be always on top.
   */
  bool get alwaysOnTop => proxy['alwaysOnTop'];

  /**
   * The session ID used to uniquely identify a Window obtained from the
   * [sessions] API.
   */
  String get sessionId => proxy['sessionId'];
}
