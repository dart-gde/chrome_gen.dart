/* This file has been generated from push_messaging.idl - do not edit */

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
      new ChromeStreamController<Message>.oneArg(_pushMessaging['onMessage'], Message.create);
}

class Message extends ChromeObject {
  static Message create(JsObject proxy) => proxy == null ? null : new Message.fromProxy(proxy);

  Message({int subchannelId, String payload}) {
    if (subchannelId != null) this.subchannelId = subchannelId;
    if (payload != null) this.payload = payload;
  }

  Message.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get subchannelId => proxy['subchannelId'];
  set subchannelId(int value) => proxy['subchannelId'] = value;

  String get payload => proxy['payload'];
  set payload(String value) => proxy['payload'] = value;
}

class ChannelIdResult extends ChromeObject {
  static ChannelIdResult create(JsObject proxy) => proxy == null ? null : new ChannelIdResult.fromProxy(proxy);

  ChannelIdResult({String channelId}) {
    if (channelId != null) this.channelId = channelId;
  }

  ChannelIdResult.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get channelId => proxy['channelId'];
  set channelId(String value) => proxy['channelId'] = value;
}
