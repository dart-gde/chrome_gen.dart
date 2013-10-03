/* This file has been generated from notifications.idl - do not edit */

library chrome.notifications;

import '../src/common.dart';

/// Accessor for the `chrome.notifications` namespace.
final ChromeNotifications notifications = new ChromeNotifications._();

class ChromeNotifications {
  static final JsObject _notifications = context['chrome']['notifications'];

  ChromeNotifications._();

  Future<String> create(String notificationId, NotificationOptions options) {
    var completer = new ChromeCompleter<String>.oneArg();
    _notifications.callMethod('create', [notificationId, options, completer.callback]);
    return completer.future;
  }

  Future<bool> update(String notificationId, NotificationOptions options) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _notifications.callMethod('update', [notificationId, options, completer.callback]);
    return completer.future;
  }

  Future<bool> clear(String notificationId) {
    var completer = new ChromeCompleter<bool>.oneArg();
    _notifications.callMethod('clear', [notificationId, completer.callback]);
    return completer.future;
  }

  Future<dynamic> getAll() {
    var completer = new ChromeCompleter<dynamic>.oneArg();
    _notifications.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  Stream<OnClosedEvent> get onClosed => _onClosed.stream;

  final ChromeStreamController<OnClosedEvent> _onClosed =
      new ChromeStreamController<OnClosedEvent>.twoArgs(_notifications['onClosed'], _createOnClosedEvent);

  Stream<String> get onClicked => _onClicked.stream;

  final ChromeStreamController<String> _onClicked =
      new ChromeStreamController<String>.oneArg(_notifications['onClicked'], selfConverter);

  Stream<OnButtonClickedEvent> get onButtonClicked => _onButtonClicked.stream;

  final ChromeStreamController<OnButtonClickedEvent> _onButtonClicked =
      new ChromeStreamController<OnButtonClickedEvent>.twoArgs(_notifications['onButtonClicked'], _createOnButtonClickedEvent);
}

class OnClosedEvent {

  final String notificationId;

  final bool byUser;

  OnClosedEvent(this.notificationId, this.byUser);
}

class OnButtonClickedEvent {

  final String notificationId;

  final int buttonIndex;

  OnButtonClickedEvent(this.notificationId, this.buttonIndex);
}

class TemplateType extends ChromeEnum {
  static const TemplateType BASIC = const TemplateType._('basic');
  static const TemplateType IMAGE = const TemplateType._('image');
  static const TemplateType LIST = const TemplateType._('list');
  static const TemplateType PROGRESS = const TemplateType._('progress');

  static const List<TemplateType> VALUES = const[BASIC, IMAGE, LIST, PROGRESS];

  const TemplateType._(String str): super(str);
}

class NotificationItem extends ChromeObject {

  NotificationItem({String title, String message}) {
    if (title != null) this.title = title;
    if (message != null) this.message = message;
  }

  NotificationItem.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  String get message => proxy['message'];
  set message(String value) => proxy['message'] = value;
}

class NotificationBitmap extends ChromeObject {

  NotificationBitmap({int width, int height, ArrayBuffer data}) {
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (data != null) this.data = data;
  }

  NotificationBitmap.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get width => proxy['width'];
  set width(int value) => proxy['width'] = value;

  int get height => proxy['height'];
  set height(int value) => proxy['height'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class NotificationButton extends ChromeObject {

  NotificationButton({String title, String iconUrl, NotificationBitmap iconBitmap}) {
    if (title != null) this.title = title;
    if (iconUrl != null) this.iconUrl = iconUrl;
    if (iconBitmap != null) this.iconBitmap = iconBitmap;
  }

  NotificationButton.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  String get iconUrl => proxy['iconUrl'];
  set iconUrl(String value) => proxy['iconUrl'] = value;

  NotificationBitmap get iconBitmap => _createNotificationBitmap(proxy['iconBitmap']);
  set iconBitmap(NotificationBitmap value) => proxy['iconBitmap'] = value;
}

class NotificationOptions extends ChromeObject {

  NotificationOptions({TemplateType type, String iconUrl, NotificationBitmap iconBitmap, String title, String message, String contextMessage, int priority, double eventTime, NotificationButton buttons, String expandedMessage, String imageUrl, NotificationBitmap imageBitmap, NotificationItem items, int progress}) {
    if (type != null) this.type = type;
    if (iconUrl != null) this.iconUrl = iconUrl;
    if (iconBitmap != null) this.iconBitmap = iconBitmap;
    if (title != null) this.title = title;
    if (message != null) this.message = message;
    if (contextMessage != null) this.contextMessage = contextMessage;
    if (priority != null) this.priority = priority;
    if (eventTime != null) this.eventTime = eventTime;
    if (buttons != null) this.buttons = buttons;
    if (expandedMessage != null) this.expandedMessage = expandedMessage;
    if (imageUrl != null) this.imageUrl = imageUrl;
    if (imageBitmap != null) this.imageBitmap = imageBitmap;
    if (items != null) this.items = items;
    if (progress != null) this.progress = progress;
  }

  NotificationOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  TemplateType get type => _createTemplateType(proxy['type']);
  set type(TemplateType value) => proxy['type'] = value;

  String get iconUrl => proxy['iconUrl'];
  set iconUrl(String value) => proxy['iconUrl'] = value;

  NotificationBitmap get iconBitmap => _createNotificationBitmap(proxy['iconBitmap']);
  set iconBitmap(NotificationBitmap value) => proxy['iconBitmap'] = value;

  String get title => proxy['title'];
  set title(String value) => proxy['title'] = value;

  String get message => proxy['message'];
  set message(String value) => proxy['message'] = value;

  String get contextMessage => proxy['contextMessage'];
  set contextMessage(String value) => proxy['contextMessage'] = value;

  int get priority => proxy['priority'];
  set priority(int value) => proxy['priority'] = value;

  double get eventTime => proxy['eventTime'];
  set eventTime(double value) => proxy['eventTime'] = value;

  NotificationButton get buttons => _createNotificationButton(proxy['buttons']);
  set buttons(NotificationButton value) => proxy['buttons'] = value;

  String get expandedMessage => proxy['expandedMessage'];
  set expandedMessage(String value) => proxy['expandedMessage'] = value;

  String get imageUrl => proxy['imageUrl'];
  set imageUrl(String value) => proxy['imageUrl'] = value;

  NotificationBitmap get imageBitmap => _createNotificationBitmap(proxy['imageBitmap']);
  set imageBitmap(NotificationBitmap value) => proxy['imageBitmap'] = value;

  NotificationItem get items => _createNotificationItem(proxy['items']);
  set items(NotificationItem value) => proxy['items'] = value;

  int get progress => proxy['progress'];
  set progress(int value) => proxy['progress'] = value;
}

OnClosedEvent _createOnClosedEvent(String notificationId, bool byUser) =>
    new OnClosedEvent(notificationId, byUser);
OnButtonClickedEvent _createOnButtonClickedEvent(String notificationId, int buttonIndex) =>
    new OnButtonClickedEvent(notificationId, buttonIndex);
ArrayBuffer _createArrayBuffer(JsObject proxy) => proxy == null ? null : new ArrayBuffer.fromProxy(proxy);
NotificationBitmap _createNotificationBitmap(JsObject proxy) => proxy == null ? null : new NotificationBitmap.fromProxy(proxy);
TemplateType _createTemplateType(String value) => TemplateType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
NotificationButton _createNotificationButton(JsObject proxy) => proxy == null ? null : new NotificationButton.fromProxy(proxy);
NotificationItem _createNotificationItem(JsObject proxy) => proxy == null ? null : new NotificationItem.fromProxy(proxy);
