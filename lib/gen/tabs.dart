// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from tabs.json - do not edit */

/**
 * Use the `chrome.tabs` API to interact with the browser's tab system. You can
 * use this API to create, modify, and rearrange tabs in the browser.
 */
library chrome.tabs;

import '../src/common.dart';

/// Accessor for the `chrome.tabs` namespace.
final ChromeTabs tabs = new ChromeTabs._();

class ChromeTabs {
  ChromeTabs._();

  /**
   * Retrieves details about the specified tab.
   */
  Future get(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('get', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the tab that this script call is being made from. May be undefined if
   * called from a non-tab context (for example: a background page or popup
   * view).
   */
  Future getCurrent() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('getCurrent', [completer.callback]);
    return completer.future;
  }

  /**
   * Connects to the content script(s) in the specified tab. The
   * [runtime.onConnect] event is fired in each content script running in the
   * specified tab for the current extension. For more details, see [Content
   * Script Messaging](messaging.html).
   */
  dynamic connect(int tabId, dynamic connectInfo) {
    return chrome['tabs'].callMethod('connect', [tabId, connectInfo]);
  }

  /**
   * Deprecated: Please use sendMessage.
   */
  void sendRequest(int tabId, dynamic request, dynamic responseCallback) {
    chrome['tabs'].callMethod('sendRequest', [tabId, request, responseCallback]);
  }

  /**
   * Sends a single message to the content script(s) in the specified tab, with
   * an optional callback to run when a response is sent back.  The
   * [runtime.onMessage] event is fired in each content script running in the
   * specified tab for the current extension.
   */
  void sendMessage(int tabId, dynamic message, dynamic responseCallback) {
    chrome['tabs'].callMethod('sendMessage', [tabId, message, responseCallback]);
  }

  /**
   * Deprecated. Please use query({'active': true}). Gets the tab that is
   * selected in the specified window.
   * 
   * [windowId] Defaults to the [current window](windows.html#current-window).
   */
  Future getSelected(int windowId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('getSelected', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Deprecated. Please use query({'windowId': windowId}). Gets details about
   * all tabs in the specified window.
   * 
   * [windowId] Defaults to the [current window](windows.html#current-window).
   */
  Future getAllInWindow(int windowId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('getAllInWindow', [windowId, completer.callback]);
    return completer.future;
  }

  /**
   * Creates a new tab.
   */
  Future create(dynamic createProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('create', [createProperties, completer.callback]);
    return completer.future;
  }

  /**
   * Duplicates a tab.
   * 
   * [tabId] The ID of the tab which is to be duplicated.
   */
  Future duplicate(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('duplicate', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Gets all tabs that have the specified properties, or all tabs if no
   * properties are specified.
   */
  Future query(dynamic queryInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('query', [queryInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Highlights the given tabs.
   */
  Future highlight(dynamic highlightInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('highlight', [highlightInfo, completer.callback]);
    return completer.future;
  }

  /**
   * Modifies the properties of a tab. Properties that are not specified in
   * [updateProperties] are not modified.
   * 
   * [tabId] Defaults to the selected tab of the [current
   * window](windows.html#current-window).
   */
  Future update(int tabId, dynamic updateProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('update', [tabId, updateProperties, completer.callback]);
    return completer.future;
  }

  /**
   * Moves one or more tabs to a new position within its window, or to a new
   * window. Note that tabs can only be moved to and from normal (window.type
   * === "normal") windows.
   * 
   * [tabIds] The tab or list of tabs to move.
   */
  Future move(var tabIds, dynamic moveProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('move', [tabIds, moveProperties, completer.callback]);
    return completer.future;
  }

  /**
   * Reload a tab.
   * 
   * [tabId] The ID of the tab to reload; defaults to the selected tab of the
   * current window.
   */
  Future reload(int tabId, dynamic reloadProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('reload', [tabId, reloadProperties, completer.callback]);
    return completer.future;
  }

  /**
   * Closes one or more tabs.
   * 
   * [tabIds] The tab or list of tabs to close.
   */
  Future remove(var tabIds) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('remove', [tabIds, completer.callback]);
    return completer.future;
  }

  /**
   * Detects the primary language of the content in a tab.
   * 
   * [tabId] Defaults to the active tab of the [current
   * window](windows.html#current-window).
   */
  Future detectLanguage(int tabId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('detectLanguage', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Captures the visible area of the currently active tab in the specified
   * window. You must have [host permission](declare_permissions.html) for the
   * URL displayed by the tab.
   * 
   * [windowId] The target window. Defaults to the [current
   * window](windows.html#current-window).
   * 
   * [options] Set parameters of image capture, such as the format of the
   * resulting image.
   */
  Future captureVisibleTab(int windowId, dynamic options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('captureVisibleTab', [windowId, options, completer.callback]);
    return completer.future;
  }

  /**
   * Injects JavaScript code into a page. For details, see the [programmatic
   * injection](content_scripts.html#pi) section of the content scripts doc.
   * 
   * [tabId] The ID of the tab in which to run the script; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the script to run.
   * 
   * [callback] Called after all the JavaScript has been executed.
   */
  Future executeScript(int tabId, var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('executeScript', [tabId, details, completer.callback]);
    return completer.future;
  }

  /**
   * Injects CSS into a page. For details, see the [programmatic
   * injection](content_scripts.html#pi) section of the content scripts doc.
   * 
   * [tabId] The ID of the tab in which to insert the CSS; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the CSS text to insert.
   * 
   * [callback] Called when all the CSS has been inserted.
   */
  Future insertCSS(int tabId, var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['tabs'].callMethod('insertCSS', [tabId, details, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a tab is created. Note that the tab's URL may not be set at the
   * time this event fired, but you can listen to onUpdated events to be
   * notified when a URL is set.
   */
  Stream get onCreated => null;

  /**
   * Fired when a tab is updated.
   */
  Stream get onUpdated => null;

  /**
   * Fired when a tab is moved within a window. Only one move event is fired,
   * representing the tab the user directly moved. Move events are not fired for
   * the other tabs that must move in response. This event is not fired when a
   * tab is moved between windows. For that, see [onDetached.]
   */
  Stream get onMoved => null;

  /**
   * Deprecated. Please use onActivated.
   */
  Stream get onSelectionChanged => null;

  /**
   * Deprecated. Please use onActivated.
   */
  Stream get onActiveChanged => null;

  /**
   * Fires when the active tab in a window changes. Note that the tab's URL may
   * not be set at the time this event fired, but you can listen to onUpdated
   * events to be notified when a URL is set.
   */
  Stream get onActivated => null;

  /**
   * Deprecated. Please use onHighlighted.
   */
  Stream get onHighlightChanged => null;

  /**
   * Fired when the highlighted or selected tabs in a window changes.
   */
  Stream get onHighlighted => null;

  /**
   * Fired when a tab is detached from a window, for example because it is being
   * moved between windows.
   */
  Stream get onDetached => null;

  /**
   * Fired when a tab is attached to a window, for example because it was moved
   * between windows.
   */
  Stream get onAttached => null;

  /**
   * Fired when a tab is closed.
   */
  Stream get onRemoved => null;

  /**
   * Fired when a tab is replaced with another tab due to prerendering or
   * instant.
   */
  Stream get onReplaced => null;
}
