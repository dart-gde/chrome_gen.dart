/* This file has been generated from browsing_data.json - do not edit */

/**
 * Use the `chrome.browsingData` API to remove browsing data from a user's local
 * profile.
 */
library chrome.browsingData;

import '../src/common.dart';

/**
 * Accessor for the `chrome.browsingData` namespace.
 */
final ChromeBrowsingData browsingData = new ChromeBrowsingData._();

class ChromeBrowsingData extends ChromeApi {
  static final JsObject _browsingData = chrome['browsingData'];

  ChromeBrowsingData._();

  bool get available => _browsingData != null;

  /**
   * Reports which types of data are currently selected in the 'Clear browsing
   * data' settings UI.  Note: some of the data types included in this API are
   * not available in the settings UI, and some UI settings control more than
   * one data type listed here.
   */
  Future<Map> settings() {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    _browsingData.callMethod('settings', [completer.callback]);
    return completer.future;
  }

  /**
   * Clears various types of browsing data stored in a user's profile.
   * 
   * [dataToRemove] The set of data types to remove.
   */
  Future remove(RemovalOptions options, DataTypeSet dataToRemove) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('remove', [jsify(options), jsify(dataToRemove), completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' appcache data.
   */
  Future removeAppcache(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeAppcache', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cache.
   */
  Future removeCache(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeCache', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's cookies and server-bound certificates modified within
   * a particular timeframe.
   */
  Future removeCookies(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeCookies', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's list of downloaded files (_not_ the downloaded files
   * themselves).
   */
  Future removeDownloads(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeDownloads', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' file system data.
   */
  Future removeFileSystems(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeFileSystems', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored form data (autofill).
   */
  Future removeFormData(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeFormData', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's history.
   */
  Future removeHistory(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeHistory', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' IndexedDB data.
   */
  Future removeIndexedDB(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeIndexedDB', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' local storage data.
   */
  Future removeLocalStorage(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeLocalStorage', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears plugins' data.
   */
  Future removePluginData(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removePluginData', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears the browser's stored passwords.
   */
  Future removePasswords(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removePasswords', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Clears websites' WebSQL data.
   */
  Future removeWebSQL(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    var completer = new ChromeCompleter.noArgs();
    _browsingData.callMethod('removeWebSQL', [jsify(options), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw new UnsupportedError("'chrome.browsingData' is not available");
  }
}

class OriginTypesBrowsingData extends ChromeObject {
  OriginTypesBrowsingData({bool unprotectedWeb, bool protectedWeb, bool extension}) {
    if (unprotectedWeb != null) this.unprotectedWeb = unprotectedWeb;
    if (protectedWeb != null) this.protectedWeb = protectedWeb;
    if (extension != null) this.extension = extension;
  }
  OriginTypesBrowsingData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Normal websites.
   */
  bool get unprotectedWeb => proxy['unprotectedWeb'];
  set unprotectedWeb(bool value) => proxy['unprotectedWeb'] = value;

  /**
   * Websites that have been installed as hosted applications (be careful!).
   */
  bool get protectedWeb => proxy['protectedWeb'];
  set protectedWeb(bool value) => proxy['protectedWeb'] = value;

  /**
   * Extensions and packaged applications a user has installed (be _really_
   * careful!).
   */
  bool get extension => proxy['extension'];
  set extension(bool value) => proxy['extension'] = value;
}

/**
 * Options that determine exactly what data will be removed.
 */
class RemovalOptions extends ChromeObject {
  RemovalOptions({var since, OriginTypesBrowsingData originTypes}) {
    if (since != null) this.since = since;
    if (originTypes != null) this.originTypes = originTypes;
  }
  RemovalOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Remove data accumulated on or after this date, represented in milliseconds
   * since the epoch (accessible via the `getTime` method of the JavaScript
   * `Date` object). If absent, defaults to 0 (which would remove all browsing
   * data).
   */
  dynamic get since => proxy['since'];
  set since(var value) => proxy['since'] = jsify(value);

  /**
   * An object whose properties specify which origin types ought to be cleared.
   * If this object isn't specified, it defaults to clearing only "unprotected"
   * origins. Please ensure that you _really_ want to remove application data
   * before adding 'protectedWeb' or 'extensions'.
   */
  OriginTypesBrowsingData get originTypes => _createOriginTypesBrowsingData(proxy['originTypes']);
  set originTypes(OriginTypesBrowsingData value) => proxy['originTypes'] = jsify(value);
}

/**
 * A set of data types. Missing data types are interpreted as `false`.
 */
class DataTypeSet extends ChromeObject {
  DataTypeSet({bool appcache, bool cache, bool cookies, bool downloads, bool fileSystems, bool formData, bool history, bool indexedDB, bool localStorage, bool serverBoundCertificates, bool pluginData, bool passwords, bool webSQL}) {
    if (appcache != null) this.appcache = appcache;
    if (cache != null) this.cache = cache;
    if (cookies != null) this.cookies = cookies;
    if (downloads != null) this.downloads = downloads;
    if (fileSystems != null) this.fileSystems = fileSystems;
    if (formData != null) this.formData = formData;
    if (history != null) this.history = history;
    if (indexedDB != null) this.indexedDB = indexedDB;
    if (localStorage != null) this.localStorage = localStorage;
    if (serverBoundCertificates != null) this.serverBoundCertificates = serverBoundCertificates;
    if (pluginData != null) this.pluginData = pluginData;
    if (passwords != null) this.passwords = passwords;
    if (webSQL != null) this.webSQL = webSQL;
  }
  DataTypeSet.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Websites' appcaches.
   */
  bool get appcache => proxy['appcache'];
  set appcache(bool value) => proxy['appcache'] = value;

  /**
   * The browser's cache. Note: when removing data, this clears the _entire_
   * cache: it is not limited to the range you specify.
   */
  bool get cache => proxy['cache'];
  set cache(bool value) => proxy['cache'] = value;

  /**
   * The browser's cookies.
   */
  bool get cookies => proxy['cookies'];
  set cookies(bool value) => proxy['cookies'] = value;

  /**
   * The browser's download list.
   */
  bool get downloads => proxy['downloads'];
  set downloads(bool value) => proxy['downloads'] = value;

  /**
   * Websites' file systems.
   */
  bool get fileSystems => proxy['fileSystems'];
  set fileSystems(bool value) => proxy['fileSystems'] = value;

  /**
   * The browser's stored form data.
   */
  bool get formData => proxy['formData'];
  set formData(bool value) => proxy['formData'] = value;

  /**
   * The browser's history.
   */
  bool get history => proxy['history'];
  set history(bool value) => proxy['history'] = value;

  /**
   * Websites' IndexedDB data.
   */
  bool get indexedDB => proxy['indexedDB'];
  set indexedDB(bool value) => proxy['indexedDB'] = value;

  /**
   * Websites' local storage data.
   */
  bool get localStorage => proxy['localStorage'];
  set localStorage(bool value) => proxy['localStorage'] = value;

  /**
   * Server-bound certificates.
   */
  bool get serverBoundCertificates => proxy['serverBoundCertificates'];
  set serverBoundCertificates(bool value) => proxy['serverBoundCertificates'] = value;

  /**
   * Plugins' data.
   */
  bool get pluginData => proxy['pluginData'];
  set pluginData(bool value) => proxy['pluginData'] = value;

  /**
   * Stored passwords.
   */
  bool get passwords => proxy['passwords'];
  set passwords(bool value) => proxy['passwords'] = value;

  /**
   * Websites' WebSQL data.
   */
  bool get webSQL => proxy['webSQL'];
  set webSQL(bool value) => proxy['webSQL'] = value;
}

OriginTypesBrowsingData _createOriginTypesBrowsingData(JsObject proxy) => proxy == null ? null : new OriginTypesBrowsingData.fromProxy(proxy);
