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
  Stream<OnResourceContentCommittedEvent> get onResourceContentCommitted => _onResourceContentCommitted.stream;

  final ChromeStreamController<OnResourceContentCommittedEvent> _onResourceContentCommitted =
      new ChromeStreamController<OnResourceContentCommittedEvent>.twoArgs(_devtools_inspectedWindow['onResourceContentCommitted'], OnResourceContentCommittedEvent.create);
}

/**
 * Fired when a new revision of the resource is committed (e.g. user saves an
 * edited version of the resource in the Developer Tools).
 */
class OnResourceContentCommittedEvent {
  static OnResourceContentCommittedEvent create(JsObject resource, String content) =>
      new OnResourceContentCommittedEvent(Resource.create(resource), content);

  Resource resource;

  /**
   * New content of the resource.
   */
  String content;

  OnResourceContentCommittedEvent(this.resource, this.content);
}

/**
 * A resource within the inspected page, such as a document, a script, or an
 * image.
 */
class Resource extends ChromeObject {
  static Resource create(JsObject proxy) => proxy == null ? null : new Resource.fromProxy(proxy);

  Resource({String url}) {
    if (url != null) this.url = url;
  }

  Resource.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The URL of the resource.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;
}
