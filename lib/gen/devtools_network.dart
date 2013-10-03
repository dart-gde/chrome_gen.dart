/* This file has been generated from network.json - do not edit */

/**
 * Use the `chrome.devtools.network` API to retrieve the information about
 * network requests displayed by the Developer Tools in the Network panel.
 */
library chrome.devtools_network;

import '../src/common.dart';

/// Accessor for the `chrome.devtools.network` namespace.
final ChromeDevtoolsNetwork devtools_network = ChromeDevtoolsNetwork._devtools_network == null ? apiNotAvailable('chrome.devtools.network') : new ChromeDevtoolsNetwork._();

class ChromeDevtoolsNetwork {
  static final JsObject _devtools_network = context['chrome']['devtools']['network'];

  ChromeDevtoolsNetwork._();

  /**
   * Returns HAR log that contains all known network requests.
   * 
   * Returns:
   * A HAR log. See HAR specification for details.
   */
  Future<Map<String, dynamic>> getHAR() {
    var completer = new ChromeCompleter<Map<String, dynamic>>.oneArg(mapify);
    _devtools_network.callMethod('getHAR', [completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a network request is finished and all request data are
   * available.
   */
  Stream<Request> get onRequestFinished => _onRequestFinished.stream;

  final ChromeStreamController<Request> _onRequestFinished =
      new ChromeStreamController<Request>.oneArg(_devtools_network['onRequestFinished'], _createRequest);

  /**
   * Fired when the inspected window navigates to a new page.
   */
  Stream<String> get onNavigated => _onNavigated.stream;

  final ChromeStreamController<String> _onNavigated =
      new ChromeStreamController<String>.oneArg(_devtools_network['onNavigated'], selfConverter);
}

/**
 * Represents a network request for a document resource (script, image and so
 * on). See HAR Specification for reference.
 */
class Request extends ChromeObject {

  Request();

  Request.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Returns content of the response body.
   * 
   * Returns:
   * [content] Content of the response body (potentially encoded).
   * [encoding] Empty if content is not encoded, encoding name otherwise.
   * Currently, only base64 is supported.
   */
  Future<JsObject> getContent() {
    var completer = new ChromeCompleter<JsObject>.oneArg();
    proxy.callMethod('getContent', [completer.callback]);
    return completer.future;
  }
}

Request _createRequest(JsObject proxy) => proxy == null ? null : new Request.fromProxy(proxy);
