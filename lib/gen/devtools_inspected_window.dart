// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from inspected_window.json - do not edit */

/**
 * Use the `chrome.devtools.inspectedWindow` API to interact with the inspected
 * window: obtain the tab ID for the inspected page, evaluate the code in the
 * context of the inspected window, reload the page, or obtain the list of
 * resources within the page.
 */
library chrome.devtools_inspected_window;

import '../src/common.dart';

/// Accessor for the `chrome.devtools_inspected_window` namespace.
final ChromeDevtoolsInspectedWindow devtools_inspected_window = new ChromeDevtoolsInspectedWindow._();

class ChromeDevtoolsInspectedWindow {
  ChromeDevtoolsInspectedWindow._();

  /**
   * The ID of the tab being inspected. This ID may be used with chrome.tabs.*
   * API.
   */
  int get tabId => chrome['devtools_inspected_window']['tabId'];

  /**
   * Evaluates a JavaScript expression in the context of the main frame of the
   * inspected page. The expression must evaluate to a JSON-compliant object,
   * otherwise an exception is thrown.
   * 
   * [expression] An expression to evaluate.
   * 
   * [callback] A function called when evaluation completes.
   */
  Future eval(String expression) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['devtools_inspected_window'].callMethod('eval', [expression, completer.callback]);
    return completer.future;
  }

  /**
   * Reloads the inspected page.
   */
  void reload(dynamic reloadOptions) {
    chrome['devtools_inspected_window'].callMethod('reload', [reloadOptions]);
  }

  /**
   * Retrieves the list of resources from the inspected page.
   * 
   * [callback] A function that receives the list of resources when the request
   * completes.
   */
  Future getResources() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['devtools_inspected_window'].callMethod('getResources', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a new resource is added to the inspected page.
   */
  Stream get onResourceAdded => null;

  /**
   * Fired when a new revision of the resource is committed (e.g. user saves an
   * edited version of the resource in the Developer Tools).
   */
  Stream get onResourceContentCommitted => null;
}
