/* This file has been generated from tab_capture.idl - do not edit */

library chrome.tabCapture;

import '../src/common.dart';

/// Accessor for the `chrome.tabCapture` namespace.
final ChromeTabCapture tabCapture = ChromeTabCapture._tabCapture == null ? apiNotAvailable('chrome.tabCapture') : new ChromeTabCapture._();

class ChromeTabCapture {
  static final JsObject _tabCapture = chrome['tabCapture'];

  ChromeTabCapture._();

  /**
   * Captures the visible area of the currently active tab. This method can only
   * be used on the currently active page after the extension has been
   * _invoked_, similar to the way that <a href="activeTab.html">activeTab</a>
   * works. Note that Chrome internal pages cannot be captured.
   * [options]: Configures the returned media stream.
   * [callback]: Callback with either the stream returned or null.
   */
  Future<LocalMediaStream> capture(CaptureOptions options) {
    var completer = new ChromeCompleter<LocalMediaStream>.oneArg(_createLocalMediaStream);
    _tabCapture.callMethod('capture', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Returns a list of tabs that have requested capture or are being captured,
   * i.e. status != stopped and status != error. This allows extensions to
   * inform the user that there is an existing tab capture that would prevent a
   * new tab capture from succeeding (or to prevent redundant requests for the
   * same tab).
   */
  Future<CaptureInfo> getCapturedTabs() {
    var completer = new ChromeCompleter<CaptureInfo>.oneArg(_createCaptureInfo);
    _tabCapture.callMethod('getCapturedTabs', [completer.callback]);
    return completer.future;
  }

  Stream<CaptureInfo> get onStatusChanged => _onStatusChanged.stream;

  final ChromeStreamController<CaptureInfo> _onStatusChanged =
      new ChromeStreamController<CaptureInfo>.oneArg(_tabCapture['onStatusChanged'], _createCaptureInfo);
}

/**
 * Copyright (c) 2012 The Chromium Authors. All rights reserved. Use of this
 * source code is governed by a BSD-style license that can be found in the
 * LICENSE file. Use the `chrome.tabCapture` API to interact with tab media
 * streams.
 */
class TabCaptureState extends ChromeEnum {
  static const TabCaptureState PENDING = const TabCaptureState._('pending');
  static const TabCaptureState ACTIVE = const TabCaptureState._('active');
  static const TabCaptureState STOPPED = const TabCaptureState._('stopped');
  static const TabCaptureState ERROR = const TabCaptureState._('error');

  static const List<TabCaptureState> VALUES = const[PENDING, ACTIVE, STOPPED, ERROR];

  const TabCaptureState._(String str): super(str);
}

class CaptureInfo extends ChromeObject {
  CaptureInfo({int tabId, TabCaptureState status, bool fullscreen}) {
    if (tabId != null) this.tabId = tabId;
    if (status != null) this.status = status;
    if (fullscreen != null) this.fullscreen = fullscreen;
  }

  CaptureInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  int get tabId => proxy['tabId'];
  set tabId(int value) => proxy['tabId'] = value;

  TabCaptureState get status => _createTabCaptureState(proxy['status']);
  set status(TabCaptureState value) => proxy['status'] = value;

  bool get fullscreen => proxy['fullscreen'];
  set fullscreen(bool value) => proxy['fullscreen'] = value;
}

class MediaStreamConstraint extends ChromeObject {
  MediaStreamConstraint({var mandatory}) {
    if (mandatory != null) this.mandatory = mandatory;
  }

  MediaStreamConstraint.fromProxy(JsObject proxy): super.fromProxy(proxy);

  dynamic get mandatory => proxy['mandatory'];
  set mandatory(var value) => proxy['mandatory'] = value;
}

class CaptureOptions extends ChromeObject {
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

  MediaStreamConstraint get audioConstraints => _createMediaStreamConstraint(proxy['audioConstraints']);
  set audioConstraints(MediaStreamConstraint value) => proxy['audioConstraints'] = value;

  MediaStreamConstraint get videoConstraints => _createMediaStreamConstraint(proxy['videoConstraints']);
  set videoConstraints(MediaStreamConstraint value) => proxy['videoConstraints'] = value;
}

LocalMediaStream _createLocalMediaStream(JsObject proxy) => proxy == null ? null : new LocalMediaStream.fromProxy(proxy);
CaptureInfo _createCaptureInfo(JsObject proxy) => proxy == null ? null : new CaptureInfo.fromProxy(proxy);
TabCaptureState _createTabCaptureState(String value) => TabCaptureState.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MediaStreamConstraint _createMediaStreamConstraint(JsObject proxy) => proxy == null ? null : new MediaStreamConstraint.fromProxy(proxy);

