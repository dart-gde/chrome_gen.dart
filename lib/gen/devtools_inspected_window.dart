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
final ChromeDevtoolsInspectedWindow devtools_inspectedWindow = ChromeDevtoolsInspectedWindow._devtools_inspectedWindow == null ? apiNotAvailable('chrome.devtools.inspectedWindow') : new ChromeDevtoolsInspectedWindow._();

class ChromeDevtoolsInspectedWindow {
  static final JsObject _devtools_inspectedWindow = chrome['devtools']['inspectedWindow'];

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
    var completer = new ChromeCompleter<JsObject>.oneArg();
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
    var completer = new ChromeCompleter<List<Resource>>.oneArg((e) => listify(e, _createResource));
    _devtools_inspectedWindow.callMethod('getResources', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a new resource is added to the inspected page.
   */
  Stream<Resource> get onResourceAdded => _onResourceAdded.stream;

  final ChromeStreamController<Resource> _onResourceAdded =
      new ChromeStreamController<Resource>.oneArg(_devtools_inspectedWindow['onResourceAdded'], _createResource);

  /**
   * Fired when a new revision of the resource is committed (e.g. user saves an
   * edited version of the resource in the Developer Tools).
   */
  Stream<OnResourceContentCommittedEvent> get onResourceContentCommitted => _onResourceContentCommitted.stream;

  final ChromeStreamController<OnResourceContentCommittedEvent> _onResourceContentCommitted =
      new ChromeStreamController<OnResourceContentCommittedEvent>.twoArgs(_devtools_inspectedWindow['onResourceContentCommitted'], _createOnResourceContentCommittedEvent);
}

/**
 * Fired when a new revision of the resource is committed (e.g. user saves an
 * edited version of the resource in the Developer Tools).
 */
class OnResourceContentCommittedEvent {

  final Resource resource;

  /**
   * New content of the resource.
   */
  final String content;

  OnResourceContentCommittedEvent(this.resource, this.content);
}

/**
 * A resource within the inspected page, such as a document, a script, or an
 * image.
 */
class Resource extends ChromeObject {

  Resource({String url}) {
    if (url != null) this.url = url;
  }

  Resource.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The URL of the resource.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;

  /**
   * Gets the content of the resource.
   * 
   * Returns:
   * [content] Content of the resource (potentially encoded).
   * [encoding] Empty if content is not encoded, encoding name otherwise.
   * Currently, only base64 is supported.
   */
  Future<JsObject> getContent() {
    var completer = new ChromeCompleter<JsObject>.oneArg();
    proxy.callMethod('getContent', [completer.callback]);
    return completer.future;
  }

  /**
   * Sets the content of the resource.
   * 
   * [content] New content of the resource. Only resources with the text type
   * are currently supported.
   * 
   * [commit] True if the user has finished editing the resource, and the new
   * content of the resource should be persisted; false if this is a minor
   * change sent in progress of the user editing the resource.
   * 
   * Returns:
   * Set to undefined if the resource content was set successfully; describes
   * error otherwise.
   */
  Future<Map<String, dynamic>> setContent(String content, bool commit) {
    var completer = new ChromeCompleter<Map<String, dynamic>>.oneArg(mapify);
    proxy.callMethod('setContent', [content, commit, completer.callback]);
    return completer.future;
  }
}

Resource _createResource(JsObject proxy) => proxy == null ? null : new Resource.fromProxy(proxy);
OnResourceContentCommittedEvent _createOnResourceContentCommittedEvent(JsObject resource, String content) =>
    new OnResourceContentCommittedEvent(_createResource(resource), content);
