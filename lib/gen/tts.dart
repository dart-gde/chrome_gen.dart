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
  static final JsObject _tts = context['chrome']['tts'];

  ChromeTts._();

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
   * `enqueue` If true, enqueues this utterance if TTS is already in progress.
   * If false (the default), interrupts any current speech and flushes the
   * speech queue before speaking this new utterance.
   * 
   * `voiceName` The name of the voice to use for synthesis. If empty, uses any
   * available voice.
   * 
   * `extensionId` The extension ID of the speech engine to use, if known.
   * 
   * `lang` The language to be used for synthesis, in the form
   * _language_-_region_. Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
   * 
   * `gender` Gender of voice for synthesized speech.
   * 
   * `rate` Speaking rate relative to the default rate for this voice. 1.0 is
   * the default rate, normally around 180 to 220 words per minute. 2.0 is twice
   * as fast, and 0.5 is half as fast. Values below 0.1 or above 10.0 are
   * strictly disallowed, but many voices will constrain the minimum and maximum
   * rates further-for example a particular voice may not actually speak faster
   * than 3 times normal even if you specify a value larger than 3.0.
   * 
   * `pitch` Speaking pitch between 0 and 2 inclusive, with 0 being lowest and 2
   * being highest. 1.0 corresponds to a voice's default pitch.
   * 
   * `volume` Speaking volume between 0 and 1 inclusive, with 0 being lowest and
   * 1 being highest, with a default of 1.0.
   * 
   * `requiredEventTypes` The TTS event types the voice must support.
   * 
   * `desiredEventTypes` The TTS event types that you are interested in
   * listening to. If missing, all event types may be sent.
   * 
   * `onEvent` This function is called with events that occur in the process of
   * speaking the utterance.
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
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, TtsVoice.create));
    _tts.callMethod('getVoices', [completer.callback]);
    return completer.future;
  }

  /**
   * Used to pass events back to the function calling speak().
   */
  Stream<TtsEvent> get onEvent => _onEvent.stream;

  final ChromeStreamController<TtsEvent> _onEvent =
      new ChromeStreamController<TtsEvent>.oneArg(_tts['onEvent'], TtsEvent.create);
}

/**
 * An event from the TTS engine to communicate the status of an utterance.
 * 
 * `type` The type can be 'start' as soon as speech has started, 'word' when a
 * word boundary is reached, 'sentence' when a sentence boundary is reached,
 * 'marker' when an SSML mark element is reached, 'end' when the end of the
 * utterance is reached, 'interrupted' when the utterance is stopped or
 * interrupted before reaching the end, 'cancelled' when it's removed from the
 * queue before ever being synthesized, or 'error' when any other error occurs.
 * When pausing speech, a 'pause' event is fired if a particular utterance is
 * paused in the middle, and 'resume' if an utterance resumes speech. Note that
 * pause and resume events may not fire if speech is paused in-between
 * utterances.
 * 
 * `charIndex` The index of the current character in the utterance.
 * 
 * `errorMessage` The error description, if the event type is 'error'.
 * 
 * `srcId` An ID unique to the calling function's context so that events can get
 * routed back to the correct tts.speak call.
 * 
 * `isFinalEvent` True if this is the final event that will be sent to this
 * handler.
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
  String get type => proxy['type'];

  /**
   * The index of the current character in the utterance.
   */
  dynamic get charIndex => proxy['charIndex'];

  /**
   * The error description, if the event type is 'error'.
   */
  String get errorMessage => proxy['errorMessage'];
}

/**
 * A description of a voice available for speech synthesis.
 * 
 * `voiceName` The name of the voice.
 * 
 * `lang` The language that this voice supports, in the form
 * _language_-_region_. Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
 * 
 * `gender` This voice's gender.
 * 
 * `extensionId` The ID of the extension providing this voice.
 * 
 * `eventTypes` All of the callback event types that this voice is capable of
 * sending.
 */
class TtsVoice extends ChromeObject {
  static TtsVoice create(JsObject proxy) => new TtsVoice(proxy);

  TtsVoice(JsObject proxy): super(proxy);

  /**
   * The name of the voice.
   */
  String get voiceName => proxy['voiceName'];

  /**
   * The language that this voice supports, in the form _language_-_region_.
   * Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
   */
  String get lang => proxy['lang'];

  /**
   * This voice's gender.
   */
  String get gender => proxy['gender'];

  /**
   * The ID of the extension providing this voice.
   */
  String get extensionId => proxy['extensionId'];

  /**
   * All of the callback event types that this voice is capable of sending.
   */
  List<String> get eventTypes => listify(proxy['eventTypes']);
}
