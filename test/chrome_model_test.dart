
library chrome_model_test;

import 'package:unittest/unittest.dart';

import '../tool/chrome_model.dart';

void main() {
  group('chrome_model.ChromeType', chromeTypeTests);
//  group('chrome_model.ChromeReturnType', chromeReturnTypeTests);
//  group('chrome_model.ChromeProperty', chromePropertyTests);
//  group('chrome_model.ChromeMethod', chromeMethodTests);
//  group('chrome_model.ChromeLibrary', chromeLibraryTests);
//  group('chrome_model.ChromeEvent', chromeEventTests);
//  group('chrome_model.ChromeEnumType', chromeEnumTypeTests);
//  group('chrome_model.ChromeEnumEntry', chromeEnumEntryTests);
//  group('chrome_model.ChromeElement', chromeElementTests);
//  group('chrome_model.ChromeDeclaredType', chromeDeclaredTypeTests);
}

void chromeTypeTests() {
  test('isAny', () {
    ChromeType chromeType = new ChromeType(type: "var",
        refName: "SomeType");
    expect(chromeType.isAny, isTrue);
    expect(chromeType.isReferencedType, isTrue);
    expect(chromeType.toReturnString(), equals("SomeType"));
    expect(chromeType.toString(), equals("SomeType"));

    chromeType = new ChromeType(type: "var");
    expect(chromeType.isAny, isTrue);
    expect(chromeType.isReferencedType, isFalse);
    expect(chromeType.toReturnString(), equals("dynamic"));
    expect(chromeType.toString(), equals("var"));
  });

  test('isString', () {
    ChromeType chromeType = new ChromeType(type: "String");
    expect(chromeType.isString, isTrue);
  });

  test('isList', () {
    ChromeType chromeType = new ChromeType(type: "List");
    expect(chromeType.isString, isFalse);
    expect(chromeType.isList, isTrue);
    expect(chromeType.getReturnStringTypeParams(), equals(""));
    expect(chromeType.toReturnString(), equals("List"));
    expect(chromeType.toString(), equals("List"));
  });

  test('List<SomeType>', () {
    ChromeType chromeTypeList = new ChromeType(type: "List");
    ChromeType chromeTypeSomeType = new ChromeType(type: "var",
        refName: "SomeType");
    chromeTypeList.parameters.add(chromeTypeSomeType);
    expect(chromeTypeList.isString, isFalse);
    expect(chromeTypeList.isList, isTrue);
    expect(chromeTypeList.getReturnStringTypeParams(), equals("<SomeType>"));
    expect(chromeTypeList.toReturnString(), equals("List<SomeType>"));
    expect(chromeTypeList.toString(), equals("List<SomeType>"));
  });

  test('List<SomeType, SomeOtherType>', () {
    ChromeType chromeTypeList = new ChromeType(type: "List");
    ChromeType chromeTypeSomeType = new ChromeType(type: "var",
        refName: "SomeType");
    ChromeType chromeTypeSomeOtherType = new ChromeType(type: "var",
        refName: "SomeOtherType");
    chromeTypeList.parameters.add(chromeTypeSomeType);
    chromeTypeList.parameters.add(chromeTypeSomeOtherType);
    expect(chromeTypeList.isString, isFalse);
    expect(chromeTypeList.isList, isTrue);
    expect(chromeTypeList.getReturnStringTypeParams(),
        equals("<SomeType, SomeOtherType>"));
    expect(chromeTypeList.toReturnString(),
        equals("List<SomeType, SomeOtherType>"));
    expect(chromeTypeList.toString(), equals("List<SomeType, SomeOtherType>"));
  });

}

void chromeReturnTypeTests() {

}

void chromePropertyTests() {

}

void chromeMethodTests() {

}

void chromeLibraryTests() {

}

void chromeEventTests() {

}

void chromeEnumTypeTests() {

}

void chromeEnumEntryTests() {

}

void chromeElementTests() {

}

void chromeDeclaredTypeTests() {

}