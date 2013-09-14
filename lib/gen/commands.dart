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
  ChromeCommands._();

  /**
   * Returns all the registered extension commands for this extension and their
   * shortcut (if active).
   * 
   * [callback] Called to return the registered commands.
   */
  Future<dynamic> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['commands'].callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onCommand = null;

  /**
   * Fired when a registered command is activated using a keyboard shortcut.
   */
  Stream get onCommand => _onCommand.stream;
}
