library test_windows;

import 'dart:async';
import 'dart:html' as html;

import 'package:unittest/unittest.dart';

import 'package:chrome_gen/chrome_ext.dart' as chrome;

void main() {
  group('chrome.windows', () {
    chrome.Window window;
    setUp(() {
      chrome.WindowsCreateParams windowCreateParams =
          new chrome.WindowsCreateParams(focused: true, type: "normal");
      return chrome.windows.create(windowCreateParams)
        .then((_window) => window = _window);
    });

    tearDown(() {
      Future closeFuture = chrome.windows.remove(window.id);
      window = null;
      return closeFuture;
    });

    test('getters', () {
      expect(window.id, new isInstanceOf<int>());
      // TODO(DrMarcII): Figure out why the focused status of the window is
      //                 not true as expected
      //expect(window.focused, isFalse);
      expect(window.top, isNonNegative);
      expect(window.left, isNonNegative);
      expect(window.width, isPositive);
      expect(window.height, isPositive);
      expect(window.tabs, hasLength(1));
      expect(window.tabs.first, new isInstanceOf<chrome.Tab>());
      expect(window.incognito, isFalse);
      expect(window.type, "normal");
      expect(window.state, "normal");
      expect(window.alwaysOnTop, isFalse);
    });
  });
}
