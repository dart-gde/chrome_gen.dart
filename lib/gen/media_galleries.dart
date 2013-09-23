// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from media_galleries.idl - do not edit */

/**
 * 
 */
library chrome.mediaGalleries;

import '../src/common.dart';

/// Accessor for the `chrome.mediaGalleries` namespace.
final ChromeMediaGalleries mediaGalleries = new ChromeMediaGalleries._();

class ChromeMediaGalleries {
  static final JsObject _mediaGalleries = context['chrome']['mediaGalleries'];

  ChromeMediaGalleries._();

  Future getMediaFileSystems([MediaFileSystemsDetails details]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _mediaGalleries.callMethod('getMediaFileSystems', [details, completer.callback]);
    return completer.future;
  }

  void getMediaFileSystemMetadata(var mediaFileSystem) {
    _mediaGalleries.callMethod('getMediaFileSystemMetadata', [mediaFileSystem]);
  }
}

class MediaFileSystemsDetails extends ChromeObject {
  static MediaFileSystemsDetails create(JsObject proxy) => new MediaFileSystemsDetails(proxy);

  MediaFileSystemsDetails(JsObject proxy): super(proxy);
}

class MediaFileSystemMetadata extends ChromeObject {
  static MediaFileSystemMetadata create(JsObject proxy) => new MediaFileSystemMetadata(proxy);

  MediaFileSystemMetadata(JsObject proxy): super(proxy);
}
