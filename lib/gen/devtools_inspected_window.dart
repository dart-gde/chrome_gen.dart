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
library chrome.devtools_inspectedWindow;

import '../src/common.dart';

/// Accessor for the `chrome.devtools.inspectedWindow` namespace.
final ChromeDevtoolsInspectedWindow devtools_inspectedWindow = new ChromeDevtoolsInspectedWindow._();

class ChromeDevtoolsInspectedWindow {
  JsObject _devtools_inspectedWindow;

  ChromeDevtoolsInspectedWindow._() {
    _devtools_inspectedWindow = context['chrome']['devtools']['inspectedWindow'];
  }

  /**
   * The ID of the tab being inspected. This ID may be used with chrome.tabs.*
   * API.
   */
  int get tabId => _devtools_inspectedWindow['tabId'];

  /**
   * Evaluates a JavaScript expression in the context of the main frame of the
   * inspected page. The expression must evaluate to a JSON-compliant object,
   * otherwise an exception is thrown.
   * 
   * [expression] An expression to evaluate.
   * 
   * Returns:
   * [result] The result of evaluation.
   * [isException] Set if an exception was caught while evaluating the
   * expression.
   */
  Future<JsObject> eval(String expression) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _devtools_inspectedWindow.callMethod('eval', [expression, completer.callback]);
    return completer.future;
  }

  /**
   * Reloads the inspected page.
   */
  void reload(var reloadOptions) {
    _devtools_inspectedWindow.callMethod('reload', [reloadOptions]);
  }

  /**
   * Retrieves the list of resources from the inspected page.
   * 
   * Returns:
   * The resources within the page.
   */
  Future<dynamic> getResources() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _devtools_inspectedWindow.callMethod('getResources', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a new resource is added to the inspected page.
   */
  Stream<dynamic> get onResourceAdded => _onResourceAdded.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onResourceAdded = null;

  /**
   * Fired when a new revision of the resource is committed (e.g. user saves an
   * edited version of the resource in the Developer Tools).
   */
  Stream<dynamic> get onResourceContentCommitted => _onResourceContentCommitted.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onResourceContentCommitted = null;
}

/**
 * A resource within the inspected page, such as a document, a script, or an
 * image.
 */
class Resource extends ChromeObject {
  Resource(JsObject proxy): super(proxy);
  // TODO:
}
