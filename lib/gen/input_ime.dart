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
  static final JsObject _input_ime = context['chrome']['input']['ime'];

  ChromeInputIme._();

  /**
   * Set the current composition. If this extension does not own the active IME,
   * this fails.
   * 
   * [parameters] `contextID` ID of the context where the composition text will
   * be set
   * 
   * `text` Text to set
   * 
   * `selectionStart` Position in the text that the selection starts at.
   * 
   * `selectionEnd` Position in the text that the selection ends at.
   * 
   * `cursor` Position in the text of the cursor.
   * 
   * `segments` List of segments and their associated types.
   */
  Future<bool> setComposition(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setComposition', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Clear the current composition. If this extension does not own the active
   * IME, this fails.
   * 
   * [parameters] `contextID` ID of the context where the composition will be
   * cleared
   */
  Future<bool> clearComposition(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('clearComposition', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Commits the provided text to the current input.
   * 
   * [parameters] `contextID` ID of the context where the text will be committed
   * 
   * `text` The text to commit
   */
  Future<bool> commitText(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('commitText', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the properties of the candidate window. This fails if the extension
   * doesn’t own the active IME
   * 
   * [parameters] `engineID` ID of the engine to set properties on.
   * 
   * `properties`
   */
  Future<bool> setCandidateWindowProperties(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCandidateWindowProperties', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the current candidate list. This fails if this extension doesn’t own
   * the active IME
   * 
   * [parameters] `contextID` ID of the context that owns the candidate window.
   * 
   * `candidates` List of candidates to show in the candidate window
   */
  Future<bool> setCandidates(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCandidates', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Set the position of the cursor in the candidate window. This is a no-op if
   * this extension does not own the active IME.
   * 
   * [parameters] `contextID` ID of the context that owns the candidate window.
   * 
   * `candidateID` ID of the candidate to select.
   */
  Future<bool> setCursorPosition(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _input_ime.callMethod('setCursorPosition', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Adds the provided menu items to the language menu when this IME is active.
   * 
   * [parameters] `engineID` ID of the engine to use
   * 
   * `items` MenuItems to add. They will be added in the order they exist in the
   * array.
   */
  Future setMenuItems(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('setMenuItems', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the state of the MenuItems specified
   * 
   * [parameters] `engineID` ID of the engine to use
   * 
   * `items` Array of MenuItems to update
   */
  Future updateMenuItems(Map parameters) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _input_ime.callMethod('updateMenuItems', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Deletes the text around the caret.
   * 
   * [parameters] `engineID` ID of the engine receiving the event.
   * 
   * `contextID` ID of the context where the surrounding text will be deleted.
   * 
   * `offset` The offset from the caret position where deletion will start. This
   * value can be negative.
   * 
   * `length` The number of characters to be deleted
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
  Stream<String> get onActivate => _onActivate.stream;

  final ChromeStreamController<String> _onActivate =
      new ChromeStreamController<String>.oneArg(_input_ime['onActivate'], selfConverter);

  /**
   * This event is sent when an IME is deactivated. It signals that the IME will
   * no longer be receiving onKeyPress events.
   */
  Stream<String> get onDeactivated => _onDeactivated.stream;

  final ChromeStreamController<String> _onDeactivated =
      new ChromeStreamController<String>.oneArg(_input_ime['onDeactivated'], selfConverter);

  /**
   * This event is sent when focus enters a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream<InputContext> get onFocus => _onFocus.stream;

  final ChromeStreamController<InputContext> _onFocus =
      new ChromeStreamController<InputContext>.oneArg(_input_ime['onFocus'], InputContext.create);

  /**
   * This event is sent when focus leaves a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream<int> get onBlur => _onBlur.stream;

  final ChromeStreamController<int> _onBlur =
      new ChromeStreamController<int>.oneArg(_input_ime['onBlur'], selfConverter);

  /**
   * This event is sent when the properties of the current InputContext change,
   * such as the the type. It is sent to all extensions that are listening to
   * this event, and enabled by the user.
   */
  Stream<InputContext> get onInputContextUpdate => _onInputContextUpdate.stream;

  final ChromeStreamController<InputContext> _onInputContextUpdate =
      new ChromeStreamController<InputContext>.oneArg(_input_ime['onInputContextUpdate'], InputContext.create);

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream<dynamic> get onKeyEvent => _onKeyEvent.stream;

  final ChromeStreamController<dynamic> _onKeyEvent =
      new ChromeStreamController<dynamic>.oneArg(_input_ime['onKeyEvent'], selfConverter);

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream<dynamic> get onCandidateClicked => _onCandidateClicked.stream;

  final ChromeStreamController<dynamic> _onCandidateClicked =
      new ChromeStreamController<dynamic>.oneArg(_input_ime['onCandidateClicked'], selfConverter);

  /**
   * Called when the user selects a menu item
   */
  Stream<dynamic> get onMenuItemActivated => _onMenuItemActivated.stream;

  final ChromeStreamController<dynamic> _onMenuItemActivated =
      new ChromeStreamController<dynamic>.oneArg(_input_ime['onMenuItemActivated'], selfConverter);

  /**
   * Called when the editable string around caret is changed or when the caret
   * position is moved. The text length is limited to 100 characters for each
   * back and forth direction.
   */
  Stream<dynamic> get onSurroundingTextChanged => _onSurroundingTextChanged.stream;

  final ChromeStreamController<dynamic> _onSurroundingTextChanged =
      new ChromeStreamController<dynamic>.oneArg(_input_ime['onSurroundingTextChanged'], selfConverter);

  /**
   * This event is sent when chrome terminates ongoing text input session.
   */
  Stream<String> get onReset => _onReset.stream;

  final ChromeStreamController<String> _onReset =
      new ChromeStreamController<String>.oneArg(_input_ime['onReset'], selfConverter);
}

/**
 * See http://www.w3.org/TR/DOM-Level-3-Events/#events-KeyboardEvent
 * 
 * `type` One of keyup or keydown.
 * 
 * `requestId` The ID of the request.
 * 
 * `key` Value of the key being pressed
 * 
 * `code` Value of the physical key being pressed. The value is not affected by
 * current keyboard layout or modifier state.
 * 
 * `altKey` Whether or not the ALT key is pressed.
 * 
 * `ctrlKey` Whether or not the CTRL key is pressed.
 * 
 * `shiftKey` Whether or not the SHIFT key is pressed.
 * 
 * `capsLock` Whether or not the CAPS_LOCK is enabled.
 */
class KeyboardEvent extends ChromeObject {
  static KeyboardEvent create(JsObject proxy) => new KeyboardEvent(proxy);

  KeyboardEvent(JsObject proxy): super(proxy);

  /**
   * One of keyup or keydown.
   */
  String get type => proxy['type'];

  /**
   * The ID of the request.
   */
  String get requestId => proxy['requestId'];

  /**
   * Value of the key being pressed
   */
  String get key => proxy['key'];

  /**
   * Value of the physical key being pressed. The value is not affected by
   * current keyboard layout or modifier state.
   */
  String get code => proxy['code'];

  /**
   * Whether or not the ALT key is pressed.
   */
  bool get altKey => proxy['altKey'];

  /**
   * Whether or not the CTRL key is pressed.
   */
  bool get ctrlKey => proxy['ctrlKey'];

  /**
   * Whether or not the SHIFT key is pressed.
   */
  bool get shiftKey => proxy['shiftKey'];

  /**
   * Whether or not the CAPS_LOCK is enabled.
   */
  bool get capsLock => proxy['capsLock'];
}

/**
 * Describes an input Context
 * 
 * `contextID` This is used to specify targets of text field operations.  This
 * ID becomes invalid as soon as onBlur is called.
 * 
 * `type` Type of value this text field edits, (Text, Number, Password, etc)
 */
class InputContext extends ChromeObject {
  static InputContext create(JsObject proxy) => new InputContext(proxy);

  InputContext(JsObject proxy): super(proxy);

  /**
   * This is used to specify targets of text field operations.  This ID becomes
   * invalid as soon as onBlur is called.
   */
  int get contextID => proxy['contextID'];

  /**
   * Type of value this text field edits, (Text, Number, Password, etc)
   */
  String get type => proxy['type'];
}

/**
 * A menu item used by an input method to interact with the user from the
 * language menu.
 * 
 * `id` String that will be passed to callbacks referencing this MenuItem.
 * 
 * `label` Text displayed in the menu for this item.
 * 
 * `style` Enum representing if this item is: check, radio, or a separator.
 * Radio buttons between separators are considered grouped.
 * 
 * `visible` Indicates this item is visible.
 * 
 * `checked` Indicates this item should be drawn with a check.
 * 
 * `enabled` Indicates this item is enabled.
 */
class MenuItem extends ChromeObject {
  static MenuItem create(JsObject proxy) => new MenuItem(proxy);

  MenuItem(JsObject proxy): super(proxy);

  /**
   * String that will be passed to callbacks referencing this MenuItem.
   */
  String get id => proxy['id'];

  /**
   * Text displayed in the menu for this item.
   */
  String get label => proxy['label'];

  /**
   * Enum representing if this item is: check, radio, or a separator.  Radio
   * buttons between separators are considered grouped.
   */
  String get style => proxy['style'];

  /**
   * Indicates this item is visible.
   */
  bool get visible => proxy['visible'];

  /**
   * Indicates this item should be drawn with a check.
   */
  bool get checked => proxy['checked'];

  /**
   * Indicates this item is enabled.
   */
  bool get enabled => proxy['enabled'];
}
