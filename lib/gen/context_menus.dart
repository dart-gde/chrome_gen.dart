// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from context_menus.json - do not edit */

/**
 * Use the `chrome.contextMenus` API to add items to Google Chrome's context
 * menu. You can choose what types of objects your context menu additions apply
 * to, such as images, hyperlinks, and pages.
 */
library chrome.context_menus;

import '../src/common.dart';

/// Accessor for the `chrome.context_menus` namespace.
final ChromeContextMenus context_menus = new ChromeContextMenus._();

class ChromeContextMenus {
  ChromeContextMenus._();

  /**
   * Creates a new context menu item. Note that if an error occurs during
   * creation, you may not find out until the creation callback fires (the
   * details will be in chrome.runtime.lastError).
   * 
   * [callback] Called when the item has been created in the browser. If there
   * were any problems creating the item, details will be available in
   * chrome.runtime.lastError.
   */
  Future create(dynamic createProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['context_menus'].callMethod('create', [createProperties, completer.callback]);
    return completer.future;
  }

  /**
   * Updates a previously created context menu item.
   * 
   * [id] The ID of the item to update.
   * 
   * [updateProperties] The properties to update. Accepts the same values as the
   * create function.
   * 
   * [callback] Called when the context menu has been updated.
   */
  Future update(var id, dynamic updateProperties) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['context_menus'].callMethod('update', [id, updateProperties, completer.callback]);
    return completer.future;
  }

  /**
   * Removes a context menu item.
   * 
   * [menuItemId] The ID of the context menu item to remove.
   * 
   * [callback] Called when the context menu has been removed.
   */
  Future remove(var menuItemId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['context_menus'].callMethod('remove', [menuItemId, completer.callback]);
    return completer.future;
  }

  /**
   * Removes all context menu items added by this extension.
   * 
   * [callback] Called when removal is complete.
   */
  Future removeAll() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['context_menus'].callMethod('removeAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a context menu item is clicked.
   */
  Stream get onClicked => null;
}
