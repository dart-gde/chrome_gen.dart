// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from events.json - do not edit */

/**
 * Use the `chrome.events` API to notify you when something interesting happens.
 */
library chrome.events;

import '../src/common.dart';

/// Accessor for the `chrome.events` namespace.
final ChromeEvents events = new ChromeEvents._();

class ChromeEvents {
  JsObject _events;

  ChromeEvents._() {
    _events = context['chrome']['events'];
  }
}

/**
 * Description of a declarative rule for handling events.
 */
class Rule extends ChromeObject {
  Rule(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * An object which allows the addition and removal of listeners for a Chrome
 * event.
 */
class Event extends ChromeObject {
  Event(JsObject proxy): super(proxy);
  // TODO:
}

/**
 * Filters URLs for various criteria. See [event filtering](#filtered). All
 * criteria are case sensitive.
 */
class UrlFilter extends ChromeObject {
  UrlFilter(JsObject proxy): super(proxy);
  // TODO:
}
