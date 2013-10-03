/* This file has been generated from omnibox.json - do not edit */

/**
 * The omnibox API allows you to register a keyword with Google Chrome's address
 * bar, which is also known as the omnibox.
 */
library chrome.omnibox;

import '../src/common.dart';

/// Accessor for the `chrome.omnibox` namespace.
final ChromeOmnibox omnibox = ChromeOmnibox._omnibox == null ? apiNotAvailable('chrome.omnibox') : new ChromeOmnibox._();

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
  Stream<OnInputChangedEvent> get onInputChanged => _onInputChanged.stream;

  final ChromeStreamController<OnInputChangedEvent> _onInputChanged =
      new ChromeStreamController<OnInputChangedEvent>.twoArgs(_omnibox['onInputChanged'], _createOnInputChangedEvent);

  /**
   * User has accepted what is typed into the omnibox.
   */
  Stream<OnInputEnteredEvent> get onInputEntered => _onInputEntered.stream;

  final ChromeStreamController<OnInputEnteredEvent> _onInputEntered =
      new ChromeStreamController<OnInputEnteredEvent>.twoArgs(_omnibox['onInputEntered'], _createOnInputEnteredEvent);

  /**
   * User has ended the keyword input session without accepting the input.
   */
  Stream get onInputCancelled => _onInputCancelled.stream;

  final ChromeStreamController _onInputCancelled =
      new ChromeStreamController.noArgs(_omnibox['onInputCancelled']);
}

/**
 * User has changed what is typed into the omnibox.
 */
class OnInputChangedEvent {

  final String text;

  /**
   * A callback passed to the onInputChanged event used for sending suggestions
   * back to the browser.
   */
  final dynamic suggest;

  OnInputChangedEvent(this.text, this.suggest);
}

/**
 * User has accepted what is typed into the omnibox.
 */
class OnInputEnteredEvent {

  final String text;

  /**
   * The window disposition for the omnibox query. This is the recommended
   * context to display results. For example, if the omnibox command is to
   * navigate to a certain URL, a disposition of 'newForegroundTab' means the
   * navigation should take place in a new selected tab.
   * enum of `currentTab`, `newForegroundTab`, `newBackgroundTab`
   */
  final String disposition;

  OnInputEnteredEvent(this.text, this.disposition);
}

/**
 * A suggest result.
 */
class SuggestResult extends ChromeObject {

  SuggestResult({String content, String description}) {
    if (content != null) this.content = content;
    if (description != null) this.description = description;
  }

  SuggestResult.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The text that is put into the URL bar, and that is sent to the extension
   * when the user chooses this entry.
   */
  String get content => proxy['content'];
  set content(String value) => proxy['content'] = value;

  /**
   * The text that is displayed in the URL dropdown. Can contain XML-style
   * markup for styling. The supported tags are 'url' (for a literal URL),
   * 'match' (for highlighting text that matched what the user's query), and
   * 'dim' (for dim helper text). The styles can be nested, eg.
   * <dim><match>dimmed match</match></dim>.
   */
  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;
}

/**
 * A suggest result.
 */
class DefaultSuggestResult extends ChromeObject {

  DefaultSuggestResult({String description}) {
    if (description != null) this.description = description;
  }

  DefaultSuggestResult.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The text that is displayed in the URL dropdown. Can contain XML-style
   * markup for styling. The supported tags are 'url' (for a literal URL),
   * 'match' (for highlighting text that matched what the user's query), and
   * 'dim' (for dim helper text). The styles can be nested, eg.
   * <dim><match>dimmed match</match></dim>.
   */
  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;
}

OnInputChangedEvent _createOnInputChangedEvent(String text, JsObject suggest) =>
    new OnInputChangedEvent(text, suggest);
OnInputEnteredEvent _createOnInputEnteredEvent(String text, String disposition) =>
    new OnInputEnteredEvent(text, disposition);
