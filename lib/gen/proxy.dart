// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from proxy.json - do not edit */

/**
 * Use the `chrome.proxy` API to manage Chrome's proxy settings. This API relies
 * on the [ChromeSetting prototype of the type API](types.html#ChromeSetting)
 * for getting and setting the proxy configuration.
 */
library chrome.proxy;

import '../src/common.dart';

/// Accessor for the `chrome.proxy` namespace.
final ChromeProxy proxy = new ChromeProxy._();

class ChromeProxy {
  JsObject _proxy;

  ChromeProxy._() {
    _proxy = context['chrome']['proxy'];
  }

  /**
   * Proxy settings to be used. The value of this setting is a ProxyConfig
   * object.
   */
  dynamic get settings => _proxy['settings'];

  /**
   * Notifies about proxy errors.
   */
  Stream get onProxyError => _onProxyError.stream;

  final ChromeStreamController _onProxyError = null;
}
