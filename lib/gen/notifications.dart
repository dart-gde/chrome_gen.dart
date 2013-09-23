/* This file has been generated from notifications.idl - do not edit */

/**
 * 
 */
library chrome.notifications;

import '../src/common.dart';

/// Accessor for the `chrome.notifications` namespace.
final ChromeNotifications notifications = new ChromeNotifications._();

class ChromeNotifications {
  static final JsObject _notifications = context['chrome']['notifications'];

  ChromeNotifications._();

  Future create(String notificationId, NotificationOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _notifications.callMethod('create', [notificationId, options, completer.callback]);
    return completer.future;
  }

  Future update(String notificationId, NotificationOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _notifications.callMethod('update', [notificationId, options, completer.callback]);
    return completer.future;
  }

  Future clear(String notificationId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _notifications.callMethod('clear', [notificationId, completer.callback]);
    return completer.future;
  }

  Future getAll() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _notifications.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  Stream<dynamic> get onClosed => _onClosed.stream;

  final ChromeStreamController<dynamic> _onClosed =
      new ChromeStreamController<dynamic>.oneArg(_notifications['onClosed'], selfConverter);

  Stream<String> get onClicked => _onClicked.stream;

  final ChromeStreamController<String> _onClicked =
      new ChromeStreamController<String>.oneArg(_notifications['onClicked'], selfConverter);

  Stream<dynamic> get onButtonClicked => _onButtonClicked.stream;

  final ChromeStreamController<dynamic> _onButtonClicked =
      new ChromeStreamController<dynamic>.oneArg(_notifications['onButtonClicked'], selfConverter);
}

class NotificationItem extends ChromeObject {
  static NotificationItem create(JsObject proxy) => new NotificationItem(proxy);

  NotificationItem(JsObject proxy): super(proxy);
}

class NotificationBitmap extends ChromeObject {
  static NotificationBitmap create(JsObject proxy) => new NotificationBitmap(proxy);

  NotificationBitmap(JsObject proxy): super(proxy);
}

class NotificationButton extends ChromeObject {
  static NotificationButton create(JsObject proxy) => new NotificationButton(proxy);

  NotificationButton(JsObject proxy): super(proxy);
}

class NotificationOptions extends ChromeObject {
  static NotificationOptions create(JsObject proxy) => new NotificationOptions(proxy);

  NotificationOptions(JsObject proxy): super(proxy);
}
