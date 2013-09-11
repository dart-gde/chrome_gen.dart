// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from tts_engine.json - do not edit */

/**
 * Use the `chrome.ttsEngine` API to implement a text-to-speech(TTS) engine
 * using an extension. If your extension registers using this API, it will
 * receive events containing an utterance to be spoken and other parameters when
 * any extension or packaged app uses the [tts](tts.html) API to generate
 * speech. Your extension can then use any available web technology to
 * synthesize and output the speech, and send events back to the calling
 * function to report the status.
 */
library chrome.tts_engine;

import '../src/common.dart';

/// Accessor for the `chrome.tts_engine` namespace.
final ChromeTtsEngine tts_engine = new ChromeTtsEngine._();

class ChromeTtsEngine {
  ChromeTtsEngine._();

  /**
   * Routes a TTS event from a speech engine to a client.
   * 
   * [event] The update event from the text-to-speech engine indicating the
   * status of this utterance.
   */
  void sendTtsEvent(int requestId, var event) {
    chrome['tts_engine'].callMethod('sendTtsEvent', [requestId, event]);
  }

  /**
   * Called when the user makes a call to tts.speak() and one of the voices from
   * this extension's manifest is the first to match the options object.
   */
  Stream get onSpeak => null;

  /**
   * Fired when a call is made to tts.stop and this extension may be in the
   * middle of speaking. If an extension receives a call to onStop and speech is
   * already stopped, it should do nothing (not raise an error). If speech is in
   * the paused state, this should cancel the paused state.
   */
  Stream get onStop => null;

  /**
   * Optional: if an engine supports the pause event, it should pause the
   * current utterance being spoken, if any, until it receives a resume event or
   * stop event. Note that a stop event should also clear the paused state.
   */
  Stream get onPause => null;

  /**
   * Optional: if an engine supports the pause event, it should also support the
   * resume event, to continue speaking the current utterance, if any. Note that
   * a stop event should also clear the paused state.
   */
  Stream get onResume => null;
}
