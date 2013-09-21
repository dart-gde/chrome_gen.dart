// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
  JsObject _commands;

  ChromeCommands._() {
    _commands = context['chrome']['commands'];
  }

  /**
   * Returns all the registered extension commands for this extension and their
   * shortcut (if active).
   */
  Future<List<Command>> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _commands.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a registered command is activated using a keyboard shortcut.
   */
  Stream<dynamic> get onCommand => _onCommand.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onCommand = null;
}

class Command extends ChromeObject {
  static Command create(JsObject proxy) => new Command(proxy);

  Command(JsObject proxy): super(proxy);

  /**
   * The name of the Extension Command
   */
  String get name => this.proxy['name'];

  /**
   * The Extension Command description
   */
  String get description => this.proxy['description'];

  /**
   * The shortcut active for this command, or blank if not active.
   */
  String get shortcut => this.proxy['shortcut'];
}
