/* This file has been generated from push_messaging.idl - do not edit */

library chrome.pushMessaging;

import '../src/common.dart';

/// Accessor for the `chrome.pushMessaging` namespace.
final ChromePushMessaging pushMessaging = ChromePushMessaging._pushMessaging == null ? apiNotAvailable('chrome.pushMessaging') : new ChromePushMessaging._();

class ChromePushMessaging {
  static final JsObject _pushMessaging = context['chrome']['pushMessaging'];

  ChromePushMessaging._();

  /**
   * Retrieves the channel ID associated with this app or extension. Typically
   * an app or extension will want to send this value to its application server
   * so the server can use it to trigger push messages back to the app or
   * extension. If the interactive flag is set, we will ask the user to log in
   * when they are not already logged in.
   */
  Future<ChannelIdResult> getChannelId([bool interactive]) {
    var completer = new ChromeCompleter<ChannelIdResult>.oneArg(_createChannelIdResult);
    _pushMessaging.callMethod('getChannelId', [interactive, completer.callback]);
    return completer.future;
  }

  Stream<Message> get onMessage => _onMessage.stream;

  final ChromeStreamController<Message> _onMessage =
      new ChromeStreamController<Message>.oneArg(_pushMessaging['onMessage'], _createMessage);
}

class Message extends ChromeObject {
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
  ChannelIdResult({String channelId}) {
    if (channelId != null) this.channelId = channelId;
  }

  ChannelIdResult.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get channelId => proxy['channelId'];
  set channelId(String value) => proxy['channelId'] = value;
}

ChannelIdResult _createChannelIdResult(JsObject proxy) => proxy == null ? null : new ChannelIdResult.fromProxy(proxy);
Message _createMessage(JsObject proxy) => proxy == null ? null : new Message.fromProxy(proxy);
