/* This file has been generated from commands.json - do not edit */

/**
 * Use the commands API to add keyboard shortcuts that trigger actions in your
 * extension, for example, an action to open the browser action or send a
 * command to the extension.
 */
library chrome.commands;

import '../src/common.dart';

/// Accessor for the `chrome.commands` namespace.
final ChromeCommands commands = new ChromeCommands._();

class ChromeCommands extends ChromeApi {
  static final JsObject _commands = context['chrome']['commands'];

  ChromeCommands._();

  /**
   * Returns all the registered extension commands for this extension and their
   * shortcut (if active).
   */
  Future<List<Command>> getAll() {
    _checkAvailability();

    var completer = new ChromeCompleter<List<Command>>.oneArg((e) => listify(e, _createCommand));
    _commands.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a registered command is activated using a keyboard shortcut.
   */
  Stream<String> get onCommand => _onCommand.stream;

  final ChromeStreamController<String> _onCommand =
      new ChromeStreamController<String>.oneArg(_commands['onCommand'], selfConverter);

  bool get available => _commands != null;

  void _checkAvailability() {
    if (_commands == null) {
      throw new Exception('chrome.commands API not available');
    }
  }
}

class Command extends ChromeObject {

  Command({String name, String description, String shortcut}) {
    if (name != null) this.name = name;
    if (description != null) this.description = description;
    if (shortcut != null) this.shortcut = shortcut;
  }

  Command.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The name of the Extension Command
   */
  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  /**
   * The Extension Command description
   */
  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;

  /**
   * The shortcut active for this command, or blank if not active.
   */
  String get shortcut => proxy['shortcut'];
  set shortcut(String value) => proxy['shortcut'] = value;
}

Command _createCommand(JsObject proxy) => proxy == null ? null : new Command.fromProxy(proxy);
