/* This file has been generated from alarms.idl - do not edit */

library chrome.alarms;

import '../src/common.dart';

/// Accessor for the `chrome.alarms` namespace.
final ChromeAlarms alarms = new ChromeAlarms._();

class ChromeAlarms {
  static final JsObject _alarms = context['chrome']['alarms'];

  ChromeAlarms._();

  void create(AlarmCreateInfo alarmInfo, [String name]) {
    _alarms.callMethod('create', [name, alarmInfo]);
  }

  Future<Alarm> get([String name]) {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Alarm.create);
    _alarms.callMethod('get', [name, completer.callback]);
    return completer.future;
  }

  Future<Alarm> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Alarm.create);
    _alarms.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  void clear([String name]) {
    _alarms.callMethod('clear', [name]);
  }

  void clearAll() {
    _alarms.callMethod('clearAll');
  }

  Stream<Alarm> get onAlarm => _onAlarm.stream;

  final ChromeStreamController<Alarm> _onAlarm =
      new ChromeStreamController<Alarm>.oneArg(_alarms['onAlarm'], Alarm.create);
}

class Alarm extends ChromeObject {
  static Alarm create(JsObject proxy) => proxy == null ? null : new Alarm.fromProxy(proxy);

  Alarm({String name, double scheduledTime, double periodInMinutes}) {
    if (name != null) this.name = name;
    if (scheduledTime != null) this.scheduledTime = scheduledTime;
    if (periodInMinutes != null) this.periodInMinutes = periodInMinutes;
  }

  Alarm.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  double get scheduledTime => proxy['scheduledTime'];
  set scheduledTime(double value) => proxy['scheduledTime'] = value;

  double get periodInMinutes => proxy['periodInMinutes'];
  set periodInMinutes(double value) => proxy['periodInMinutes'] = value;
}

class AlarmCreateInfo extends ChromeObject {
  static AlarmCreateInfo create(JsObject proxy) => proxy == null ? null : new AlarmCreateInfo.fromProxy(proxy);

  AlarmCreateInfo({double when, double delayInMinutes, double periodInMinutes}) {
    if (when != null) this.when = when;
    if (delayInMinutes != null) this.delayInMinutes = delayInMinutes;
    if (periodInMinutes != null) this.periodInMinutes = periodInMinutes;
  }

  AlarmCreateInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  double get when => proxy['when'];
  set when(double value) => proxy['when'] = value;

  double get delayInMinutes => proxy['delayInMinutes'];
  set delayInMinutes(double value) => proxy['delayInMinutes'] = value;

  double get periodInMinutes => proxy['periodInMinutes'];
  set periodInMinutes(double value) => proxy['periodInMinutes'] = value;
}
