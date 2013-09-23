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

class ChromeCommands {
  static final JsObject _commands = context['chrome']['commands'];

  ChromeCommands._();

  /**
   * Returns all the registered extension commands for this extension and their
   * shortcut (if active).
   */
  Future<List<Command>> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Command.create));
    _commands.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a registered command is activated using a keyboard shortcut.
   */
  Stream<String> get onCommand => _onCommand.stream;

  final ChromeStreamController<String> _onCommand =
      new ChromeStreamController<String>.oneArg(_commands['onCommand'], selfConverter);
}

class Command extends ChromeObject {
  static Command create(JsObject proxy) => proxy == null ? null : new Command(proxy);

  Command(JsObject proxy): super(proxy);

  /**
   * The name of the Extension Command
   */
  String get name => proxy['name'];

  /**
   * The Extension Command description
   */
  String get description => proxy['description'];

  /**
   * The shortcut active for this command, or blank if not active.
   */
  String get shortcut => proxy['shortcut'];
}
