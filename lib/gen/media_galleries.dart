/* This file has been generated from media_galleries.idl - do not edit */

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

class GetMediaFileSystemsInteractivity extends ChromeEnum {
  static const GetMediaFileSystemsInteractivity NO = const GetMediaFileSystemsInteractivity._('no');

  static List<GetMediaFileSystemsInteractivity> _values = [NO];

  static List<GetMediaFileSystemsInteractivity> get values => _values;

  static GetMediaFileSystemsInteractivity create(String str) =>
      _values.singleWhere((ChromeEnum e) => e.value == str);

  const GetMediaFileSystemsInteractivity._(String str): super(str);
}

class MediaFileSystemsDetails extends ChromeObject {
  static MediaFileSystemsDetails create(JsObject proxy) => proxy == null ? null : new MediaFileSystemsDetails(proxy);

  MediaFileSystemsDetails(JsObject proxy): super(proxy);
}

class MediaFileSystemMetadata extends ChromeObject {
  static MediaFileSystemMetadata create(JsObject proxy) => proxy == null ? null : new MediaFileSystemMetadata(proxy);

  MediaFileSystemMetadata(JsObject proxy): super(proxy);
}
