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
library chrome.declarative_web_request;

import '../src/common.dart';

/// Accessor for the `chrome.declarative_web_request` namespace.
final ChromeDeclarativeWebRequest declarative_web_request = new ChromeDeclarativeWebRequest._();

class ChromeDeclarativeWebRequest {
  ChromeDeclarativeWebRequest._();

  Stream get onRequest => null;

  /**
   * Fired when a message is sent via
   * [declarativeWebRequest.SendMessageToExtension] from an action of the
   * declarative web request API.
   */
  Stream get onMessage => null;
}
