/* This file has been generated from file_browser_handler.json - do not edit */

/**
 * Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file browser.
 * For example, you can use this API to enable users to upload files to your
 * website.
 */
library chrome.fileBrowserHandler;

import '../src/common.dart';

/// Accessor for the `chrome.fileBrowserHandler` namespace.
final ChromeFileBrowserHandler fileBrowserHandler = ChromeFileBrowserHandler._fileBrowserHandler == null ? apiNotAvailable('chrome.fileBrowserHandler') : new ChromeFileBrowserHandler._();

class ChromeFileBrowserHandler {
  static final JsObject _fileBrowserHandler = chrome['fileBrowserHandler'];

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
   * Returns:
   * Result of the method.
   */
  Future<Map> selectFile(Map selectionParams) {
    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    _fileBrowserHandler.callMethod('selectFile', [jsify(selectionParams), completer.callback]);
    return completer.future;
  }

  /**
   * Fired when file system action is executed from ChromeOS file browser.
   */
  Stream<OnExecuteEvent> get onExecute => _onExecute.stream;

  final ChromeStreamController<OnExecuteEvent> _onExecute =
      new ChromeStreamController<OnExecuteEvent>.twoArgs(_fileBrowserHandler['onExecute'], _createOnExecuteEvent);
}

/**
 * Fired when file system action is executed from ChromeOS file browser.
 */
class OnExecuteEvent {
  /**
   * File browser action id as specified in the listener component's manifest.
   */
  final String id;
  /**
   * File handler execute event details.
   */
  final FileHandlerExecuteEventDetails details;

  OnExecuteEvent(this.id, this.details);
}

/**
 * Event details payload for fileBrowserHandler.onExecute event.
 */
class FileHandlerExecuteEventDetails extends ChromeObject {
  FileHandlerExecuteEventDetails({List<dynamic> entries, int tab_id}) {
    if (entries != null) this.entries = entries;
    if (tab_id != null) this.tab_id = tab_id;
  }

  FileHandlerExecuteEventDetails.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Array of Entry instances representing files that are targets of this action
   * (selected in ChromeOS file browser).
   */
  List<dynamic> get entries => listify(proxy['entries']);
  set entries(List<dynamic> value) => proxy['entries'] = value;

  /**
   * The ID of the tab that raised this event. Tab IDs are unique within a
   * browser session.
   */
  int get tab_id => proxy['tab_id'];
  set tab_id(int value) => proxy['tab_id'] = value;
}

OnExecuteEvent _createOnExecuteEvent(String id, JsObject details) =>
    new OnExecuteEvent(id, _createFileHandlerExecuteEventDetails(details));
FileHandlerExecuteEventDetails _createFileHandlerExecuteEventDetails(JsObject proxy) => proxy == null ? null : new FileHandlerExecuteEventDetails.fromProxy(proxy);
