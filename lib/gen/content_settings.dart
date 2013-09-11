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
library chrome.content_settings;

import '../src/common.dart';

/// Accessor for the `chrome.content_settings` namespace.
final ChromeContentSettings content_settings = new ChromeContentSettings._();

class ChromeContentSettings {
  ChromeContentSettings._();

  /**
   * Whether to allow cookies and other local data to be set by websites. One
   * of<br>[allow]: Accept cookies,<br>[block]: Block
   * cookies,<br>[session_only]: Accept cookies only for the current session.
   * <br>Default is [allow].<br>The primary URL is the URL representing the
   * cookie origin. The secondary URL is the URL of the top-level frame.
   */
  dynamic get cookies => chrome['content_settings']['cookies'];

  /**
   * Whether to show images. One of<br>[allow]: Show images,<br>[block]: Don't
   * show images. <br>Default is [allow].<br>The primary URL is the main-frame
   * URL. The secondary URL is the URL of the image.
   */
  dynamic get images => chrome['content_settings']['images'];

  /**
   * Whether to run JavaScript. One of<br>[allow]: Run JavaScript,<br>[block]:
   * Don't run JavaScript. <br>Default is [allow].<br>The primary URL is the
   * main-frame URL. The secondary URL is not used.
   */
  dynamic get javascript => chrome['content_settings']['javascript'];

  /**
   * Whether to run plug-ins. One of<br>[allow]: Run plug-ins
   * automatically,<br>[block]: Don't run plug-ins automatically. <br>Default is
   * [allow].<br>The primary URL is the main-frame URL. The secondary URL is not
   * used.
   */
  dynamic get plugins => chrome['content_settings']['plugins'];

  /**
   * Whether to allow sites to show pop-ups. One of<br>[allow]: Allow sites to
   * show pop-ups,<br>[block]: Don't allow sites to show pop-ups. <br>Default is
   * [block].<br>The primary URL is the main-frame URL. The secondary URL is not
   * used.
   */
  dynamic get popups => chrome['content_settings']['popups'];

  /**
   * Whether to allow sites to show desktop notifications. One of<br>[allow]:
   * Allow sites to show desktop notifications,<br>[block]: Don't allow sites to
   * show desktop notifications,<br>[ask]: Ask when a site wants to show desktop
   * notifications. <br>Default is [ask].<br>The primary URL is the main-frame
   * URL. The secondary URL is not used.
   */
  dynamic get notifications => chrome['content_settings']['notifications'];
}
