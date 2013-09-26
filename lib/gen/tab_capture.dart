/* This file has been generated from tab_capture.idl - do not edit */

library chrome.tabCapture;

import '../src/common.dart';

/// Accessor for the `chrome.tabCapture` namespace.
final ChromeTabCapture tabCapture = new ChromeTabCapture._();

class ChromeTabCapture {
  static final JsObject _tabCapture = context['chrome']['tabCapture'];

  ChromeTabCapture._();

  Future capture(CaptureOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabCapture.callMethod('capture', [options, completer.callback]);
    return completer.future;
  }

  Future getCapturedTabs() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tabCapture.callMethod('getCapturedTabs', [completer.callback]);
    return completer.future;
  }

  Stream<CaptureInfo> get onStatusChanged => _onStatusChanged.stream;

  final ChromeStreamController<CaptureInfo> _onStatusChanged =
      new ChromeStreamController<CaptureInfo>.oneArg(_tabCapture['onStatusChanged'], selfConverter);
}

class TabCaptureState extends ChromeEnum {
  static const TabCaptureState PENDING = const TabCaptureState._('pending');

  static List<TabCaptureState> _values = [PENDING];

  static List<TabCaptureState> get values => _values;

  static TabCaptureState create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const TabCaptureState._(String str): super(str);
}

class CaptureInfo extends ChromeObject {
  static CaptureInfo create(JsObject proxy) => proxy == null ? null : new CaptureInfo(proxy);

  CaptureInfo(JsObject proxy): super(proxy);
}

class MediaStreamConstraint extends ChromeObject {
  static MediaStreamConstraint create(JsObject proxy) => proxy == null ? null : new MediaStreamConstraint(proxy);

  MediaStreamConstraint(JsObject proxy): super(proxy);
}

class CaptureOptions extends ChromeObject {
  static CaptureOptions create(JsObject proxy) => proxy == null ? null : new CaptureOptions(proxy);

  CaptureOptions(JsObject proxy): super(proxy);
}
