// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from web_navigation.json - do not edit */

/**
 * Use the `chrome.webNavigation` API to receive notifications about the status
 * of navigation requests in-flight.
 */
library chrome.web_navigation;

import '../src/common.dart';

/// Accessor for the `chrome.web_navigation` namespace.
final ChromeWebNavigation web_navigation = new ChromeWebNavigation._();

class ChromeWebNavigation {
  ChromeWebNavigation._();

  /**
   * Retrieves information about the given frame. A frame refers to an
   * &lt;iframe&gt; or a &lt;frame&gt; of a web page and is identified by a tab
   * ID and a frame ID.
   * 
   * [details] Information about the frame to retrieve information about.
   */
  Future getFrame(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['web_navigation'].callMethod('getFrame', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves information about all frames of a given tab.
   * 
   * [details] Information about the tab to retrieve all frames from.
   */
  Future getAllFrames(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['web_navigation'].callMethod('getAllFrames', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a navigation is about to occur.
   */
  Stream get onBeforeNavigate => null;

  /**
   * Fired when a navigation is committed. The document (and the resources it
   * refers to, such as images and subframes) might still be downloading, but at
   * least part of the document has been received from the server and the
   * browser has decided to switch to the new document.
   */
  Stream get onCommitted => null;

  /**
   * Fired when the page's DOM is fully constructed, but the referenced
   * resources may not finish loading.
   */
  Stream get onDOMContentLoaded => null;

  /**
   * Fired when a document, including the resources it refers to, is completely
   * loaded and initialized.
   */
  Stream get onCompleted => null;

  /**
   * Fired when an error occurs and the navigation is aborted. This can happen
   * if either a network error occurred, or the user aborted the navigation.
   */
  Stream get onErrorOccurred => null;

  /**
   * Fired when a new window, or a new tab in an existing window, is created to
   * host a navigation.
   */
  Stream get onCreatedNavigationTarget => null;

  /**
   * Fired when the reference fragment of a frame was updated. All future events
   * for that frame will use the updated URL.
   */
  Stream get onReferenceFragmentUpdated => null;

  /**
   * Fired when the contents of the tab is replaced by a different (usually
   * previously pre-rendered) tab.
   */
  Stream get onTabReplaced => null;

  /**
   * Fired when the frame's history was updated to a new URL. All future events
   * for that frame will use the updated URL.
   */
  Stream get onHistoryStateUpdated => null;
}
