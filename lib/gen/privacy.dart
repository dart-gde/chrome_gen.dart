// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from privacy.json - do not edit */

/**
 * Use the `chrome.privacy` API to control usage of the features in Chrome that
 * can affect a user's privacy. This API relies on the [ChromeSetting prototype
 * of the type API](types.html#ChromeSetting) for getting and setting Chrome's
 * configuration.
 */
library chrome.privacy;

import '../src/common.dart';

/// Accessor for the `chrome.privacy` namespace.
final ChromePrivacy privacy = new ChromePrivacy._();

class ChromePrivacy {
  JsObject _privacy;

  ChromePrivacy._() {
    _privacy = context['chrome']['privacy'];
  }

  /**
   * Settings that influence Chrome's handling of network connections in
   * general.
   */
  Map get network => _privacy['network'];

  /**
   * Settings that enable or disable features that require third-party network
   * services provided by Google and your default search provider.
   */
  Map get services => _privacy['services'];

  /**
   * Settings that determine what information Chrome makes available to
   * websites.
   */
  Map get websites => _privacy['websites'];
}
