// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
