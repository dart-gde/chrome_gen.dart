// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from bookmarks.json - do not edit */

/**
 * Use the `chrome.bookmarks` API to create, organize, and otherwise manipulate
 * bookmarks. Also see [Override Pages](override.html), which you can use to
 * create a custom Bookmark Manager page.
 */
library chrome.bookmarks;

import '../src/common.dart';

/// Accessor for the `chrome.bookmarks` namespace.
final ChromeBookmarks bookmarks = new ChromeBookmarks._();

class ChromeBookmarks {
  ChromeBookmarks._();

  /**
   * The maximum number of `move`, `update`, `create`, or `remove` operations
   * that can be performed each hour. Updates that would cause this limit to be
   * exceeded fail.
   */
  int get MAX_WRITE_OPERATIONS_PER_HOUR => chrome['bookmarks']['MAX_WRITE_OPERATIONS_PER_HOUR'];

  /**
   * The maximum number of `move`, `update`, `create`, or `remove` operations
   * that can be performed each minute, sustained over 10 minutes. Updates that
   * would cause this limit to be exceeded fail.
   */
  int get MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE => chrome['bookmarks']['MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE'];

  /**
   * Retrieves the specified BookmarkTreeNode(s).
   * 
   * [idOrIdList] A single string-valued id, or an array of string-valued ids
   */
  Future<dynamic> get(var idOrIdList) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('get', [idOrIdList, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the children of the specified BookmarkTreeNode id.
   */
  Future<dynamic> getChildren(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('getChildren', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the recently added bookmarks.
   * 
   * [numberOfItems] The maximum number of items to return.
   */
  Future<dynamic> getRecent(int numberOfItems) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('getRecent', [numberOfItems, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the entire Bookmarks hierarchy.
   */
  Future<dynamic> getTree() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('getTree', [completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves part of the Bookmarks hierarchy, starting at the specified node.
   * 
   * [id] The ID of the root of the subtree to retrieve.
   */
  Future<dynamic> getSubTree(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('getSubTree', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Searches for BookmarkTreeNodes matching the given query.
   */
  Future<dynamic> search(String query) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('search', [query, completer.callback]);
    return completer.future;
  }

  /**
   * Creates a bookmark or folder under the specified parentId.  If url is NULL
   * or missing, it will be a folder.
   */
  Future<dynamic> create(var bookmark) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('create', [bookmark, completer.callback]);
    return completer.future;
  }

  /**
   * Moves the specified BookmarkTreeNode to the provided location.
   */
  Future<dynamic> move(String id, var destination) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('move', [id, destination, completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties of a bookmark or folder. Specify only the properties
   * that you want to change; unspecified properties will be left unchanged.
   * <b>Note:</b> Currently, only 'title' and 'url' are supported.
   */
  Future<dynamic> update(String id, var changes) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['bookmarks'].callMethod('update', [id, changes, completer.callback]);
    return completer.future;
  }

  /**
   * Removes a bookmark or an empty bookmark folder.
   */
  Future remove(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['bookmarks'].callMethod('remove', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Recursively removes a bookmark folder.
   */
  Future removeTree(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['bookmarks'].callMethod('removeTree', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Imports bookmarks from a chrome html bookmark file
   */
  Future import() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['bookmarks'].callMethod('import', [completer.callback]);
    return completer.future;
  }

  /**
   * Exports bookmarks to a chrome html bookmark file
   */
  Future export() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['bookmarks'].callMethod('export', [completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onCreated = null;

  /**
   * Fired when a bookmark or folder is created.
   */
  Stream get onCreated => _onCreated.stream;

  final ChromeStreamController _onRemoved = null;

  /**
   * Fired when a bookmark or folder is removed.  When a folder is removed
   * recursively, a single notification is fired for the folder, and none for
   * its contents.
   */
  Stream get onRemoved => _onRemoved.stream;

  final ChromeStreamController _onChanged = null;

  /**
   * Fired when a bookmark or folder changes.  <b>Note:</b> Currently, only
   * title and url changes trigger this.
   */
  Stream get onChanged => _onChanged.stream;

  final ChromeStreamController _onMoved = null;

  /**
   * Fired when a bookmark or folder is moved to a different parent folder.
   */
  Stream get onMoved => _onMoved.stream;

  final ChromeStreamController _onChildrenReordered = null;

  /**
   * Fired when the children of a folder have changed their order due to the
   * order being sorted in the UI.  This is not called as a result of a move().
   */
  Stream get onChildrenReordered => _onChildrenReordered.stream;

  final ChromeStreamController _onImportBegan = null;

  /**
   * Fired when a bookmark import session is begun.  Expensive observers should
   * ignore onCreated updates until onImportEnded is fired.  Observers should
   * still handle other notifications immediately.
   */
  Stream get onImportBegan => _onImportBegan.stream;

  final ChromeStreamController _onImportEnded = null;

  /**
   * Fired when a bookmark import session is ended.
   */
  Stream get onImportEnded => _onImportEnded.stream;
}
