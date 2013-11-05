/* This file has been generated from desktop_capture.json - do not edit */

/**
 * Desktop Capture API that can be used to capture content of screen, individual
 * windows or tabs.
 */
library chrome.desktopCapture;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.desktopCapture` namespace.
 */
final ChromeDesktopCapture desktopCapture = new ChromeDesktopCapture._();

class ChromeDesktopCapture extends ChromeApi {
  static final JsObject _desktopCapture = chrome['desktopCapture'];

  ChromeDesktopCapture._();

  bool get available => _desktopCapture != null;

  /**
   * Shows desktop media picker UI with the specified set of sources.
   * 
   * [sources] Set of sources that should be shown to the user.
   * 
   * [targetTab] Optional tab for which the stream is created. If not specified
   * then the resulting stream can be used only by the calling extension,
   * otherwise the stream can be used only by the specified tab. If the tab's
   * security origin changes before this function returns, the call may fail.
   * 
   * Returns:
   * An opaque string that can be passed to `getUserMedia()` API to generate
   * media stream that corresponds to the source selected by the user. If user
   * didn't select any source (i.e. canceled the prompt) then the callback is
   * called with an empty `streamId`
   */
  Future<String> chooseDesktopMedia(List<DesktopCaptureSourceType> sources, [Tab targetTab]) {
    if (_desktopCapture == null) _throwNotAvailable();

    var completer = new ChromeCompleter<String>.oneArg();
    _desktopCapture.callMethod('chooseDesktopMedia', [jsify(sources), jsify(targetTab), completer.callback]);
    return completer.future;
  }

  /**
   * Hides desktop media picker dialog shown by chooseDesktopMedia().
   * 
   * [desktopMediaRequestId] Id returned by chooseDesktopMedia()
   */
  void cancelChooseDesktopMedia(int desktopMediaRequestId) {
    if (_desktopCapture == null) _throwNotAvailable();

    _desktopCapture.callMethod('cancelChooseDesktopMedia', [desktopMediaRequestId]);
  }

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.desktopCapture' is not available");
  }
}

/**
 * Enum used to define set of desktop media sources used in
 * chooseDesktopMedia().
 * enum of `screen`, `window`, `tab`
 */
class DesktopCaptureSourceType extends ChromeObject {
  DesktopCaptureSourceType();
  DesktopCaptureSourceType.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);
}
