// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from location.idl - do not edit */

/**
 * 
 */
library chrome.location;

import '../src/common.dart';

/// Accessor for the `chrome.location` namespace.
final ChromeLocation location = new ChromeLocation._();

class ChromeLocation {
  static final JsObject _location = context['chrome']['location'];

  ChromeLocation._();

  void watchLocation(String name, WatchLocationRequestInfo requestInfo) {
    _location.callMethod('watchLocation', [name, requestInfo]);
  }

  void clearWatch(String name) {
    _location.callMethod('clearWatch', [name]);
  }

  Stream<Location> get onLocationUpdate => _onLocationUpdate.stream;

  final ChromeStreamController<Location> _onLocationUpdate =
      new ChromeStreamController<Location>.oneArg(_location['onLocationUpdate'], selfConverter);

  Stream<String> get onLocationError => _onLocationError.stream;

  final ChromeStreamController<String> _onLocationError =
      new ChromeStreamController<String>.oneArg(_location['onLocationError'], selfConverter);
}

class Coordinates extends ChromeObject {
  static Coordinates create(JsObject proxy) => new Coordinates(proxy);

  Coordinates(JsObject proxy): super(proxy);
}

class Location extends ChromeObject {
  static Location create(JsObject proxy) => new Location(proxy);

  Location(JsObject proxy): super(proxy);
}

class WatchLocationRequestInfo extends ChromeObject {
  static WatchLocationRequestInfo create(JsObject proxy) => new WatchLocationRequestInfo(proxy);

  WatchLocationRequestInfo(JsObject proxy): super(proxy);
}
