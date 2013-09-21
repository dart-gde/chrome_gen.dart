// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from input_ime.json - do not edit */

/**
 * Use the `chrome.input.ime` API to implement a custom IME for Chrome OS. This
 * allows your extension to handle keystrokes, set the composition, and manage
 * the candidate window.
 */
library chrome.input_ime;

import '../src/common.dart';

/// Accessor for the `chrome.input.ime` namespace.
final ChromeInputIme input_ime = new ChromeInputIme._();

class ChromeInputIme {
  JsObject _input_ime;

  ChromeInputIme._() {
    _input_ime = context['chrome']['input']['ime'];
  }

  /**
   * Set the current composition. If this extension does not own the active IME,
   * this fails.
   */
  Future<bool> setComposition(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setComposition', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Clear the current composition. If this extension does not own the active
   * IME, this fails.
   */
  Future<bool> clearComposition(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('clearComposition', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Commits the provided text to the current input.
   */
  Future<bool> commitText(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('commitText', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the properties of the candidate window. This fails if the extension
   * doesn’t own the active IME
   */
  Future<bool> setCandidateWindowProperties(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCandidateWindowProperties', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the current candidate list. This fails if this extension doesn’t own
   * the active IME
   */
  Future<bool> setCandidates(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCandidates', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Set the position of the cursor in the candidate window. This is a no-op if
   * this extension does not own the active IME.
   */
  Future<bool> setCursorPosition(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCursorPosition', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Adds the provided menu items to the language menu when this IME is active.
   */
  Future setMenuItems(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('setMenuItems', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the state of the MenuItems specified
   */
  Future updateMenuItems(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('updateMenuItems', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Deletes the text around the caret.
   */
  Future deleteSurroundingText(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('deleteSurroundingText', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Indicates that the key event received by onKeyEvent is handled.  This
   * should only be called if the onKeyEvent listener is asynchronous.
   * 
   * [requestId] Request id of the event that was handled.  This should come
   * from keyEvent.requestId
   * 
   * [response] True if the keystroke was handled, false if not
   */
  void keyEventHandled(String requestId, bool response) {
    _input_ime.callMethod('keyEventHandled', [requestId, response]);
  }

  /**
   * This event is sent when an IME is activated. It signals that the IME will
   * be receiving onKeyPress events.
   */
  Stream<dynamic> get onActivate => _onActivate.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onActivate = null;

  /**
   * This event is sent when an IME is deactivated. It signals that the IME will
   * no longer be receiving onKeyPress events.
   */
  Stream<dynamic> get onDeactivated => _onDeactivated.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onDeactivated = null;

  /**
   * This event is sent when focus enters a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream<dynamic> get onFocus => _onFocus.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onFocus = null;

  /**
   * This event is sent when focus leaves a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream<dynamic> get onBlur => _onBlur.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onBlur = null;

  /**
   * This event is sent when the properties of the current InputContext change,
   * such as the the type. It is sent to all extensions that are listening to
   * this event, and enabled by the user.
   */
  Stream<dynamic> get onInputContextUpdate => _onInputContextUpdate.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onInputContextUpdate = null;

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream<dynamic> get onKeyEvent => _onKeyEvent.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onKeyEvent = null;

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream<dynamic> get onCandidateClicked => _onCandidateClicked.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onCandidateClicked = null;

  /**
   * Called when the user selects a menu item
   */
  Stream<dynamic> get onMenuItemActivated => _onMenuItemActivated.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onMenuItemActivated = null;

  /**
   * Called when the editable string around caret is changed or when the caret
   * position is moved. The text length is limited to 100 characters for each
   * back and forth direction.
   */
  Stream<dynamic> get onSurroundingTextChanged => _onSurroundingTextChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onSurroundingTextChanged = null;

  /**
   * This event is sent when chrome terminates ongoing text input session.
   */
  Stream<dynamic> get onReset => _onReset.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onReset = null;
}

/**
 * See http://www.w3.org/TR/DOM-Level-3-Events/#events-KeyboardEvent
 */
class KeyboardEvent extends ChromeObject {
  static KeyboardEvent create(JsObject proxy) => new KeyboardEvent(proxy);

  KeyboardEvent(JsObject proxy): super(proxy);

  /**
   * One of keyup or keydown.
   */
  String get type => this.proxy['type'];

  /**
   * The ID of the request.
   */
  String get requestId => this.proxy['requestId'];

  /**
   * Value of the key being pressed
   */
  String get key => this.proxy['key'];

  /**
   * Value of the physical key being pressed. The value is not affected by
   * current keyboard layout or modifier state.
   */
  String get code => this.proxy['code'];

  /**
   * Whether or not the ALT key is pressed.
   */
  bool get altKey => this.proxy['altKey'];

  /**
   * Whether or not the CTRL key is pressed.
   */
  bool get ctrlKey => this.proxy['ctrlKey'];

  /**
   * Whether or not the SHIFT key is pressed.
   */
  bool get shiftKey => this.proxy['shiftKey'];

  /**
   * Whether or not the CAPS_LOCK is enabled.
   */
  bool get capsLock => this.proxy['capsLock'];
}

/**
 * Describes an input Context
 */
class InputContext extends ChromeObject {
  static InputContext create(JsObject proxy) => new InputContext(proxy);

  InputContext(JsObject proxy): super(proxy);

  /**
   * This is used to specify targets of text field operations.  This ID becomes
   * invalid as soon as onBlur is called.
   */
  int get contextID => this.proxy['contextID'];

  /**
   * Type of value this text field edits, (Text, Number, Password, etc)
   */
  String get type => this.proxy['type'];
}

/**
 * A menu item used by an input method to interact with the user from the
 * language menu.
 */
class MenuItem extends ChromeObject {
  static MenuItem create(JsObject proxy) => new MenuItem(proxy);

  MenuItem(JsObject proxy): super(proxy);

  /**
   * String that will be passed to callbacks referencing this MenuItem.
   */
  String get id => this.proxy['id'];

  /**
   * Text displayed in the menu for this item.
   */
  String get label => this.proxy['label'];

  /**
   * Enum representing if this item is: check, radio, or a separator.  Radio
   * buttons between separators are considered grouped.
   */
  String get style => this.proxy['style'];

  /**
   * Indicates this item is visible.
   */
  bool get visible => this.proxy['visible'];

  /**
   * Indicates this item should be drawn with a check.
   */
  bool get checked => this.proxy['checked'];

  /**
   * Indicates this item is enabled.
   */
  bool get enabled => this.proxy['enabled'];
}
