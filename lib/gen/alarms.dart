/* This file has been generated from alarms.idl - do not edit */

library chrome.alarms;

import '../src/common.dart';

/// Accessor for the `chrome.alarms` namespace.
final ChromeAlarms alarms = ChromeAlarms._alarms == null ? apiNotAvailable('chrome.alarms') : new ChromeAlarms._();

class ChromeAlarms {
  static final JsObject _alarms = chrome['alarms'];

  ChromeAlarms._();

  /**
   * Creates an alarm. Near the time(s) specified by [alarmInfo], the `onAlarm`
   * event is fired. If there is another alarm with the same name (or no name if
   * none is specified), it will be cancelled and replaced by this alarm.
   * 
   * In order to reduce the load on the user's machine, Chrome limits alarms to
   * at most once every 1 minute but may delay them an arbitrary amount more.
   * That is, setting `delayInMinutes` or `periodInMinutes` to less than `1`
   * will not be honored and will cause a warning. `when` can be set to less
   * than 1 minute after "now" without warning but won't actually cause the
   * alarm to fire for at least 1 minute.
   * 
   * To help you debug your app or extension, when you've loaded it unpacked,
   * there's no limit to how often the alarm can fire.
   * 
   * [name]: Optional name to identify this alarm. Defaults to the empty string.
   * 
   * [alarmInfo]: Describes when the alarm should fire. The initial time must be
   * specified by either [when] or [delayInMinutes] (but not both). If
   * [periodInMinutes] is set, the alarm will repeat every [periodInMinutes]
   * minutes after the initial event. If neither [when] or [delayInMinutes] is
   * set for a repeating alarm, [periodInMinutes] is used as the default for
   * [delayInMinutes].
   */
  void create(AlarmCreateInfo alarmInfo, [String name]) {
    _alarms.callMethod('create', [name, alarmInfo]);
  }

  /**
   * Retrieves details about the specified alarm.
   * [name]: The name of the alarm to get. Defaults to the empty string.
   */
  Future<Alarm> get([String name]) {
    var completer = new ChromeCompleter<Alarm>.oneArg(_createAlarm);
    _alarms.callMethod('get', [name, completer.callback]);
    return completer.future;
  }

  /**
   * Gets an array of all the alarms.
   */
  Future<Alarm> getAll() {
    var completer = new ChromeCompleter<Alarm>.oneArg(_createAlarm);
    _alarms.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears the alarm with the given name.
   * [name]: The name of the alarm to clear. Defaults to the empty string.
   */
  void clear([String name]) {
    _alarms.callMethod('clear', [name]);
  }

  /**
   * Clears all alarms.
   */
  void clearAll() {
    _alarms.callMethod('clearAll');
  }

  Stream<Alarm> get onAlarm => _onAlarm.stream;

  final ChromeStreamController<Alarm> _onAlarm =
      new ChromeStreamController<Alarm>.oneArg(_alarms['onAlarm'], _createAlarm);
}

class Alarm extends ChromeObject {
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

Alarm _createAlarm(JsObject proxy) => proxy == null ? null : new Alarm.fromProxy(proxy);

