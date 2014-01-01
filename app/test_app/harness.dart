library harness_app;

import 'dart:async';
import 'dart:html' as html;

import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/unittest.dart';
import 'package:logging/logging.dart';

import 'package:chrome_gen/chrome_app.dart' as chrome;

import 'src/test_app.dart' as app;

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord r) => r.toString());

  groupSep = '.';
  useHtmlEnhancedConfiguration();

  html.window.onKeyUp.listen((html.KeyboardEvent event) {
    if (event.keyCode == html.KeyCode.R) {
      chrome.runtime.reload();
    }
  });

  app.main();

}
