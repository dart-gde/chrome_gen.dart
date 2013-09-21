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
  JsObject _bookmarks;

  ChromeBookmarks._() {
    _bookmarks = context['chrome']['bookmarks'];
  }

  /**
   * The maximum number of `move`, `update`, `create`, or `remove` operations
   * that can be performed each hour. Updates that would cause this limit to be
   * exceeded fail.
   */
  int get MAX_WRITE_OPERATIONS_PER_HOUR => _bookmarks['MAX_WRITE_OPERATIONS_PER_HOUR'];

  /**
   * The maximum number of `move`, `update`, `create`, or `remove` operations
   * that can be performed each minute, sustained over 10 minutes. Updates that
   * would cause this limit to be exceeded fail.
   */
  int get MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE => _bookmarks['MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE'];

  /**
   * Retrieves the specified BookmarkTreeNode(s).
   * 
   * [idOrIdList] A single string-valued id, or an array of string-valued ids
   */
  Future<List<BookmarkTreeNode>> get(var idOrIdList) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _bookmarks.callMethod('get', [idOrIdList, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the children of the specified BookmarkTreeNode id.
   */
  Future<List<BookmarkTreeNode>> getChildren(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _bookmarks.callMethod('getChildren', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the recently added bookmarks.
   * 
   * [numberOfItems] The maximum number of items to return.
   */
  Future<List<BookmarkTreeNode>> getRecent(int numberOfItems) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _bookmarks.callMethod('getRecent', [numberOfItems, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the entire Bookmarks hierarchy.
   */
  Future<List<BookmarkTreeNode>> getTree() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _bookmarks.callMethod('getTree', [completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves part of the Bookmarks hierarchy, starting at the specified node.
   * 
   * [id] The ID of the root of the subtree to retrieve.
   */
  Future<List<BookmarkTreeNode>> getSubTree(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _bookmarks.callMethod('getSubTree', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Searches for BookmarkTreeNodes matching the given query.
   */
  Future<List<BookmarkTreeNode>> search(String query) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _bookmarks.callMethod('search', [query, completer.callback]);
    return completer.future;
  }

  /**
   * Creates a bookmark or folder under the specified parentId.  If url is NULL
   * or missing, it will be a folder.
   */
  Future<BookmarkTreeNode> create(Map bookmark) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(BookmarkTreeNode.create);
    _bookmarks.callMethod('create', [jsify(bookmark), completer.callback]);
    return completer.future;
  }

  /**
   * Moves the specified BookmarkTreeNode to the provided location.
   */
  Future<BookmarkTreeNode> move(String id, Map destination) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(BookmarkTreeNode.create);
    _bookmarks.callMethod('move', [id, jsify(destination), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the properties of a bookmark or folder. Specify only the properties
   * that you want to change; unspecified properties will be left unchanged.
   * <b>Note:</b> Currently, only 'title' and 'url' are supported.
   */
  Future<BookmarkTreeNode> update(String id, Map changes) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(BookmarkTreeNode.create);
    _bookmarks.callMethod('update', [id, jsify(changes), completer.callback]);
    return completer.future;
  }

  /**
   * Removes a bookmark or an empty bookmark folder.
   */
  Future remove(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bookmarks.callMethod('remove', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Recursively removes a bookmark folder.
   */
  Future removeTree(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bookmarks.callMethod('removeTree', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Imports bookmarks from a chrome html bookmark file
   */
  Future import() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bookmarks.callMethod('import', [completer.callback]);
    return completer.future;
  }

  /**
   * Exports bookmarks to a chrome html bookmark file
   */
  Future export() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bookmarks.callMethod('export', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a bookmark or folder is created.
   */
  Stream<dynamic> get onCreated => _onCreated.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onCreated = null;

  /**
   * Fired when a bookmark or folder is removed.  When a folder is removed
   * recursively, a single notification is fired for the folder, and none for
   * its contents.
   */
  Stream<dynamic> get onRemoved => _onRemoved.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onRemoved = null;

  /**
   * Fired when a bookmark or folder changes.  <b>Note:</b> Currently, only
   * title and url changes trigger this.
   */
  Stream<dynamic> get onChanged => _onChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onChanged = null;

  /**
   * Fired when a bookmark or folder is moved to a different parent folder.
   */
  Stream<dynamic> get onMoved => _onMoved.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onMoved = null;

  /**
   * Fired when the children of a folder have changed their order due to the
   * order being sorted in the UI.  This is not called as a result of a move().
   */
  Stream<dynamic> get onChildrenReordered => _onChildrenReordered.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onChildrenReordered = null;

  /**
   * Fired when a bookmark import session is begun.  Expensive observers should
   * ignore onCreated updates until onImportEnded is fired.  Observers should
   * still handle other notifications immediately.
   */
  Stream<dynamic> get onImportBegan => _onImportBegan.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onImportBegan = null;

  /**
   * Fired when a bookmark import session is ended.
   */
  Stream<dynamic> get onImportEnded => _onImportEnded.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onImportEnded = null;
}

/**
 * A node (either a bookmark or a folder) in the bookmark tree.  Child nodes are
 * ordered within their parent folder.
 */
class BookmarkTreeNode extends ChromeObject {
  static BookmarkTreeNode create(JsObject proxy) => new BookmarkTreeNode(proxy);

  BookmarkTreeNode(JsObject proxy): super(proxy);

  /**
   * The unique identifier for the node. IDs are unique within the current
   * profile, and they remain valid even after the browser is restarted.
   */
  String get id => this.proxy['id'];

  /**
   * The `id` of the parent folder.  Omitted for the root node.
   */
  String get parentId => this.proxy['parentId'];

  /**
   * The 0-based position of this node within its parent folder.
   */
  int get index => this.proxy['index'];

  /**
   * The URL navigated to when a user clicks the bookmark. Omitted for folders.
   */
  String get url => this.proxy['url'];

  /**
   * The text displayed for the node.
   */
  String get title => this.proxy['title'];

  /**
   * When this node was created, in milliseconds since the epoch (`new
   * Date(dateAdded)`).
   */
  dynamic get dateAdded => this.proxy['dateAdded'];

  /**
   * When the contents of this folder last changed, in milliseconds since the
   * epoch.
   */
  dynamic get dateGroupModified => this.proxy['dateGroupModified'];

  /**
   * An ordered list of children of this node.
   */
  List<BookmarkTreeNode> get children => this.proxy['children'];
}
