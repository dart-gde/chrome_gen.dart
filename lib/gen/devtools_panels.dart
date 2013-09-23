/* This file has been generated from panels.json - do not edit */

/**
 * Use the `chrome.devtools.panels` API to integrate your extension into
 * Developer Tools window UI: create your own panels, access existing panels,
 * and add sidebars.
 */
library chrome.devtools_panels;

import 'devtools_inspected_window.dart';
import '../src/common.dart';

/// Accessor for the `chrome.devtools.panels` namespace.
final ChromeDevtoolsPanels devtools_panels = new ChromeDevtoolsPanels._();

class ChromeDevtoolsPanels {
  static final JsObject _devtools_panels = context['chrome']['devtools']['panels'];

  ChromeDevtoolsPanels._();

  /**
   * Elements panel.
   */
  ElementsPanel get elements => new ElementsPanel(_devtools_panels['elements']);

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
  Future<ExtensionPanel> create(String title, String iconPath, String pagePath) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(ExtensionPanel.create);
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
  Future<Resource> setOpenResourceHandler() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Resource.create);
    _devtools_panels.callMethod('setOpenResourceHandler', [completer.callback]);
    return completer.future;
  }
}

/**
 * Represents the Elements panel.
 */
class ElementsPanel extends ChromeObject {
  static ElementsPanel create(JsObject proxy) => proxy == null ? null : new ElementsPanel(proxy);

  ElementsPanel(JsObject proxy): super(proxy);
}

/**
 * Represents a panel created by extension.
 */
class ExtensionPanel extends ChromeObject {
  static ExtensionPanel create(JsObject proxy) => proxy == null ? null : new ExtensionPanel(proxy);

  ExtensionPanel(JsObject proxy): super(proxy);
}

/**
 * A sidebar created by the extension.
 */
class ExtensionSidebarPane extends ChromeObject {
  static ExtensionSidebarPane create(JsObject proxy) => proxy == null ? null : new ExtensionSidebarPane(proxy);

  ExtensionSidebarPane(JsObject proxy): super(proxy);
}

/**
 * A button created by the extension.
 */
class Button extends ChromeObject {
  static Button create(JsObject proxy) => proxy == null ? null : new Button(proxy);

  Button(JsObject proxy): super(proxy);
}
