// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from script_badge.json - do not edit */

/**
 * Use the `chrome.scriptBadge` API to control the behaviour of the script
 * badge.
 */
library chrome.scriptBadge;

import '../src/common.dart';

/// Accessor for the `chrome.scriptBadge` namespace.
final ChromeScriptBadge scriptBadge = new ChromeScriptBadge._();

class ChromeScriptBadge {
  JsObject _scriptBadge;

  ChromeScriptBadge._() {
    _scriptBadge = context['chrome']['scriptBadge'];
  }

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * script badge's icon.
   */
  void setPopup(var details) {
    _scriptBadge.callMethod('setPopup', [details]);
  }

  /**
   * Gets the html document set as the popup for this script badge.
   */
  Future<String> getPopup(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _scriptBadge.callMethod('getPopup', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Brings the script badge to the attention of the user, imploring her to
   * click.  You should call this when you detect that you can do something to a
   * particular tab.  Do not call this for every tab. That's tacky.  If the user
   * clicks on the badge, the activeTab APIs become available. If the extension
   * has already run on this tab, this call does nothing.
   */
  void getAttention(var details) {
    _scriptBadge.callMethod('getAttention', [details]);
  }

  /**
   * Fired when a script badge icon is clicked.  This event will not fire if the
   * script badge has a popup.
   */
  Stream get onClicked => _onClicked.stream;

  final ChromeStreamController _onClicked = null;
}
