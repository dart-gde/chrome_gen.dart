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
  static final JsObject _devtools_inspectedWindow = context['chrome']['devtools']['inspectedWindow'];

  ChromeDevtoolsInspectedWindow._();

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
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _devtools_inspectedWindow.callMethod('eval', [expression, completer.callback]);
    return completer.future;
  }

  /**
   * Reloads the inspected page.
   * 
   * [reloadOptions] `ignoreCache` When true, the loader will ignore the cache
   * for all inspected page resources loaded before the `load` event is fired.
   * The effect is similar to pressing Ctrl+Shift+R in the inspected window or
   * within the Developer Tools window.
   * 
   * `userAgent` If specified, the string will override the value of the
   * `User-Agent` HTTP header that's sent while loading the resources of the
   * inspected page. The string will also override the value of the
   * `navigator.userAgent` property that's returned to any scripts that are
   * running within the inspected page.
   * 
   * `injectedScript` If specified, the script will be injected into every frame
   * of the inspected page immediately upon load, before any of the frame's
   * scripts. The script will not be injected after subsequent reloads-for
   * example, if the user presses Ctrl+R.
   */
  void reload([Map reloadOptions]) {
    _devtools_inspectedWindow.callMethod('reload', [jsify(reloadOptions)]);
  }

  /**
   * Retrieves the list of resources from the inspected page.
   * 
   * Returns:
   * The resources within the page.
   */
  Future<List<Resource>> getResources() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, Resource.create));
    _devtools_inspectedWindow.callMethod('getResources', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a new resource is added to the inspected page.
   */
  Stream<Resource> get onResourceAdded => _onResourceAdded.stream;

  final ChromeStreamController<Resource> _onResourceAdded =
      new ChromeStreamController<Resource>.oneArg(_devtools_inspectedWindow['onResourceAdded'], Resource.create);

  /**
   * Fired when a new revision of the resource is committed (e.g. user saves an
   * edited version of the resource in the Developer Tools).
   */
  Stream<dynamic> get onResourceContentCommitted => _onResourceContentCommitted.stream;

  final ChromeStreamController<dynamic> _onResourceContentCommitted =
      new ChromeStreamController<dynamic>.oneArg(_devtools_inspectedWindow['onResourceContentCommitted'], selfConverter);
}

/**
 * A resource within the inspected page, such as a document, a script, or an
 * image.
 * 
 * `url` The URL of the resource.
 */
class Resource extends ChromeObject {
  static Resource create(JsObject proxy) => new Resource(proxy);

  Resource(JsObject proxy): super(proxy);

  /**
   * The URL of the resource.
   */
  String get url => proxy['url'];
}
