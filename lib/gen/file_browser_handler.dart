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
  static final JsObject _fileBrowserHandler = context['chrome']['fileBrowserHandler'];

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
   * `suggestedName` Suggested name for the file.
   * 
   * `allowedFileExtensions` List of file extensions that the selected file can
   * have. The list is also used to specify what files to be shown in the select
   * file dialog. Files with the listed extensions are only shown in the dialog.
   * Extensions should not include the leading '.'. Example: ['jpg', 'png']
   * 
   * Returns:
   * Result of the method.
   * 
   * `success` Whether the file has been selected.
   * 
   * `entry` Selected file entry. It will be null if a file hasn't been
   * selected.
   */
  Future<Map> selectFile(Map selectionParams) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(mapify);
    _fileBrowserHandler.callMethod('selectFile', [jsify(selectionParams), completer.callback]);
    return completer.future;
  }

  /**
   * Fired when file system action is executed from ChromeOS file browser.
   */
  Stream<dynamic> get onExecute => _onExecute.stream;

  final ChromeStreamController<dynamic> _onExecute =
      new ChromeStreamController<dynamic>.oneArg(_fileBrowserHandler['onExecute'], selfConverter);
}

/**
 * Event details payload for fileBrowserHandler.onExecute event.
 * 
 * `entries` Array of Entry instances representing files that are targets of
 * this action (selected in ChromeOS file browser).
 * 
 * `tab_id` The ID of the tab that raised this event. Tab IDs are unique within
 * a browser session.
 */
class FileHandlerExecuteEventDetails extends ChromeObject {
  static FileHandlerExecuteEventDetails create(JsObject proxy) => new FileHandlerExecuteEventDetails(proxy);

  FileHandlerExecuteEventDetails(JsObject proxy): super(proxy);

  /**
   * Array of Entry instances representing files that are targets of this action
   * (selected in ChromeOS file browser).
   */
  List<dynamic> get entries => listify(proxy['entries']);

  /**
   * The ID of the tab that raised this event. Tab IDs are unique within a
   * browser session.
   */
  int get tab_id => proxy['tab_id'];
}
