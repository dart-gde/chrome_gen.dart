// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from script_badge.json - do not edit */

/**
 * Use the `chrome.scriptBadge` API to control the behaviour of the script
 * badge.
 */
library chrome.script_badge;

import '../src/common.dart';

/// Accessor for the `chrome.script_badge` namespace.
final ChromeScriptBadge script_badge = new ChromeScriptBadge._();

class ChromeScriptBadge {
  ChromeScriptBadge._();

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * script badge's icon.
   */
  void setPopup(dynamic details) {
    chrome['script_badge'].callMethod('setPopup', [details]);
  }

  /**
   * Gets the html document set as the popup for this script badge.
   */
  Future getPopup(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['script_badge'].callMethod('getPopup', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Brings the script badge to the attention of the user, imploring her to
   * click.  You should call this when you detect that you can do something to a
   * particular tab.  Do not call this for every tab. That's tacky.  If the user
   * clicks on the badge, the activeTab APIs become available. If the extension
   * has already run on this tab, this call does nothing.
   */
  void getAttention(dynamic details) {
    chrome['script_badge'].callMethod('getAttention', [details]);
  }

  /**
   * Fired when a script badge icon is clicked.  This event will not fire if the
   * script badge has a popup.
   */
  Stream get onClicked => null;
}
