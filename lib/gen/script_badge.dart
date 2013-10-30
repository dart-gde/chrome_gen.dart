/* This file has been generated from script_badge.json - do not edit */

/**
 * Use the `chrome.scriptBadge` API to control the behaviour of the script
 * badge.
 */
library chrome.scriptBadge;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.scriptBadge` namespace.
 */
final ChromeScriptBadge scriptBadge = new ChromeScriptBadge._();

class ChromeScriptBadge extends ChromeApi {
  static final JsObject _scriptBadge = chrome['scriptBadge'];

  ChromeScriptBadge._();

  bool get available => _scriptBadge != null;

  /**
   * Sets the html document to be opened as a popup when the user clicks on the
   * script badge's icon.
   */
  void setPopup(Map details) {
    if (_scriptBadge == null) _throwNotAvailable();

    _scriptBadge.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this script badge.
   */
  Future<String> getPopup(Map details) {
    if (_scriptBadge == null) _throwNotAvailable();

    var completer = new ChromeCompleter<String>.oneArg();
    _scriptBadge.callMethod('getPopup', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Brings the script badge to the attention of the user, imploring her to
   * click.  You should call this when you detect that you can do something to a
   * particular tab.  Do not call this for every tab. That's tacky.  If the user
   * clicks on the badge, the activeTab APIs become available. If the extension
   * has already run on this tab, this call does nothing.
   */
  void getAttention(Map details) {
    if (_scriptBadge == null) _throwNotAvailable();

    _scriptBadge.callMethod('getAttention', [jsify(details)]);
  }

  /**
   * Fired when a script badge icon is clicked.  This event will not fire if the
   * script badge has a popup.
   */
  Stream<Tab> get onClicked => _onClicked.stream;

  final ChromeStreamController<Tab> _onClicked =
      new ChromeStreamController<Tab>.oneArg(_scriptBadge, 'onClicked', _createTab);

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.scriptBadge' is not available");
  }
}

Tab _createTab(JsObject jsProxy) => jsProxy == null ? null : new Tab.fromProxy(jsProxy);
