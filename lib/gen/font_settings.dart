// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from font_settings.json - do not edit */

/// Use the `chrome.fontSettings` API to manage Chrome's font settings.
library chrome.fontSettings;

import '../src/common.dart';

/// Accessor for the `chrome.fontSettings` namespace.
final ChromeFontSettings fontSettings = new ChromeFontSettings._();

class ChromeFontSettings {
  ChromeFontSettings._();

  /**
   * Clears the font set by this extension, if any.
   */
  Future clearFont(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('clearFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the font for a given script and generic font family.
   */
  Future<dynamic> getFont(var details) {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['fontSettings'].callMethod('getFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the font for a given script and generic font family.
   */
  Future setFont(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('setFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets a list of fonts on the system.
   */
  Future<dynamic> getFontList() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((arg) {
      return arg;
    });
    chrome['fontSettings'].callMethod('getFontList', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('clearDefaultFontSize', [details, completer.callback]);
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
    chrome['fontSettings'].callMethod('getDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default font size.
   */
  Future setDefaultFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('setDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default fixed font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFixedFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('clearDefaultFixedFontSize', [details, completer.callback]);
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
    chrome['fontSettings'].callMethod('getDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default size for fixed width fonts.
   */
  Future setDefaultFixedFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('setDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the minimum font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearMinimumFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('clearMinimumFontSize', [details, completer.callback]);
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
    chrome['fontSettings'].callMethod('getMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the minimum font size.
   */
  Future setMinimumFontSize(var details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['fontSettings'].callMethod('setMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  final ChromeStreamController _onFontChanged = null;

  /**
   * Fired when a font setting changes.
   */
  Stream get onFontChanged => _onFontChanged.stream;

  final ChromeStreamController _onDefaultFontSizeChanged = null;

  /**
   * Fired when the default font size setting changes.
   */
  Stream get onDefaultFontSizeChanged => _onDefaultFontSizeChanged.stream;

  final ChromeStreamController _onDefaultFixedFontSizeChanged = null;

  /**
   * Fired when the default fixed font size setting changes.
   */
  Stream get onDefaultFixedFontSizeChanged => _onDefaultFixedFontSizeChanged.stream;

  final ChromeStreamController _onMinimumFontSizeChanged = null;

  /**
   * Fired when the minimum font size setting changes.
   */
  Stream get onMinimumFontSizeChanged => _onMinimumFontSizeChanged.stream;
}
