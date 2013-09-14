// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from tts.json - do not edit */

/**
 * Use the `chrome.tts` API to play synthesized text-to-speech (TTS). See also
 * the related
 * [ttsEngine](http://developer.chrome.com/extensions/ttsEngine.html) API, which
 * allows an extension to implement a speech engine.
 */
library chrome.tts;

import '../src/common.dart';

/// Accessor for the `chrome.tts` namespace.
final ChromeTts tts = new ChromeTts._();

class ChromeTts {
  JsObject _tts;

  ChromeTts._() {
    _tts = context['chrome']['tts'];
  }

  /**
   * Speaks text using a text-to-speech engine.
   * 
   * [utterance] The text to speak, either plain text or a complete, well-formed
   * SSML document. Speech engines that do not support SSML will strip away the
   * tags and speak the text. The maximum length of the text is 32,768
   * characters.
   * 
   * [options] The speech options.
   * 
   * [callback] Called right away, before speech finishes. Check
   * chrome.runtime.lastError to make sure there were no errors. Use
   * options.onEvent to get more detailed feedback.
   */
  Future speak(String utterance, var options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tts.callMethod('speak', [utterance, options, completer.callback]);
    return completer.future;
  }

  /**
   * Stops any current speech and flushes the queue of any pending utterances.
   * In addition, if speech was paused, it will now be un-paused for the next
   * call to speak.
   */
  void stop() {
    _tts.callMethod('stop');
  }

  /**
   * Pauses speech synthesis, potentially in the middle of an utterance. A call
   * to resume or stop will un-pause speech.
   */
  void pause() {
    _tts.callMethod('pause');
  }

  /**
   * If speech was paused, resumes speaking where it left off.
   */
  void resume() {
    _tts.callMethod('resume');
  }

  /**
   * Checks whether the engine is currently speaking. On Mac OS X, the result is
   * true whenever the system speech engine is speaking, even if the speech
   * wasn't initiated by Chrome.
   */
  Future<bool> isSpeaking() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tts.callMethod('isSpeaking', [completer.callback]);
    return completer.future;
  }

  /**
   * Gets an array of all available voices.
   */
  Future<dynamic> getVoices() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _tts.callMethod('getVoices', [completer.callback]);
    return completer.future;
  }

  /**
   * Used to pass events back to the function calling speak().
   */
  Stream get onEvent => _onEvent.stream;

  final ChromeStreamController _onEvent = null;
}
