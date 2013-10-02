/* This file has been generated from tab_capture.idl - do not edit */

library chrome.tabCapture;

import '../src/common.dart';

/// Accessor for the `chrome.tabCapture` namespace.
final ChromeTabCapture tabCapture = new ChromeTabCapture._();

class ChromeTabCapture {
  static final JsObject _tabCapture = context['chrome']['tabCapture'];

  ChromeTabCapture._();

  Future<dynamic> capture(CaptureOptions options) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tabCapture.callMethod('capture', [options, completer.callback]);
    return completer.future;
  }

  Future<CaptureInfo> getCapturedTabs() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(CaptureInfo.create);
    _tabCapture.callMethod('getCapturedTabs', [completer.callback]);
    return completer.future;
  }

  Stream<CaptureInfo> get onStatusChanged => _onStatusChanged.stream;

  final ChromeStreamController<CaptureInfo> _onStatusChanged =
      new ChromeStreamController<CaptureInfo>.oneArg(_tabCapture['onStatusChanged'], CaptureInfo.create);
}

class TabCaptureState extends ChromeEnum {
  static const TabCaptureState PENDING = const TabCaptureState._('pending');
  static const TabCaptureState ACTIVE = const TabCaptureState._('active');
  static const TabCaptureState STOPPED = const TabCaptureState._('stopped');
  static const TabCaptureState ERROR = const TabCaptureState._('error');

  static const List<TabCaptureState> VALUES = const[PENDING, ACTIVE, STOPPED, ERROR];

  static TabCaptureState create(String str) =>
      VALUES.singleWhere((ChromeEnum e) => e.value == str);

  const TabCaptureState._(String str): super(str);
}

class CaptureInfo extends ChromeObject {
  static CaptureInfo create(JsObject proxy) => proxy == null ? null : new CaptureInfo.fromProxy(proxy);

  CaptureInfo({int tabId, TabCaptureState status, bool fullscreen}) {
    if (tabId != null) this.tabId = tabId;
    if (status != null) this.status = status;
    if (fullscreen != null) this.fullscreen = fullscreen;
  }

  CaptureInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get tabId => proxy['tabId'];
  set tabId(int value) => proxy['tabId'] = value;

  TabCaptureState get status => TabCaptureState.create(proxy['status']);
  set status(TabCaptureState value) => proxy['status'] = value;

  bool get fullscreen => proxy['fullscreen'];
  set fullscreen(bool value) => proxy['fullscreen'] = value;
}

class MediaStreamConstraint extends ChromeObject {
  static MediaStreamConstraint create(JsObject proxy) => proxy == null ? null : new MediaStreamConstraint.fromProxy(proxy);

  MediaStreamConstraint({var mandatory}) {
    if (mandatory != null) this.mandatory = mandatory;
  }

  MediaStreamConstraint.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get mandatory => proxy['mandatory'];
  set mandatory(var value) => proxy['mandatory'] = value;
}

class CaptureOptions extends ChromeObject {
  static CaptureOptions create(JsObject proxy) => proxy == null ? null : new CaptureOptions.fromProxy(proxy);

  CaptureOptions({bool audio, bool video, MediaStreamConstraint audioConstraints, MediaStreamConstraint videoConstraints}) {
    if (audio != null) this.audio = audio;
    if (video != null) this.video = video;
    if (audioConstraints != null) this.audioConstraints = audioConstraints;
    if (videoConstraints != null) this.videoConstraints = videoConstraints;
  }

  CaptureOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  bool get audio => proxy['audio'];
  set audio(bool value) => proxy['audio'] = value;

  bool get video => proxy['video'];
  set video(bool value) => proxy['video'] = value;

  MediaStreamConstraint get audioConstraints => MediaStreamConstraint.create(proxy['audioConstraints']);
  set audioConstraints(MediaStreamConstraint value) => proxy['audioConstraints'] = value;

  MediaStreamConstraint get videoConstraints => MediaStreamConstraint.create(proxy['videoConstraints']);
  set videoConstraints(MediaStreamConstraint value) => proxy['videoConstraints'] = value;
}
