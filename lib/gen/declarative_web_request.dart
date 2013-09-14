// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from declarative_web_request.json - do not edit */

/**
 * Use the `chrome.declarativeWebRequest` API to intercept, block, or modify
 * requests in-flight. It is significantly faster than the <a
 * href='webRequest.html'>`chrome.webRequest` API</a> because you can register
 * rules that are evaluated in the browser rather than the JavaScript engine
 * with reduces roundtrip latencies and allows higher efficiency.
 */
library chrome.declarativeWebRequest;

import '../src/common.dart';

/// Accessor for the `chrome.declarativeWebRequest` namespace.
final ChromeDeclarativeWebRequest declarativeWebRequest = new ChromeDeclarativeWebRequest._();

class ChromeDeclarativeWebRequest {
  JsObject _declarativeWebRequest;

  ChromeDeclarativeWebRequest._() {
    _declarativeWebRequest = context['chrome']['declarativeWebRequest'];
  }

  Stream get onRequest => _onRequest.stream;

  final ChromeStreamController _onRequest = null;

  /**
   * Fired when a message is sent via
   * [declarativeWebRequest.SendMessageToExtension] from an action of the
   * declarative web request API.
   */
  Stream get onMessage => _onMessage.stream;

  final ChromeStreamController _onMessage = null;
}
