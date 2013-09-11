// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from font_settings.json - do not edit */

/// Use the `chrome.fontSettings` API to manage Chrome's font settings.
library chrome.font_settings;

import '../src/common.dart';

/// Accessor for the `chrome.font_settings` namespace.
final ChromeFontSettings font_settings = new ChromeFontSettings._();

class ChromeFontSettings {
  ChromeFontSettings._();

  /**
   * Clears the font set by this extension, if any.
   */
  Future clearFont(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('clearFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the font for a given script and generic font family.
   */
  Future getFont(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('getFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the font for a given script and generic font family.
   */
  Future setFont(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('setFont', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets a list of fonts on the system.
   */
  Future getFontList() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('getFontList', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('clearDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the default font size.
   * 
   * [details] This parameter is currently unused.
   */
  Future getDefaultFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('getDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default font size.
   */
  Future setDefaultFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('setDefaultFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the default fixed font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearDefaultFixedFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('clearDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the default size for fixed width fonts.
   * 
   * [details] This parameter is currently unused.
   */
  Future getDefaultFixedFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('getDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the default size for fixed width fonts.
   */
  Future setDefaultFixedFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('setDefaultFixedFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Clears the minimum font size set by this extension, if any.
   * 
   * [details] This parameter is currently unused.
   */
  Future clearMinimumFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('clearMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Gets the minimum font size.
   * 
   * [details] This parameter is currently unused.
   */
  Future getMinimumFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('getMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the minimum font size.
   */
  Future setMinimumFontSize(dynamic details) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    chrome['font_settings'].callMethod('setMinimumFontSize', [details, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when a font setting changes.
   */
  Stream get onFontChanged => null;

  /**
   * Fired when the default font size setting changes.
   */
  Stream get onDefaultFontSizeChanged => null;

  /**
   * Fired when the default fixed font size setting changes.
   */
  Stream get onDefaultFixedFontSizeChanged => null;

  /**
   * Fired when the minimum font size setting changes.
   */
  Stream get onMinimumFontSizeChanged => null;
}
