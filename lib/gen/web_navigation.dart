// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from web_navigation.json - do not edit */

/**
 * Use the `chrome.webNavigation` API to receive notifications about the status
 * of navigation requests in-flight.
 */
library chrome.webNavigation;

import '../src/common.dart';

/// Accessor for the `chrome.webNavigation` namespace.
final ChromeWebNavigation webNavigation = new ChromeWebNavigation._();

class ChromeWebNavigation {
  static final JsObject _webNavigation = context['chrome']['webNavigation'];

  ChromeWebNavigation._();

  /**
   * Retrieves information about the given frame. A frame refers to an
   * &lt;iframe&gt; or a &lt;frame&gt; of a web page and is identified by a tab
   * ID and a frame ID.
   * 
   * [details] Information about the frame to retrieve information about.
   * 
   * `tabId` The ID of the tab in which the frame is.
   * 
   * `processId` The ID of the process runs the renderer for this tab.
   * 
   * `frameId` The ID of the frame in the given tab.
   * 
   * Returns:
   * Information about the requested frame, null if the specified frame ID
   * and/or tab ID are invalid.
   * 
   * `errorOccurred` True if the last navigation in this frame was interrupted
   * by an error, i.e. the onErrorOccurred event fired.
   * 
   * `url` The URL currently associated with this frame, if the frame identified
   * by the frameId existed at one point in the given tab. The fact that an URL
   * is associated with a given frameId does not imply that the corresponding
   * frame still exists.
   * 
   * `parentFrameId` ID of frame that wraps the frame. Set to -1 of no parent
   * frame exists.
   */
  Future<Map> getFrame(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(mapify);
    _webNavigation.callMethod('getFrame', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about all frames of a given tab.
   * 
   * [details] Information about the tab to retrieve all frames from.
   * 
   * `tabId` The ID of the tab.
   * 
   * Returns:
   * A list of frames in the given tab, null if the specified tab ID is invalid.
   */
  Future<List<Map>> getAllFrames(Map details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, mapify));
    _webNavigation.callMethod('getAllFrames', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a navigation is about to occur.
   */
  Stream<Map> get onBeforeNavigate => _onBeforeNavigate.stream;

  final ChromeStreamController<Map> _onBeforeNavigate =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onBeforeNavigate'], mapify);

  /**
   * Fired when a navigation is committed. The document (and the resources it
   * refers to, such as images and subframes) might still be downloading, but at
   * least part of the document has been received from the server and the
   * browser has decided to switch to the new document.
   */
  Stream<Map> get onCommitted => _onCommitted.stream;

  final ChromeStreamController<Map> _onCommitted =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onCommitted'], mapify);

  /**
   * Fired when the page's DOM is fully constructed, but the referenced
   * resources may not finish loading.
   */
  Stream<Map> get onDOMContentLoaded => _onDOMContentLoaded.stream;

  final ChromeStreamController<Map> _onDOMContentLoaded =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onDOMContentLoaded'], mapify);

  /**
   * Fired when a document, including the resources it refers to, is completely
   * loaded and initialized.
   */
  Stream<Map> get onCompleted => _onCompleted.stream;

  final ChromeStreamController<Map> _onCompleted =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onCompleted'], mapify);

  /**
   * Fired when an error occurs and the navigation is aborted. This can happen
   * if either a network error occurred, or the user aborted the navigation.
   */
  Stream<Map> get onErrorOccurred => _onErrorOccurred.stream;

  final ChromeStreamController<Map> _onErrorOccurred =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onErrorOccurred'], mapify);

  /**
   * Fired when a new window, or a new tab in an existing window, is created to
   * host a navigation.
   */
  Stream<Map> get onCreatedNavigationTarget => _onCreatedNavigationTarget.stream;

  final ChromeStreamController<Map> _onCreatedNavigationTarget =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onCreatedNavigationTarget'], mapify);

  /**
   * Fired when the reference fragment of a frame was updated. All future events
   * for that frame will use the updated URL.
   */
  Stream<Map> get onReferenceFragmentUpdated => _onReferenceFragmentUpdated.stream;

  final ChromeStreamController<Map> _onReferenceFragmentUpdated =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onReferenceFragmentUpdated'], mapify);

  /**
   * Fired when the contents of the tab is replaced by a different (usually
   * previously pre-rendered) tab.
   */
  Stream<Map> get onTabReplaced => _onTabReplaced.stream;

  final ChromeStreamController<Map> _onTabReplaced =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onTabReplaced'], mapify);

  /**
   * Fired when the frame's history was updated to a new URL. All future events
   * for that frame will use the updated URL.
   */
  Stream<Map> get onHistoryStateUpdated => _onHistoryStateUpdated.stream;

  final ChromeStreamController<Map> _onHistoryStateUpdated =
      new ChromeStreamController<Map>.oneArg(_webNavigation['onHistoryStateUpdated'], mapify);
}
