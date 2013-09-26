/* This file has been generated from notifications.idl - do not edit */

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

  Stream<OnClosedEvent> get onClosed => _onClosed.stream;

  final ChromeStreamController<OnClosedEvent> _onClosed =
      new ChromeStreamController<OnClosedEvent>.twoArgs(_notifications['onClosed'], OnClosedEvent.create);

  Stream<String> get onClicked => _onClicked.stream;

  final ChromeStreamController<String> _onClicked =
      new ChromeStreamController<String>.oneArg(_notifications['onClicked'], selfConverter);

  Stream<OnButtonClickedEvent> get onButtonClicked => _onButtonClicked.stream;

  final ChromeStreamController<OnButtonClickedEvent> _onButtonClicked =
      new ChromeStreamController<OnButtonClickedEvent>.twoArgs(_notifications['onButtonClicked'], OnButtonClickedEvent.create);
}

class OnClosedEvent {
  static OnClosedEvent create(String notificationId, bool byUser) =>
      new OnClosedEvent(notificationId, byUser);

  String notificationId;

  bool byUser;

  OnClosedEvent(this.notificationId, this.byUser);
}

class OnButtonClickedEvent {
  static OnButtonClickedEvent create(String notificationId, int buttonIndex) =>
      new OnButtonClickedEvent(notificationId, buttonIndex);

  String notificationId;

  int buttonIndex;

  OnButtonClickedEvent(this.notificationId, this.buttonIndex);
}

class TemplateType extends ChromeEnum {
  static const TemplateType BASIC = const TemplateType._('basic');

  static List<TemplateType> _values = [BASIC];

  static List<TemplateType> get values => _values;

  static TemplateType create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const TemplateType._(String str): super(str);
}

class NotificationItem extends ChromeObject {
  static NotificationItem create(JsObject proxy) => proxy == null ? null : new NotificationItem(proxy);

  NotificationItem(JsObject proxy): super(proxy);
}

class NotificationBitmap extends ChromeObject {
  static NotificationBitmap create(JsObject proxy) => proxy == null ? null : new NotificationBitmap(proxy);

  NotificationBitmap(JsObject proxy): super(proxy);
}

class NotificationButton extends ChromeObject {
  static NotificationButton create(JsObject proxy) => proxy == null ? null : new NotificationButton(proxy);

  NotificationButton(JsObject proxy): super(proxy);
}

class NotificationOptions extends ChromeObject {
  static NotificationOptions create(JsObject proxy) => proxy == null ? null : new NotificationOptions(proxy);

  NotificationOptions(JsObject proxy): super(proxy);
}
