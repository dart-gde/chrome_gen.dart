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
   * 
   * [callback] Called when the operation completes with a boolean indicating if
   * the text was accepted or not. On failure, chrome.runtime.lastError is set.
   */
  Future<bool> setComposition(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setComposition', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Clear the current composition. If this extension does not own the active
   * IME, this fails.
   * 
   * [callback] Called when the operation completes with a boolean indicating if
   * the text was accepted or not. On failure, chrome.runtime.lastError is set.
   */
  Future<bool> clearComposition(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('clearComposition', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Commits the provided text to the current input.
   * 
   * [callback] Called when the operation completes with a boolean indicating if
   * the text was accepted or not. On failure, chrome.runtime.lastError is set.
   */
  Future<bool> commitText(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('commitText', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the properties of the candidate window. This fails if the extension
   * doesn’t own the active IME
   * 
   * [callback] Called when the operation completes.
   */
  Future<bool> setCandidateWindowProperties(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCandidateWindowProperties', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the current candidate list. This fails if this extension doesn’t own
   * the active IME
   * 
   * [callback] Called when the operation completes.
   */
  Future<bool> setCandidates(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCandidates', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Set the position of the cursor in the candidate window. This is a no-op if
   * this extension does not own the active IME.
   * 
   * [callback] Called when the operation completes
   */
  Future<bool> setCursorPosition(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCursorPosition', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Adds the provided menu items to the language menu when this IME is active.
   * 
   * [callback]
   */
  Future setMenuItems(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('setMenuItems', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Updates the state of the MenuItems specified
   * 
   * [callback] Called when the operation completes
   */
  Future updateMenuItems(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('updateMenuItems', [parameters, completer.callback]);
    return completer.future;
  }

  /**
   * Deletes the text around the caret.
   * 
   * [callback] Called when the operation completes.
   */
  Future deleteSurroundingText(var parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('deleteSurroundingText', [parameters, completer.callback]);
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
  Stream get onActivate => _onActivate.stream;

  final ChromeStreamController _onActivate = null;

  /**
   * This event is sent when an IME is deactivated. It signals that the IME will
   * no longer be receiving onKeyPress events.
   */
  Stream get onDeactivated => _onDeactivated.stream;

  final ChromeStreamController _onDeactivated = null;

  /**
   * This event is sent when focus enters a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream get onFocus => _onFocus.stream;

  final ChromeStreamController _onFocus = null;

  /**
   * This event is sent when focus leaves a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream get onBlur => _onBlur.stream;

  final ChromeStreamController _onBlur = null;

  /**
   * This event is sent when the properties of the current InputContext change,
   * such as the the type. It is sent to all extensions that are listening to
   * this event, and enabled by the user.
   */
  Stream get onInputContextUpdate => _onInputContextUpdate.stream;

  final ChromeStreamController _onInputContextUpdate = null;

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream get onKeyEvent => _onKeyEvent.stream;

  final ChromeStreamController _onKeyEvent = null;

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream get onCandidateClicked => _onCandidateClicked.stream;

  final ChromeStreamController _onCandidateClicked = null;

  /**
   * Called when the user selects a menu item
   */
  Stream get onMenuItemActivated => _onMenuItemActivated.stream;

  final ChromeStreamController _onMenuItemActivated = null;

  /**
   * Called when the editable string around caret is changed or when the caret
   * position is moved. The text length is limited to 100 characters for each
   * back and forth direction.
   */
  Stream get onSurroundingTextChanged => _onSurroundingTextChanged.stream;

  final ChromeStreamController _onSurroundingTextChanged = null;

  /**
   * This event is sent when chrome terminates ongoing text input session.
   */
  Stream get onReset => _onReset.stream;

  final ChromeStreamController _onReset = null;
}
