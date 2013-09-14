// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from omnibox.json - do not edit */

/**
 * The omnibox API allows you to register a keyword with Google Chrome's address
 * bar, which is also known as the omnibox.
 */
library chrome.omnibox;

import '../src/common.dart';

/// Accessor for the `chrome.omnibox` namespace.
final ChromeOmnibox omnibox = new ChromeOmnibox._();

class ChromeOmnibox {
  ChromeOmnibox._();

  /**
   * A callback passed to the onInputChanged event used for sending suggestions
   * back to the browser.
   * 
   * [suggestResults] An array of suggest results
   */
  void sendSuggestions(int requestId, var suggestResults) {
    chrome['omnibox'].callMethod('sendSuggestions', [requestId, suggestResults]);
  }

  /**
   * Sets the description and styling for the default suggestion. The default
   * suggestion is the text that is displayed in the first suggestion row
   * underneath the URL bar.
   * 
   * [suggestion] A partial SuggestResult object, without the 'content'
   * parameter.
   */
  void setDefaultSuggestion(var suggestion) {
    chrome['omnibox'].callMethod('setDefaultSuggestion', [suggestion]);
  }

  final ChromeStreamController _onInputStarted = null;

  /**
   * User has started a keyword input session by typing the extension's keyword.
   * This is guaranteed to be sent exactly once per input session, and before
   * any onInputChanged events.
   */
  Stream get onInputStarted => _onInputStarted.stream;

  final ChromeStreamController _onInputChanged = null;

  /**
   * User has changed what is typed into the omnibox.
   */
  Stream get onInputChanged => _onInputChanged.stream;

  final ChromeStreamController _onInputEntered = null;

  /**
   * User has accepted what is typed into the omnibox.
   */
  Stream get onInputEntered => _onInputEntered.stream;

  final ChromeStreamController _onInputCancelled = null;

  /**
   * User has ended the keyword input session without accepting the input.
   */
  Stream get onInputCancelled => _onInputCancelled.stream;
}
