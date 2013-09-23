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
  static final JsObject _bookmarks = context['chrome']['bookmarks'];

  ChromeBookmarks._();

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
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, BookmarkTreeNode.create));
    _bookmarks.callMethod('get', [idOrIdList, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the children of the specified BookmarkTreeNode id.
   */
  Future<List<BookmarkTreeNode>> getChildren(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, BookmarkTreeNode.create));
    _bookmarks.callMethod('getChildren', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the recently added bookmarks.
   * 
   * [numberOfItems] The maximum number of items to return.
   */
  Future<List<BookmarkTreeNode>> getRecent(int numberOfItems) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, BookmarkTreeNode.create));
    _bookmarks.callMethod('getRecent', [numberOfItems, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the entire Bookmarks hierarchy.
   */
  Future<List<BookmarkTreeNode>> getTree() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, BookmarkTreeNode.create));
    _bookmarks.callMethod('getTree', [completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves part of the Bookmarks hierarchy, starting at the specified node.
   * 
   * [id] The ID of the root of the subtree to retrieve.
   */
  Future<List<BookmarkTreeNode>> getSubTree(String id) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, BookmarkTreeNode.create));
    _bookmarks.callMethod('getSubTree', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Searches for BookmarkTreeNodes matching the given query.
   */
  Future<List<BookmarkTreeNode>> search(String query) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, BookmarkTreeNode.create));
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
  Stream<OnCreatedEvent> get onCreated => _onCreated.stream;

  final ChromeStreamController<OnCreatedEvent> _onCreated =
      new ChromeStreamController<OnCreatedEvent>.twoArgs(_bookmarks['onCreated'], OnCreatedEvent.create);

  /**
   * Fired when a bookmark or folder is removed.  When a folder is removed
   * recursively, a single notification is fired for the folder, and none for
   * its contents.
   */
  Stream<OnRemovedEvent> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<OnRemovedEvent> _onRemoved =
      new ChromeStreamController<OnRemovedEvent>.twoArgs(_bookmarks['onRemoved'], OnRemovedEvent.create);

  /**
   * Fired when a bookmark or folder changes.  <b>Note:</b> Currently, only
   * title and url changes trigger this.
   */
  Stream<OnChangedEvent> get onChanged => _onChanged.stream;

  final ChromeStreamController<OnChangedEvent> _onChanged =
      new ChromeStreamController<OnChangedEvent>.twoArgs(_bookmarks['onChanged'], OnChangedEvent.create);

  /**
   * Fired when a bookmark or folder is moved to a different parent folder.
   */
  Stream<OnMovedEvent> get onMoved => _onMoved.stream;

  final ChromeStreamController<OnMovedEvent> _onMoved =
      new ChromeStreamController<OnMovedEvent>.twoArgs(_bookmarks['onMoved'], OnMovedEvent.create);

  /**
   * Fired when the children of a folder have changed their order due to the
   * order being sorted in the UI.  This is not called as a result of a move().
   */
  Stream<OnChildrenReorderedEvent> get onChildrenReordered => _onChildrenReordered.stream;

  final ChromeStreamController<OnChildrenReorderedEvent> _onChildrenReordered =
      new ChromeStreamController<OnChildrenReorderedEvent>.twoArgs(_bookmarks['onChildrenReordered'], OnChildrenReorderedEvent.create);

  /**
   * Fired when a bookmark import session is begun.  Expensive observers should
   * ignore onCreated updates until onImportEnded is fired.  Observers should
   * still handle other notifications immediately.
   */
  Stream get onImportBegan => _onImportBegan.stream;

  final ChromeStreamController _onImportBegan =
      new ChromeStreamController.noArgs(_bookmarks['onImportBegan']);

  /**
   * Fired when a bookmark import session is ended.
   */
  Stream get onImportEnded => _onImportEnded.stream;

  final ChromeStreamController _onImportEnded =
      new ChromeStreamController.noArgs(_bookmarks['onImportEnded']);
}

/**
 * Fired when a bookmark or folder is created.
 */
class OnCreatedEvent {
  static OnCreatedEvent create(String id, JsObject bookmark) =>
      new OnCreatedEvent(id, BookmarkTreeNode.create(bookmark));

  String id;

  BookmarkTreeNode bookmark;

  OnCreatedEvent(this.id, this.bookmark);
}

/**
 * Fired when a bookmark or folder is removed.  When a folder is removed
 * recursively, a single notification is fired for the folder, and none for its
 * contents.
 */
class OnRemovedEvent {
  static OnRemovedEvent create(String id, JsObject removeInfo) =>
      new OnRemovedEvent(id, mapify(removeInfo));

  String id;

  Map removeInfo;

  OnRemovedEvent(this.id, this.removeInfo);
}

/**
 * Fired when a bookmark or folder changes.  <b>Note:</b> Currently, only title
 * and url changes trigger this.
 */
class OnChangedEvent {
  static OnChangedEvent create(String id, JsObject changeInfo) =>
      new OnChangedEvent(id, mapify(changeInfo));

  String id;

  Map changeInfo;

  OnChangedEvent(this.id, this.changeInfo);
}

/**
 * Fired when a bookmark or folder is moved to a different parent folder.
 */
class OnMovedEvent {
  static OnMovedEvent create(String id, JsObject moveInfo) =>
      new OnMovedEvent(id, mapify(moveInfo));

  String id;

  Map moveInfo;

  OnMovedEvent(this.id, this.moveInfo);
}

/**
 * Fired when the children of a folder have changed their order due to the order
 * being sorted in the UI.  This is not called as a result of a move().
 */
class OnChildrenReorderedEvent {
  static OnChildrenReorderedEvent create(String id, JsObject reorderInfo) =>
      new OnChildrenReorderedEvent(id, mapify(reorderInfo));

  String id;

  Map reorderInfo;

  OnChildrenReorderedEvent(this.id, this.reorderInfo);
}

/**
 * A node (either a bookmark or a folder) in the bookmark tree.  Child nodes are
 * ordered within their parent folder.
 */
class BookmarkTreeNode extends ChromeObject {
  static BookmarkTreeNode create(JsObject proxy) => proxy == null ? null : new BookmarkTreeNode(proxy);

  BookmarkTreeNode(JsObject proxy): super(proxy);

  /**
   * The unique identifier for the node. IDs are unique within the current
   * profile, and they remain valid even after the browser is restarted.
   */
  String get id => proxy['id'];

  /**
   * The `id` of the parent folder.  Omitted for the root node.
   */
  String get parentId => proxy['parentId'];

  /**
   * The 0-based position of this node within its parent folder.
   */
  int get index => proxy['index'];

  /**
   * The URL navigated to when a user clicks the bookmark. Omitted for folders.
   */
  String get url => proxy['url'];

  /**
   * The text displayed for the node.
   */
  String get title => proxy['title'];

  /**
   * When this node was created, in milliseconds since the epoch (`new
   * Date(dateAdded)`).
   */
  dynamic get dateAdded => proxy['dateAdded'];

  /**
   * When the contents of this folder last changed, in milliseconds since the
   * epoch.
   */
  dynamic get dateGroupModified => proxy['dateGroupModified'];

  /**
   * An ordered list of children of this node.
   */
  List<BookmarkTreeNode> get children => listify(proxy['children'], BookmarkTreeNode.create);
}
