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
   */
  Future speak(String utterance, [Map options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _tts.callMethod('speak', [utterance, jsify(options), completer.callback]);
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
   * 
   * Returns:
   * True if speaking, false otherwise.
   */
  Future<bool> isSpeaking() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tts.callMethod('isSpeaking', [completer.callback]);
    return completer.future;
  }

  /**
   * Gets an array of all available voices.
   * 
   * Returns:
   * Array of [TtsVoice] objects representing the available voices for speech
   * synthesis.
   */
  Future<List<TtsVoice>> getVoices() {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _tts.callMethod('getVoices', [completer.callback]);
    return completer.future;
  }

  /**
   * Used to pass events back to the function calling speak().
   */
  Stream<dynamic> get onEvent => _onEvent.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onEvent = null;
}

/**
 * An event from the TTS engine to communicate the status of an utterance.
 */
class TtsEvent extends ChromeObject {
  static TtsEvent create(JsObject proxy) => new TtsEvent(proxy);

  TtsEvent(JsObject proxy): super(proxy);

  /**
   * The type can be 'start' as soon as speech has started, 'word' when a word
   * boundary is reached, 'sentence' when a sentence boundary is reached,
   * 'marker' when an SSML mark element is reached, 'end' when the end of the
   * utterance is reached, 'interrupted' when the utterance is stopped or
   * interrupted before reaching the end, 'cancelled' when it's removed from the
   * queue before ever being synthesized, or 'error' when any other error
   * occurs. When pausing speech, a 'pause' event is fired if a particular
   * utterance is paused in the middle, and 'resume' if an utterance resumes
   * speech. Note that pause and resume events may not fire if speech is paused
   * in-between utterances.
   */
  String get type => this.proxy['type'];

  /**
   * The index of the current character in the utterance.
   */
  dynamic get charIndex => this.proxy['charIndex'];

  /**
   * The error description, if the event type is 'error'.
   */
  String get errorMessage => this.proxy['errorMessage'];
}

/**
 * A description of a voice available for speech synthesis.
 */
class TtsVoice extends ChromeObject {
  static TtsVoice create(JsObject proxy) => new TtsVoice(proxy);

  TtsVoice(JsObject proxy): super(proxy);

  /**
   * The name of the voice.
   */
  String get voiceName => this.proxy['voiceName'];

  /**
   * The language that this voice supports, in the form _language_-_region_.
   * Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
   */
  String get lang => this.proxy['lang'];

  /**
   * This voice's gender.
   */
  String get gender => this.proxy['gender'];

  /**
   * The ID of the extension providing this voice.
   */
  String get extensionId => this.proxy['extensionId'];

  /**
   * All of the callback event types that this voice is capable of sending.
   */
  List<String> get eventTypes => listify(this.proxy['eventTypes']);
}
