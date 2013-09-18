// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from file_browser_handler.json - do not edit */

/**
 * Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file browser.
 * For example, you can use this API to enable users to upload files to your
 * website.
 */
library chrome.fileBrowserHandler;

import '../src/common.dart';

/// Accessor for the `chrome.fileBrowserHandler` namespace.
final ChromeFileBrowserHandler fileBrowserHandler = new ChromeFileBrowserHandler._();

class ChromeFileBrowserHandler {
  JsObject _fileBrowserHandler;

  ChromeFileBrowserHandler._() {
    _fileBrowserHandler = context['chrome']['fileBrowserHandler'];
  }

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
   * Returns:
   * Result of the method.
   */
  Future<dynamic> selectFile(var selectionParams) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _fileBrowserHandler.callMethod('selectFile', [selectionParams, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when file system action is executed from ChromeOS file browser.
   */
  Stream<dynamic> get onExecute => _onExecute.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onExecute = null;
}

/**
 * Event details payload for fileBrowserHandler.onExecute event.
 */
class FileHandlerExecuteEventDetails extends ChromeObject {
  FileHandlerExecuteEventDetails(JsObject proxy): super(proxy);
  // TODO:
}
