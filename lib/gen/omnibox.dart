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
  static final JsObject _omnibox = context['chrome']['omnibox'];

  ChromeOmnibox._();

  /**
   * A callback passed to the onInputChanged event used for sending suggestions
   * back to the browser.
   * 
   * [suggestResults] An array of suggest results
   */
  void sendSuggestions(int requestId, List<SuggestResult> suggestResults) {
    _omnibox.callMethod('sendSuggestions', [requestId, jsify(suggestResults)]);
  }

  /**
   * Sets the description and styling for the default suggestion. The default
   * suggestion is the text that is displayed in the first suggestion row
   * underneath the URL bar.
   * 
   * [suggestion] A partial SuggestResult object, without the 'content'
   * parameter.
   */
  void setDefaultSuggestion(DefaultSuggestResult suggestion) {
    _omnibox.callMethod('setDefaultSuggestion', [suggestion]);
  }

  /**
   * User has started a keyword input session by typing the extension's keyword.
   * This is guaranteed to be sent exactly once per input session, and before
   * any onInputChanged events.
   */
  Stream get onInputStarted => _onInputStarted.stream;

  final ChromeStreamController _onInputStarted =
      new ChromeStreamController.noArgs(_omnibox['onInputStarted']);

  /**
   * User has changed what is typed into the omnibox.
   */
  Stream<dynamic> get onInputChanged => _onInputChanged.stream;

  final ChromeStreamController<dynamic> _onInputChanged =
      new ChromeStreamController<dynamic>.oneArg(_omnibox['onInputChanged'], selfConverter);

  /**
   * User has accepted what is typed into the omnibox.
   */
  Stream<dynamic> get onInputEntered => _onInputEntered.stream;

  final ChromeStreamController<dynamic> _onInputEntered =
      new ChromeStreamController<dynamic>.oneArg(_omnibox['onInputEntered'], selfConverter);

  /**
   * User has ended the keyword input session without accepting the input.
   */
  Stream get onInputCancelled => _onInputCancelled.stream;

  final ChromeStreamController _onInputCancelled =
      new ChromeStreamController.noArgs(_omnibox['onInputCancelled']);
}

/**
 * A suggest result.
 * 
 * `content` The text that is put into the URL bar, and that is sent to the
 * extension when the user chooses this entry.
 * 
 * `description` The text that is displayed in the URL dropdown. Can contain
 * XML-style markup for styling. The supported tags are 'url' (for a literal
 * URL), 'match' (for highlighting text that matched what the user's query), and
 * 'dim' (for dim helper text). The styles can be nested, eg. <dim><match>dimmed
 * match</match></dim>.
 * 
 * `descriptionStyles` An array of style ranges for the description, as provided
 * by the extension.
 * 
 * `descriptionStylesRaw` An array of style ranges for the description, as
 * provided by ToValue().
 */
class SuggestResult extends ChromeObject {
  static SuggestResult create(JsObject proxy) => new SuggestResult(proxy);

  SuggestResult(JsObject proxy): super(proxy);

  /**
   * The text that is put into the URL bar, and that is sent to the extension
   * when the user chooses this entry.
   */
  String get content => proxy['content'];

  /**
   * The text that is displayed in the URL dropdown. Can contain XML-style
   * markup for styling. The supported tags are 'url' (for a literal URL),
   * 'match' (for highlighting text that matched what the user's query), and
   * 'dim' (for dim helper text). The styles can be nested, eg.
   * <dim><match>dimmed match</match></dim>.
   */
  String get description => proxy['description'];
}

/**
 * A suggest result.
 * 
 * `description` The text that is displayed in the URL dropdown. Can contain
 * XML-style markup for styling. The supported tags are 'url' (for a literal
 * URL), 'match' (for highlighting text that matched what the user's query), and
 * 'dim' (for dim helper text). The styles can be nested, eg. <dim><match>dimmed
 * match</match></dim>.
 * 
 * `descriptionStyles` An array of style ranges for the description, as provided
 * by the extension.
 * 
 * `descriptionStylesRaw` An array of style ranges for the description, as
 * provided by ToValue().
 */
class DefaultSuggestResult extends ChromeObject {
  static DefaultSuggestResult create(JsObject proxy) => new DefaultSuggestResult(proxy);

  DefaultSuggestResult(JsObject proxy): super(proxy);

  /**
   * The text that is displayed in the URL dropdown. Can contain XML-style
   * markup for styling. The supported tags are 'url' (for a literal URL),
   * 'match' (for highlighting text that matched what the user's query), and
   * 'dim' (for dim helper text). The styles can be nested, eg.
   * <dim><match>dimmed match</match></dim>.
   */
  String get description => proxy['description'];
}
