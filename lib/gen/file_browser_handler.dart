// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from file_browser_handler.json - do not edit */

/**
 * Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file browser.
 * For example, you can use this API to enable users to upload files to your
 * website.
 */
library chrome.file_browser_handler;

import '../src/common.dart';

/// Accessor for the `chrome.file_browser_handler` namespace.
final ChromeFileBrowserHandler file_browser_handler = new ChromeFileBrowserHandler._();

class ChromeFileBrowserHandler {
  ChromeFileBrowserHandler._();

  /**
   * Prompts user to select file path under which file should be saved. When the
   * file is selected, file access permission required to use the file (read,
   * write and create) are granted to the caller. The file will not actually get
   * created during the function call, so function caller must ensure its
   * existence before using it. The function has to be invoked with a user
   * gesture.
   * 
   * [selectionParams] Parameters that will be used while selecting the file.
   * 
   * [callback] Function called upon completion.
   */
  Future<dynamic> selectFile(var selectionParams) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['file_browser_handler'].callMethod('selectFile', [selectionParams, completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onExecute = null;

  /**
   * Fired when file system action is executed from ChromeOS file browser.
   */
  Stream get onExecute => _onExecute.stream;
}
