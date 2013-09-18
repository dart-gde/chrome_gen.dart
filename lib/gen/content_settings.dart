// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from content_settings.json - do not edit */

/**
 * Use the `chrome.contentSettings` API to change settings that control whether
 * websites can use features such as cookies, JavaScript, and plug-ins. More
 * generally speaking, content settings allow you to customize Chrome's behavior
 * on a per-site basis instead of globally.
 */
library chrome.contentSettings;

import '../src/common.dart';

/// Accessor for the `chrome.contentSettings` namespace.
final ChromeContentSettings contentSettings = new ChromeContentSettings._();

class ChromeContentSettings {
  JsObject _contentSettings;

  ChromeContentSettings._() {
    _contentSettings = context['chrome']['contentSettings'];
  }

  /**
   * Whether to allow cookies and other local data to be set by websites. One
   * of<br>[allow]: Accept cookies,<br>[block]: Block
   * cookies,<br>[session_only]: Accept cookies only for the current session.
   * <br>Default is [allow].<br>The primary URL is the URL representing the
   * cookie origin. The secondary URL is the URL of the top-level frame.
   */
  dynamic get cookies => _contentSettings['cookies'];

  /**
   * Whether to show images. One of<br>[allow]: Show images,<br>[block]: Don't
   * show images. <br>Default is [allow].<br>The primary URL is the main-frame
   * URL. The secondary URL is the URL of the image.
   */
  dynamic get images => _contentSettings['images'];

  /**
   * Whether to run JavaScript. One of<br>[allow]: Run JavaScript,<br>[block]:
   * Don't run JavaScript. <br>Default is [allow].<br>The primary URL is the
   * main-frame URL. The secondary URL is not used.
   */
  dynamic get javascript => _contentSettings['javascript'];

  /**
   * Whether to run plug-ins. One of<br>[allow]: Run plug-ins
   * automatically,<br>[block]: Don't run plug-ins automatically. <br>Default is
   * [allow].<br>The primary URL is the main-frame URL. The secondary URL is not
   * used.
   */
  dynamic get plugins => _contentSettings['plugins'];

  /**
   * Whether to allow sites to show pop-ups. One of<br>[allow]: Allow sites to
   * show pop-ups,<br>[block]: Don't allow sites to show pop-ups. <br>Default is
   * [block].<br>The primary URL is the main-frame URL. The secondary URL is not
   * used.
   */
  dynamic get popups => _contentSettings['popups'];

  /**
   * Whether to allow sites to show desktop notifications. One of<br>[allow]:
   * Allow sites to show desktop notifications,<br>[block]: Don't allow sites to
   * show desktop notifications,<br>[ask]: Ask when a site wants to show desktop
   * notifications. <br>Default is [ask].<br>The primary URL is the main-frame
   * URL. The secondary URL is not used.
   */
  dynamic get notifications => _contentSettings['notifications'];
}

/**
 * The only content type using resource identifiers is
 * [contentSettings.plugins.] For more information, see [Resource
 * Identifiers](contentSettings.html#resource-identifiers).
 */
class ResourceIdentifier extends ChromeObject {
  ResourceIdentifier(JsObject proxy): super(proxy);
  // TODO:
}

class ContentSetting extends ChromeObject {
  ContentSetting(JsObject proxy): super(proxy);
  // TODO:
}
