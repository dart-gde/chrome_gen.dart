/* This file has been generated from desktop_capture.idl - do not edit */

library chrome.desktopCapture;

import '../src/common.dart';

/// Accessor for the `chrome.desktopCapture` namespace.
final ChromeDesktopCapture desktopCapture = new ChromeDesktopCapture._();

class ChromeDesktopCapture {
  static final JsObject _desktopCapture = context['chrome']['desktopCapture'];

  ChromeDesktopCapture._();

  Future<String> chooseDesktopMedia(DesktopCaptureSourceType sources, [String origin]) {
    var completer = new ChromeCompleter<String>.oneArg();
    _desktopCapture.callMethod('chooseDesktopMedia', [sources, origin, completer.callback]);
    return completer.future;
  }
}

class DesktopCaptureSourceType extends ChromeEnum {
  static const DesktopCaptureSourceType SCREEN = const DesktopCaptureSourceType._('screen');
  static const DesktopCaptureSourceType WINDOW = const DesktopCaptureSourceType._('window');
  static const DesktopCaptureSourceType TAB = const DesktopCaptureSourceType._('tab');

  static const List<DesktopCaptureSourceType> VALUES = const[SCREEN, WINDOW, TAB];

  const DesktopCaptureSourceType._(String str): super(str);
}
