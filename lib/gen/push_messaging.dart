// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from push_messaging.idl - do not edit */

/**
 * 
 */
library chrome.pushMessaging;

import '../src/common.dart';

/// Accessor for the `chrome.pushMessaging` namespace.
final ChromePushMessaging pushMessaging = new ChromePushMessaging._();

class ChromePushMessaging {
  static final JsObject _pushMessaging = context['chrome']['pushMessaging'];

  ChromePushMessaging._();

  Future getChannelId([bool interactive]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _pushMessaging.callMethod('getChannelId', [interactive, completer.callback]);
    return completer.future;
  }

  Stream<Message> get onMessage => _onMessage.stream;

  final ChromeStreamController<Message> _onMessage =
      new ChromeStreamController<Message>.oneArg(_pushMessaging['onMessage'], selfConverter);
}

class Message extends ChromeObject {
  static Message create(JsObject proxy) => new Message(proxy);

  Message(JsObject proxy): super(proxy);
}

class ChannelIdResult extends ChromeObject {
  static ChannelIdResult create(JsObject proxy) => new ChannelIdResult(proxy);

  ChannelIdResult(JsObject proxy): super(proxy);
}
