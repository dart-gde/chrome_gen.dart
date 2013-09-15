// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from push_messaging.idl - do not edit */

library chrome.pushMessaging;

import '../src/common.dart';

/// Accessor for the `chrome.pushMessaging` namespace.
final ChromePushMessaging pushMessaging = new ChromePushMessaging._();

class ChromePushMessaging {
  JsObject _pushMessaging;

  ChromePushMessaging._() {
    _pushMessaging = context['chrome']['pushMessaging'];
  }
}
