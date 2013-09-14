// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from push_messaging.idl - do not edit */

library chrome.push_messaging;

import '../src/common.dart';

/// Accessor for the `chrome.push.messaging` namespace.
final ChromePushMessaging push_messaging = new ChromePushMessaging._();

class ChromePushMessaging {
  JsObject _push_messaging;

  ChromePushMessaging._() {
    _push_messaging = context['chrome']['push']['messaging'];
  }
}
