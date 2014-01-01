library harness_extension;

import 'dart:async';
import 'dart:html' as html;

import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/unittest.dart';
import 'package:logging/logging.dart';

import 'package:chrome_gen/chrome_ext.dart' as chrome;

import 'src/test_windows.dart' as windows;

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord r) {
    StringBuffer sb = new StringBuffer();
    sb
    ..write(r.time.toString())
    ..write(":")
    ..write(r.loggerName)
    ..write(":")
    ..write(r.level.name)
    ..write(":")
    ..write(r.sequenceNumber)
    ..write(": ")
    ..write(r.message.toString());
    logMessage(sb.toString());
  });

  groupSep = '.';
  useHtmlEnhancedConfiguration();

  html.window.onKeyUp.listen((html.KeyboardEvent event) {
    if (event.keyCode == html.KeyCode.R) {
      chrome.runtime.reload();
    }
  });

  windows.main();

  Logger.root.info("leaving main");
}
