library test_app;

import 'dart:async';
import 'dart:html' as html;

import 'package:unittest/unittest.dart';

import 'package:chrome_gen/chrome_app.dart' as chrome;

const String _TEST_WINDOW_URL = 'test_window.html';

void main() {
  final windows = <chrome.AppWindow>[];

//  Future createWindow(function) {
//    Completer completer = new Completer();
//    Duration duration = new Duration(seconds: 3);
//    Timer timer = new Timer(duration, () {
//      function().then(expectAsync1((v) => completer.complete(v)));
//    });
//    return completer.future;
//  };

  group('chrome.app.window', () {
    tearDown(() {
//      return Future
//          .forEach(windows, (chrome.AppWindow win) {
//            win.close();
//            return win.onClosed.first.then((_) =>
//                new Future(() => win.dispose()));
//          })
//          .then((_) => windows.clear());
    });

    test('Test that a call to get the current window succeeds', () {
      final chrome.AppWindow win = chrome.app.window.current();
      expect(win.isMaximized(), isFalse);
      expect(win.isMinimized(), isFalse);
      expect(win.isFullscreen(), isFalse);
    });
  });
}
