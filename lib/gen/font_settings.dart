/* This file has been generated from font_settings.json - do not edit */

/**
 * Use the `chrome.fontSettings` API to manage Chrome's font settings.
 */
library chrome.fontSettings;

import '../src/common.dart';

/**
 * Accessor for the `chrome.fontSettings` namespace.
 */
final ChromeFontSettings fontSettings = new ChromeFontSettings._();

class ChromeFontSettings extends ChromeApi {
  static final JsObject _fontSettings = chrome['fontSettings'];

  ChromeFontSettings._();

  bool get available => _fontSettings != null;

  /**
   * Clears the font set by this extension, if any.
   */
  Future clearFont(Map details) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearFont', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the font for a given script and generic font family.
   */
  Future<Map> getFont(Map details) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    _fontSettings.callMethod('getFont', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the font for a given script and generic font family.
   */
  Future setFont(Map details) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setFont', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Gets a list of fonts on the system.
   */
  Future<List<FontName>> getFontList() {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter<List<FontName>>.oneArg((e) => listify(e, _createFontName));
    _fontSettings.callMethod('getFontList', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFontSize([Map details]) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearDefaultFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the default font size.
   * 
   * [details] This parameter is currently unused.
   */
  Future<Map> getDefaultFontSize([Map details]) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    _fontSettings.callMethod('getDefaultFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default font size.
   */
  Future setDefaultFontSize(Map details) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setDefaultFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default fixed font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFixedFontSize([Map details]) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearDefaultFixedFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the default size for fixed width fonts.
   * 
   * [details] This parameter is currently unused.
   */
  Future<Map> getDefaultFixedFontSize([Map details]) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    _fontSettings.callMethod('getDefaultFixedFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default size for fixed width fonts.
   */
  Future setDefaultFixedFontSize(Map details) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setDefaultFixedFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the minimum font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearMinimumFontSize([Map details]) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearMinimumFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the minimum font size.
   * 
   * [details] This parameter is currently unused.
   */
  Future<Map> getMinimumFontSize([Map details]) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    _fontSettings.callMethod('getMinimumFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the minimum font size.
   */
  Future setMinimumFontSize(Map details) {
    if (_fontSettings == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setMinimumFontSize', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a font setting changes.
   */
  Stream<Map> get onFontChanged => _onFontChanged.stream;

  final ChromeStreamController<Map> _onFontChanged =
      new ChromeStreamController<Map>.oneArg(_fontSettings, 'onFontChanged', mapify);

  /**
   * Fired when the default font size setting changes.
   */
  Stream<Map> get onDefaultFontSizeChanged => _onDefaultFontSizeChanged.stream;

  final ChromeStreamController<Map> _onDefaultFontSizeChanged =
      new ChromeStreamController<Map>.oneArg(_fontSettings, 'onDefaultFontSizeChanged', mapify);

  /**
   * Fired when the default fixed font size setting changes.
   */
  Stream<Map> get onDefaultFixedFontSizeChanged => _onDefaultFixedFontSizeChanged.stream;

  final ChromeStreamController<Map> _onDefaultFixedFontSizeChanged =
      new ChromeStreamController<Map>.oneArg(_fontSettings, 'onDefaultFixedFontSizeChanged', mapify);

  /**
   * Fired when the minimum font size setting changes.
   */
  Stream<Map> get onMinimumFontSizeChanged => _onMinimumFontSizeChanged.stream;

  final ChromeStreamController<Map> _onMinimumFontSizeChanged =
      new ChromeStreamController<Map>.oneArg(_fontSettings, 'onMinimumFontSizeChanged', mapify);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.fontSettings' is not available");
  }
}

/**
 * Represents a font name.
 */
class FontName extends ChromeObject {
  FontName({String fontId, String displayName}) {
    if (fontId != null) this.fontId = fontId;
    if (displayName != null) this.displayName = displayName;
  }
  FontName.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The font ID.
   */
  String get fontId => jsProxy['fontId'];
  set fontId(String value) => jsProxy['fontId'] = value;

  /**
   * The display name of the font.
   */
  String get displayName => jsProxy['displayName'];
  set displayName(String value) => jsProxy['displayName'] = value;
}

/**
 * An ISO 15924 script code. The default, or global, script is represented by
 * script code "Zyyy".
 * enum of `Afak`, `Arab`, `Armi`, `Armn`, `Avst`, `Bali`, `Bamu`, `Bass`,
 * `Batk`, `Beng`, `Blis`, `Bopo`, `Brah`, `Brai`, `Bugi`, `Buhd`, `Cakm`,
 * `Cans`, `Cari`, `Cham`, `Cher`, `Cirt`, `Copt`, `Cprt`, `Cyrl`, `Cyrs`,
 * `Deva`, `Dsrt`, `Dupl`, `Egyd`, `Egyh`, `Egyp`, `Elba`, `Ethi`, `Geor`,
 * `Geok`, `Glag`, `Goth`, `Gran`, `Grek`, `Gujr`, `Guru`, `Hang`, `Hani`,
 * `Hano`, `Hans`, `Hant`, `Hebr`, `Hluw`, `Hmng`, `Hung`, `Inds`, `Ital`,
 * `Java`, `Jpan`, `Jurc`, `Kali`, `Khar`, `Khmr`, `Khoj`, `Knda`, `Kpel`,
 * `Kthi`, `Lana`, `Laoo`, `Latf`, `Latg`, `Latn`, `Lepc`, `Limb`, `Lina`,
 * `Linb`, `Lisu`, `Loma`, `Lyci`, `Lydi`, `Mand`, `Mani`, `Maya`, `Mend`,
 * `Merc`, `Mero`, `Mlym`, `Moon`, `Mong`, `Mroo`, `Mtei`, `Mymr`, `Narb`,
 * `Nbat`, `Nkgb`, `Nkoo`, `Nshu`, `Ogam`, `Olck`, `Orkh`, `Orya`, `Osma`,
 * `Palm`, `Perm`, `Phag`, `Phli`, `Phlp`, `Phlv`, `Phnx`, `Plrd`, `Prti`,
 * `Rjng`, `Roro`, `Runr`, `Samr`, `Sara`, `Sarb`, `Saur`, `Sgnw`, `Shaw`,
 * `Shrd`, `Sind`, `Sinh`, `Sora`, `Sund`, `Sylo`, `Syrc`, `Syre`, `Syrj`,
 * `Syrn`, `Tagb`, `Takr`, `Tale`, `Talu`, `Taml`, `Tang`, `Tavt`, `Telu`,
 * `Teng`, `Tfng`, `Tglg`, `Thaa`, `Thai`, `Tibt`, `Tirh`, `Ugar`, `Vaii`,
 * `Visp`, `Wara`, `Wole`, `Xpeo`, `Xsux`, `Yiii`, `Zmth`, `Zsym`, `Zyyy`
 */
class ScriptCode extends ChromeObject {
  ScriptCode();
  ScriptCode.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);
}

/**
 * A CSS generic font family.
 * enum of `standard`, `sansserif`, `serif`, `fixed`, `cursive`, `fantasy`
 */
class GenericFamily extends ChromeObject {
  GenericFamily();
  GenericFamily.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);
}

/**
 * One of<br>[not_controllable]: cannot be controlled by any
 * extension<br>[controlled_by_other_extensions]: controlled by extensions with
 * higher precedence<br>[controllable_by_this_extension]: can be controlled by
 * this extension<br>[controlled_by_this_extension]: controlled by this
 * extension
 * enum of `not_controllable`, `controlled_by_other_extensions`,
 * `controllable_by_this_extension`, `controlled_by_this_extension`
 */
class LevelOfControl extends ChromeObject {
  LevelOfControl();
  LevelOfControl.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);
}

FontName _createFontName(JsObject jsProxy) => jsProxy == null ? null : new FontName.fromProxy(jsProxy);
