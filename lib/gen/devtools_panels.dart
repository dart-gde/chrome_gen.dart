// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from panels.json - do not edit */

/**
 * Use the `chrome.devtools.panels` API to integrate your extension into
 * Developer Tools window UI: create your own panels, access existing panels,
 * and add sidebars.
 */
library chrome.devtools_panels;

import '../src/common.dart';

/// Accessor for the `chrome.devtools.panels` namespace.
final ChromeDevtoolsPanels devtools_panels = new ChromeDevtoolsPanels._();

class ChromeDevtoolsPanels {
  JsObject _devtools_panels;

  ChromeDevtoolsPanels._() {
    _devtools_panels = context['chrome']['devtools']['panels'];
  }

  /**
   * Elements panel.
   */
  dynamic get elements => _devtools_panels['elements'];

  /**
   * Creates an extension panel.
   * 
   * [title] Title that is displayed next to the extension icon in the Developer
   * Tools toolbar.
   * 
   * [iconPath] Path of the panel's icon relative to the extension directory.
   * 
   * [pagePath] Path of the panel's HTML page relative to the extension
   * directory.
   * 
   * Returns:
   * An ExtensionPanel object representing the created panel.
   */
  Future<dynamic> create(String title, String iconPath, String pagePath) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _devtools_panels.callMethod('create', [title, iconPath, pagePath, completer.callback]);
    return completer.future;
  }

  /**
   * Specifies the function to be called when the user clicks a resource link in
   * the Developer Tools window. To unset the handler, either call the method
   * with no parameters or pass null as the parameter.
   * 
   * Returns:
   * A [devtools.inspectedWindow.Resource] object for the resource that was
   * clicked.
   */
  Future<dynamic> setOpenResourceHandler() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(selfConverter);
    _devtools_panels.callMethod('setOpenResourceHandler', [completer.callback]);
    return completer.future;
  }
}

/**
 * Represents the Elements panel.
 */
class ElementsPanel extends ChromeObject {
  ElementsPanel(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Represents a panel created by extension.
 */
class ExtensionPanel extends ChromeObject {
  ExtensionPanel(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A sidebar created by the extension.
 */
class ExtensionSidebarPane extends ChromeObject {
  ExtensionSidebarPane(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A button created by the extension.
 */
class Button extends ChromeObject {
  Button(JsObject proxy): super(proxy);
  // TODO:
}
