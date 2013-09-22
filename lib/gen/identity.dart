// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from identity.idl - do not edit */

/**
 * 
 */
library chrome.identity;

import '../src/common.dart';

/// Accessor for the `chrome.identity` namespace.
final ChromeIdentity identity = new ChromeIdentity._();

class ChromeIdentity {
  static final JsObject _identity = context['chrome']['identity'];

  ChromeIdentity._();

  Future getAuthToken([TokenDetails details]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('getAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future removeCachedAuthToken(InvalidTokenDetails details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('removeCachedAuthToken', [details, completer.callback]);
    return completer.future;
  }

  Future launchWebAuthFlow(WebAuthFlowDetails details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _identity.callMethod('launchWebAuthFlow', [details, completer.callback]);
    return completer.future;
  }
}
