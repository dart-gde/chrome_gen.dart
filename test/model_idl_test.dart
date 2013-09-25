
library model_idl_test;

import 'dart:io';

import 'package:unittest/unittest.dart';

import '../tool/web_idl_parser.dart';
import '../tool/model_idl.dart' as model_idl;

void modelIdlParseTests() {
  // Define a test for each .json file in idl/
  File testFile = new File('idl/alarms.idl');

  // The unittest script likes to be run with the cwd set to the project root.
  if (testFile.existsSync()) {
    Iterable<File> idlFiles = new Directory('idl')
    .listSync(recursive: true, followLinks: false)
      .where((f) => f.path.endsWith('.idl'));

    for (File file in idlFiles) {
      // skip '_*.idl' idl files
      if (!file.path.contains('/_')) {
        test(file.path, () {
          WebIdlParser webIdlParser =
              new WebIdlParser.withCollector(new model_idl.IDLCollectorChrome());
          webIdlParser.start.parse(file.readAsStringSync());
          expect(webIdlParser.collector.idlNamespace.name, isNotNull);
        });
      }
    }
  }
}

/**
 * Test creating the IDL model from `alarm.idl`.
 */
void modelIdlParseTestTypes() {
  test('test alarms.idl', () {
    File testFile = new File('idl/alarms.idl');
    WebIdlParser webIdlParser =
        new WebIdlParser.withCollector(new model_idl.IDLCollectorChrome());
    webIdlParser.start.parse(testFile.readAsStringSync());
    model_idl.IDLNamespace idlNamespace = webIdlParser.collector.idlNamespace;
    expect(idlNamespace.name, isNotNull);
    expect(idlNamespace.name, "alarms");

    // Test Class
    // `dictionary Alarm`
    expect(idlNamespace.declaredTypes.length, 2);
    model_idl.IDLDeclaredType alarmType =
        idlNamespace.declaredTypes.singleWhere((e) => e.name == "Alarm");
    expect(alarmType.members.length, 3);
    expect(alarmType.members.firstWhere(
        (model_idl.IDLProperty e) => e.name == "name"), isNotNull);
    expect(alarmType.members.firstWhere(
        (model_idl.IDLProperty e) => e.name == "scheduledTime"), isNotNull);
    expect(alarmType.members.firstWhere(
        (model_idl.IDLProperty e) => e.name == "periodInMinutes"), isNotNull);

    // Test Class
    // `dictionary AlarmCreateInfo`
    model_idl.IDLDeclaredType alarmCreateInfoType =
        idlNamespace.declaredTypes.singleWhere(
            (e) => e.name == "AlarmCreateInfo");
    expect(alarmCreateInfoType.members.length, 3);
    expect(alarmCreateInfoType.members.firstWhere(
        (model_idl.IDLProperty e) => e.name == "when"), isNotNull);
    expect(alarmCreateInfoType.members.firstWhere(
        (model_idl.IDLProperty e) => e.name == "delayInMinutes"), isNotNull);
    expect(alarmCreateInfoType.members.firstWhere(
        (model_idl.IDLProperty e) => e.name == "periodInMinutes"), isNotNull);

    expect(idlNamespace.functions.length, 5);

    // Testing Function
    // `static void create(optional DOMString name, AlarmCreateInfo alarmInfo);`
    model_idl.IDLFunction createIdlFunction = idlNamespace.functions.firstWhere(
        (model_idl.IDLFunction e) => e.name == "create");
    expect(createIdlFunction, isNotNull);
    expect(createIdlFunction.returns, false);
    // TODO: should return void
    // expect(createIdlFunction.returnType, isNotNull);
    // TODO: need to ensure that methods functions assign callbacks.
    //expect(createIdlFunction.usesCallback, true);
    List<model_idl.IDLParameter> createIDLParameters
    = createIdlFunction.parameters;
    expect(createIDLParameters.length, 2);

    model_idl.IDLParameter createParameterName = createIDLParameters
    .singleWhere((model_idl.IDLParameter e) => e.name  == "name");
    expect(createParameterName, isNotNull);
    expect(createParameterName.optional, isTrue);
    expect(createParameterName.type.name, "DOMString");

    model_idl.IDLParameter createParameterCallback = createIDLParameters
    .singleWhere((model_idl.IDLParameter e) => e.name  == "alarmInfo");
    expect(createParameterCallback, isNotNull);
    expect(createParameterCallback.optional, isFalse);
    expect(createParameterCallback.type.name, "AlarmCreateInfo");

    // Testing Function
    // `static void get(optional DOMString name, AlarmCallback callback);`
    model_idl.IDLFunction getIdlFunction = idlNamespace.functions.firstWhere(
        (model_idl.IDLFunction e) => e.name == "get");
    expect(getIdlFunction, isNotNull);
    expect(getIdlFunction.returns, false);
    // TODO: adjust when callback types are fixed.
//    expect(getIdlFunction.returnType, isNotNull);
//    expect(getIdlFunction.usesCallback, isNotNull);
    List<model_idl.IDLParameter> getIDLParameters
    = getIdlFunction.parameters;
    expect(getIDLParameters.length, 2);

    model_idl.IDLParameter getParameterName = getIDLParameters
    .singleWhere((model_idl.IDLParameter e) => e.name  == "name");
    expect(getParameterName, isNotNull);
    expect(getParameterName.optional, isTrue);
    expect(getParameterName.type.name, "DOMString");

    // This might change once we know how to handle the callback parameters.
    model_idl.IDLParameter getParameterCallback = getIDLParameters
    .singleWhere((model_idl.IDLParameter e) => e.name  == "callback");
    expect(getParameterCallback, isNotNull);
    expect(getParameterCallback.optional, isFalse);
    expect(getParameterCallback.type.name, "AlarmCallback");
    // TODO: This should be true.
    // expect(createParameterCallback.isCallback, true);

    // Testing Function
    // `static void getAll(AlarmListCallback callback);`
    model_idl.IDLFunction getAllIdlFunction = idlNamespace.functions.firstWhere(
        (model_idl.IDLFunction e) => e.name == "getAll");
    expect(getAllIdlFunction, isNotNull);
    expect(getAllIdlFunction.returns, false);
    expect(getAllIdlFunction.parameters.length, 1);
    List<model_idl.IDLParameter> getAllIDLParameters
    = getAllIdlFunction.parameters;
    expect(getAllIDLParameters.length, 1);
    model_idl.IDLParameter getAllParameterCallback = getAllIDLParameters
    .singleWhere((model_idl.IDLParameter e) => e.name  == "callback");
    expect(getAllParameterCallback, isNotNull);
    expect(getAllParameterCallback.optional, isFalse);
    expect(getAllParameterCallback.type.name, "AlarmListCallback");

    // Testing Function
    // `static void clear(optional DOMString name);`
    model_idl.IDLFunction clearIdlFunction = idlNamespace.functions.firstWhere(
        (model_idl.IDLFunction e) => e.name == "clear");
    expect(clearIdlFunction, isNotNull);
    expect(clearIdlFunction.returns, false);
    expect(clearIdlFunction.parameters.length, 1);
    List<model_idl.IDLParameter> clearIDLParameters
    = clearIdlFunction.parameters;
    expect(clearIDLParameters.length, 1);
    model_idl.IDLParameter clearParameterName = clearIDLParameters
    .singleWhere((model_idl.IDLParameter e) => e.name  == "name");
    expect(clearParameterName, isNotNull);
    expect(clearParameterName.optional, isTrue);
    expect(clearParameterName.type.name, "DOMString");

    // Testing Function
    // `static void clearAll();`
    model_idl.IDLFunction clearAllIdlFunction = idlNamespace.functions.firstWhere(
        (model_idl.IDLFunction e) => e.name == "clearAll");
    expect(clearAllIdlFunction, isNotNull);
    expect(clearAllIdlFunction.returns, false);
    expect(clearAllIdlFunction.parameters.length, 0);

    expect(idlNamespace.events.length, 1);

    // Testing Event
    // `static void onAlarm(Alarm alarm);`
    model_idl.IDLEvent onAlarmEvent =
        idlNamespace.events.firstWhere(
            (model_idl.IDLEvent e) => e.name == "onAlarm");
    expect(onAlarmEvent, isNotNull);
    expect(onAlarmEvent.params, isNotNull);
    List<model_idl.IDLParameter> onAlarmEventParameters = onAlarmEvent.params;
    expect(onAlarmEventParameters.length, 1);
    expect(onAlarmEventParameters[0].name, "alarm");
    expect(onAlarmEventParameters[0].type.name, "Alarm");
  });
}

void modelIdlParseEnumTest() {
  test('test enum usb.dart', () {
    File testFile = new File('idl/usb.idl');
    WebIdlParser webIdlParser =
        new WebIdlParser.withCollector(new model_idl.IDLCollectorChrome());
    webIdlParser.start.parse(testFile.readAsStringSync());
    model_idl.IDLNamespace idlNamespace = webIdlParser.collector.idlNamespace;
    expect(idlNamespace.name, isNotNull);
    expect(idlNamespace.name, "usb");
    expect(idlNamespace.enumTypes.length, 6);
  });
}

void main() {
  group('model_idl.IDLCollectorChrome parse', modelIdlParseTests);
  group('model_idl', modelIdlParseTestTypes);
  group('model_idl', modelIdlParseEnumTest);
}