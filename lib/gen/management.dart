/* This file has been generated from management.json - do not edit */

/**
 * The `chrome.management` API provides ways to manage the list of
 * extensions/apps that are installed and running. It is particularly useful for
 * extensions that [override](override.html) the built-in New Tab page.
 */
library chrome.management;

import '../src/common.dart';

/// Accessor for the `chrome.management` namespace.
final ChromeManagement management = ChromeManagement._management == null ? apiNotAvailable('chrome.management') : new ChromeManagement._();

class ChromeManagement {
  static final JsObject _management = chrome['management'];

  ChromeManagement._();

  /**
   * Returns a list of information about installed extensions and apps.
   */
  Future<List<ExtensionInfo>> getAll() {
    var completer = new ChromeCompleter<List<ExtensionInfo>>.oneArg((e) => listify(e, _createExtensionInfo));
    _management.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Returns information about the installed extension, app, or theme that has
   * the given ID.
   * 
   * [id] The ID from an item of [ExtensionInfo.]
   */
  Future<ExtensionInfo> get(String id) {
    var completer = new ChromeCompleter<ExtensionInfo>.oneArg(_createExtensionInfo);
    _management.callMethod('get', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns a list of [permission warnings](permission_warnings.html) for the
   * given extension id.
   * 
   * [id] The ID of an already installed extension.
   */
  Future<List<String>> getPermissionWarningsById(String id) {
    var completer = new ChromeCompleter<List<String>>.oneArg(listify);
    _management.callMethod('getPermissionWarningsById', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Returns a list of [permission warnings](permission_warnings.html) for the
   * given extension manifest string. Note: This function can be used without
   * requesting the 'management' permission in the manifest.
   * 
   * [manifestStr] Extension manifest JSON string.
   */
  Future<List<String>> getPermissionWarningsByManifest(String manifestStr) {
    var completer = new ChromeCompleter<List<String>>.oneArg(listify);
    _management.callMethod('getPermissionWarningsByManifest', [manifestStr, completer.callback]);
    return completer.future;
  }

  /**
   * Enables or disables an app or extension.
   * 
   * [id] This should be the id from an item of [ExtensionInfo.]
   * 
   * [enabled] Whether this item should be enabled or disabled.
   */
  Future setEnabled(String id, bool enabled) {
    var completer = new ChromeCompleter.noArgs();
    _management.callMethod('setEnabled', [id, enabled, completer.callback]);
    return completer.future;
  }

  /**
   * Uninstalls a currently installed app or extension.
   * 
   * [id] This should be the id from an item of [ExtensionInfo.]
   */
  Future uninstall(String id, [Map options]) {
    var completer = new ChromeCompleter.noArgs();
    _management.callMethod('uninstall', [id, jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Uninstalls the calling extension. Note: This function can be used without
   * requesting the 'management' permission in the manifest.
   */
  Future uninstallSelf([Map options]) {
    var completer = new ChromeCompleter.noArgs();
    _management.callMethod('uninstallSelf', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Launches an application.
   * 
   * [id] The extension id of the application.
   */
  Future launchApp(String id) {
    var completer = new ChromeCompleter.noArgs();
    _management.callMethod('launchApp', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when an app or extension has been installed.
   */
  Stream<ExtensionInfo> get onInstalled => _onInstalled.stream;

  final ChromeStreamController<ExtensionInfo> _onInstalled =
      new ChromeStreamController<ExtensionInfo>.oneArg(_management['onInstalled'], _createExtensionInfo);

  /**
   * Fired when an app or extension has been uninstalled.
   */
  Stream<String> get onUninstalled => _onUninstalled.stream;

  final ChromeStreamController<String> _onUninstalled =
      new ChromeStreamController<String>.oneArg(_management['onUninstalled'], selfConverter);

  /**
   * Fired when an app or extension has been enabled.
   */
  Stream<ExtensionInfo> get onEnabled => _onEnabled.stream;

  final ChromeStreamController<ExtensionInfo> _onEnabled =
      new ChromeStreamController<ExtensionInfo>.oneArg(_management['onEnabled'], _createExtensionInfo);

  /**
   * Fired when an app or extension has been disabled.
   */
  Stream<ExtensionInfo> get onDisabled => _onDisabled.stream;

  final ChromeStreamController<ExtensionInfo> _onDisabled =
      new ChromeStreamController<ExtensionInfo>.oneArg(_management['onDisabled'], _createExtensionInfo);
}

/**
 * Information about an icon belonging to an extension, app, or theme.
 */
class IconInfo extends ChromeObject {

  IconInfo({int size, String url}) {
    if (size != null) this.size = size;
    if (url != null) this.url = url;
  }

  IconInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * A number representing the width and height of the icon. Likely values
   * include (but are not limited to) 128, 48, 24, and 16.
   */
  int get size => proxy['size'];
  set size(int value) => proxy['size'] = value;

  /**
   * The URL for this icon image. To display a grayscale version of the icon (to
   * indicate that an extension is disabled, for example), append
   * `?grayscale=true` to the URL.
   */
  String get url => proxy['url'];
  set url(String value) => proxy['url'] = value;
}

/**
 * Information about an installed extension, app, or theme.
 */
class ExtensionInfo extends ChromeObject {

  ExtensionInfo({String id, String name, String description, String version, bool mayDisable, bool enabled, String disabledReason, String type, String appLaunchUrl, String homepageUrl, String updateUrl, bool offlineEnabled, String optionsUrl, List<IconInfo> icons, List<String> permissions, List<String> hostPermissions, String installType}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (description != null) this.description = description;
    if (version != null) this.version = version;
    if (mayDisable != null) this.mayDisable = mayDisable;
    if (enabled != null) this.enabled = enabled;
    if (disabledReason != null) this.disabledReason = disabledReason;
    if (type != null) this.type = type;
    if (appLaunchUrl != null) this.appLaunchUrl = appLaunchUrl;
    if (homepageUrl != null) this.homepageUrl = homepageUrl;
    if (updateUrl != null) this.updateUrl = updateUrl;
    if (offlineEnabled != null) this.offlineEnabled = offlineEnabled;
    if (optionsUrl != null) this.optionsUrl = optionsUrl;
    if (icons != null) this.icons = icons;
    if (permissions != null) this.permissions = permissions;
    if (hostPermissions != null) this.hostPermissions = hostPermissions;
    if (installType != null) this.installType = installType;
  }

  ExtensionInfo.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The extension's unique identifier.
   */
  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  /**
   * The name of this extension, app, or theme.
   */
  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  /**
   * The description of this extension, app, or theme.
   */
  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;

  /**
   * The [version](manifest/version.html) of this extension, app, or theme.
   */
  String get version => proxy['version'];
  set version(String value) => proxy['version'] = value;

  /**
   * Whether this extension can be disabled or uninstalled by the user.
   */
  bool get mayDisable => proxy['mayDisable'];
  set mayDisable(bool value) => proxy['mayDisable'] = value;

  /**
   * Whether it is currently enabled or disabled.
   */
  bool get enabled => proxy['enabled'];
  set enabled(bool value) => proxy['enabled'] = value;

  /**
   * A reason the item is disabled.
   * enum of `unknown`, `permissions_increase`
   */
  String get disabledReason => proxy['disabledReason'];
  set disabledReason(String value) => proxy['disabledReason'] = value;

  /**
   * The type of this extension, app, or theme.
   * enum of `extension`, `hosted_app`, `packaged_app`, `legacy_packaged_app`,
   * `theme`
   */
  String get type => proxy['type'];
  set type(String value) => proxy['type'] = value;

  /**
   * The launch url (only present for apps).
   */
  String get appLaunchUrl => proxy['appLaunchUrl'];
  set appLaunchUrl(String value) => proxy['appLaunchUrl'] = value;

  /**
   * The URL of the homepage of this extension, app, or theme.
   */
  String get homepageUrl => proxy['homepageUrl'];
  set homepageUrl(String value) => proxy['homepageUrl'] = value;

  /**
   * The update URL of this extension, app, or theme.
   */
  String get updateUrl => proxy['updateUrl'];
  set updateUrl(String value) => proxy['updateUrl'] = value;

  /**
   * Whether the extension, app, or theme declares that it supports offline.
   */
  bool get offlineEnabled => proxy['offlineEnabled'];
  set offlineEnabled(bool value) => proxy['offlineEnabled'] = value;

  /**
   * The url for the item's options page, if it has one.
   */
  String get optionsUrl => proxy['optionsUrl'];
  set optionsUrl(String value) => proxy['optionsUrl'] = value;

  /**
   * A list of icon information. Note that this just reflects what was declared
   * in the manifest, and the actual image at that url may be larger or smaller
   * than what was declared, so you might consider using explicit width and
   * height attributes on img tags referencing these images. See the [manifest
   * documentation on icons](manifest/icons.html) for more details.
   */
  List<IconInfo> get icons => listify(proxy['icons'], _createIconInfo);
  set icons(List<IconInfo> value) => proxy['icons'] = value;

  /**
   * Returns a list of API based permissions.
   */
  List<String> get permissions => listify(proxy['permissions']);
  set permissions(List<String> value) => proxy['permissions'] = value;

  /**
   * Returns a list of host based permissions.
   */
  List<String> get hostPermissions => listify(proxy['hostPermissions']);
  set hostPermissions(List<String> value) => proxy['hostPermissions'] = value;

  /**
   * How the extension was installed. One of<br>[admin]: The extension was
   * installed because of an administrative policy,<br>[development]: The
   * extension was loaded unpacked in developer mode,<br>[normal]: The extension
   * was installed normally via a .crx file,<br>[sideload]: The extension was
   * installed by other software on the machine,<br>[other]: The extension was
   * installed by other means.
   * enum of `admin`, `development`, `normal`, `sideload`, `other`
   */
  String get installType => proxy['installType'];
  set installType(String value) => proxy['installType'] = value;
}

ExtensionInfo _createExtensionInfo(JsObject proxy) => proxy == null ? null : new ExtensionInfo.fromProxy(proxy);
IconInfo _createIconInfo(JsObject proxy) => proxy == null ? null : new IconInfo.fromProxy(proxy);
