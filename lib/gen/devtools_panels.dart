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
  ElementsPanel get elements => ElementsPanel.create(_devtools_panels['elements']);

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
    var completer = new ChromeCompleter<ExtensionPanel>.oneArg(ExtensionPanel.create);
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
    var completer = new ChromeCompleter<Resource>.oneArg(Resource.create);
    _devtools_panels.callMethod('setOpenResourceHandler', [completer.callback]);
    return completer.future;
  }
}

/**
 * Represents the Elements panel.
 */
class ElementsPanel extends ChromeObject {
  static ElementsPanel create(JsObject proxy) => proxy == null ? null : new ElementsPanel.fromProxy(proxy);

  ElementsPanel();

  ElementsPanel.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Creates a pane within panel's sidebar.
   * 
   * [title] Text that is displayed in sidebar caption.
   * 
   * Returns:
   * An ExtensionSidebarPane object for created sidebar pane.
   */
  Future<ExtensionSidebarPane> createSidebarPane(String title) {
    var completer = new ChromeCompleter<ExtensionSidebarPane>.oneArg(ExtensionSidebarPane.create);
    proxy.callMethod('createSidebarPane', [title, completer.callback]);
    return completer.future;
  }
}

/**
 * Represents a panel created by extension.
 */
class ExtensionPanel extends ChromeObject {
  static ExtensionPanel create(JsObject proxy) => proxy == null ? null : new ExtensionPanel.fromProxy(proxy);

  ExtensionPanel();

  ExtensionPanel.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Appends a button to the status bar of the panel.
   * 
   * [iconPath] Path to the icon of the button. The file should contain a
   * 64x24-pixel image composed of two 32x24 icons. The left icon is used when
   * the button is inactive; the right icon is displayed when the button is
   * pressed.
   * 
   * [tooltipText] Text shown as a tooltip when user hovers the mouse over the
   * button.
   * 
   * [disabled] Whether the button is disabled.
   */
  Button createStatusBarButton(String iconPath, String tooltipText, bool disabled) {
    return Button.create(proxy.callMethod('createStatusBarButton', [iconPath, tooltipText, disabled]));
  }
}

/**
 * A sidebar created by the extension.
 */
class ExtensionSidebarPane extends ChromeObject {
  static ExtensionSidebarPane create(JsObject proxy) => proxy == null ? null : new ExtensionSidebarPane.fromProxy(proxy);

  ExtensionSidebarPane();

  ExtensionSidebarPane.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Sets the height of the sidebar.
   * 
   * [height] A CSS-like size specification, such as `'100px'` or `'12ex'`.
   */
  void setHeight(String height) {
    proxy.callMethod('setHeight', [height]);
  }

  /**
   * Sets an expression that is evaluated within the inspected page. The result
   * is displayed in the sidebar pane.
   * 
   * [expression] An expression to be evaluated in context of the inspected
   * page. JavaScript objects and DOM nodes are displayed in an expandable tree
   * similar to the console/watch.
   * 
   * [rootTitle] An optional title for the root of the expression tree.
   */
  Future setExpression(String expression, [String rootTitle]) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('setExpression', [expression, rootTitle, completer.callback]);
    return completer.future;
  }

  /**
   * Sets a JSON-compliant object to be displayed in the sidebar pane.
   * 
   * [jsonObject] An object to be displayed in context of the inspected page.
   * Evaluated in the context of the caller (API client).
   * 
   * [rootTitle] An optional title for the root of the expression tree.
   */
  Future setObject(String jsonObject, [String rootTitle]) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('setObject', [jsonObject, rootTitle, completer.callback]);
    return completer.future;
  }

  /**
   * Sets an HTML page to be displayed in the sidebar pane.
   * 
   * [path] Relative path of an extension page to display within the sidebar.
   */
  void setPage(String path) {
    proxy.callMethod('setPage', [path]);
  }
}

/**
 * A button created by the extension.
 */
class Button extends ChromeObject {
  static Button create(JsObject proxy) => proxy == null ? null : new Button.fromProxy(proxy);

  Button();

  Button.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Updates the attributes of the button. If some of the arguments are omitted
   * or `null`, the corresponding attributes are not updated.
   * 
   * [iconPath] Path to the new icon of the button.
   * 
   * [tooltipText] Text shown as a tooltip when user hovers the mouse over the
   * button.
   * 
   * [disabled] Whether the button is disabled.
   */
  void update([String iconPath, String tooltipText, bool disabled]) {
    proxy.callMethod('update', [iconPath, tooltipText, disabled]);
  }
}
