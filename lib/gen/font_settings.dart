// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from font_settings.json - do not edit */

/**
 * Use the `chrome.fontSettings` API to manage Chrome's font settings.
 */
library chrome.fontSettings;

import '../src/common.dart';

/// Accessor for the `chrome.fontSettings` namespace.
final ChromeFontSettings fontSettings = new ChromeFontSettings._();

class ChromeFontSettings {
  JsObject _fontSettings;

  ChromeFontSettings._() {
    _fontSettings = context['chrome']['fontSettings'];
  }

  /**
   * Clears the font set by this extension, if any.
   */
  Future clearFont(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the font for a given script and generic font family.
   */
  Future<dynamic> getFont(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _fontSettings.callMethod('getFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the font for a given script and generic font family.
   */
  Future setFont(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets a list of fonts on the system.
   */
  Future<dynamic> getFontList() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _fontSettings.callMethod('getFontList', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the default font size.
   * 
   * [details] This parameter is currently unused.
   */
  Future<dynamic> getDefaultFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _fontSettings.callMethod('getDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default font size.
   */
  Future setDefaultFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default fixed font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFixedFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the default size for fixed width fonts.
   * 
   * [details] This parameter is currently unused.
   */
  Future<dynamic> getDefaultFixedFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _fontSettings.callMethod('getDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default size for fixed width fonts.
   */
  Future setDefaultFixedFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the minimum font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearMinimumFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('clearMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the minimum font size.
   * 
   * [details] This parameter is currently unused.
   */
  Future<dynamic> getMinimumFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    _fontSettings.callMethod('getMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the minimum font size.
   */
  Future setMinimumFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _fontSettings.callMethod('setMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a font setting changes.
   */
  Stream<dynamic> get onFontChanged => _onFontChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onFontChanged = null;

  /**
   * Fired when the default font size setting changes.
   */
  Stream<dynamic> get onDefaultFontSizeChanged => _onDefaultFontSizeChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onDefaultFontSizeChanged = null;

  /**
   * Fired when the default fixed font size setting changes.
   */
  Stream<dynamic> get onDefaultFixedFontSizeChanged => _onDefaultFixedFontSizeChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onDefaultFixedFontSizeChanged = null;

  /**
   * Fired when the minimum font size setting changes.
   */
  Stream<dynamic> get onMinimumFontSizeChanged => _onMinimumFontSizeChanged.stream;

  // TODO:
  final ChromeStreamController<dynamic> _onMinimumFontSizeChanged = null;
}

/**
 * Represents a font name.
 */
class FontName extends ChromeObject {
  FontName(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * An ISO 15924 script code. The default, or global, script is represented by
 * script code "Zyyy".
 */
class ScriptCode extends ChromeObject {
  ScriptCode(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * A CSS generic font family.
 */
class GenericFamily extends ChromeObject {
  GenericFamily(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * One of<br>[not_controllable]: cannot be controlled by any
 * extension<br>[controlled_by_other_extensions]: controlled by extensions with
 * higher precedence<br>[controllable_by_this_extension]: can be controlled by
 * this extension<br>[controlled_by_this_extension]: controlled by this
 * extension
 */
class LevelOfControl extends ChromeObject {
  LevelOfControl(JsObject proxy): super(proxy);
  // TODO:
}