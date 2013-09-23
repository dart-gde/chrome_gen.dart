/* This file has been generated from management.json - do not edit */

/**
 * The `chrome.management` API provides ways to manage the list of
 * extensions/apps that are installed and running. It is particularly useful for
 * extensions that [override](override.html) the built-in New Tab page.
 */
library chrome.management;

import '../src/common.dart';

/// Accessor for the `chrome.management` namespace.
final ChromeManagement management = new ChromeManagement._();

class ChromeManagement {
  static final JsObject _management = context['chrome']['management'];

  ChromeManagement._();

  /**
   * Returns a list of information about installed extensions and apps.
   */
  Future<List<ExtensionInfo>> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg((e) => listify(e, ExtensionInfo.create));
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
    ChromeCompleter completer = new ChromeCompleter.oneArg(ExtensionInfo.create);
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
    ChromeCompleter completer = new ChromeCompleter.oneArg(listify);
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
    ChromeCompleter completer = new ChromeCompleter.oneArg(listify);
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
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('setEnabled', [id, enabled, completer.callback]);
    return completer.future;
  }

  /**
   * Uninstalls a currently installed app or extension.
   * 
   * [id] This should be the id from an item of [ExtensionInfo.]
   */
  Future uninstall(String id, [Map options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('uninstall', [id, jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Uninstalls the calling extension. Note: This function can be used without
   * requesting the 'management' permission in the manifest.
   */
  Future uninstallSelf([Map options]) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('uninstallSelf', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Launches an application.
   * 
   * [id] The extension id of the application.
   */
  Future launchApp(String id) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _management.callMethod('launchApp', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when an app or extension has been installed.
   */
  Stream<ExtensionInfo> get onInstalled => _onInstalled.stream;

  final ChromeStreamController<ExtensionInfo> _onInstalled =
      new ChromeStreamController<ExtensionInfo>.oneArg(_management['onInstalled'], ExtensionInfo.create);

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
      new ChromeStreamController<ExtensionInfo>.oneArg(_management['onEnabled'], ExtensionInfo.create);

  /**
   * Fired when an app or extension has been disabled.
   */
  Stream<ExtensionInfo> get onDisabled => _onDisabled.stream;

  final ChromeStreamController<ExtensionInfo> _onDisabled =
      new ChromeStreamController<ExtensionInfo>.oneArg(_management['onDisabled'], ExtensionInfo.create);
}

/**
 * Information about an icon belonging to an extension, app, or theme.
 */
class IconInfo extends ChromeObject {
  static IconInfo create(JsObject proxy) => proxy == null ? null : new IconInfo(proxy);

  IconInfo(JsObject proxy): super(proxy);

  /**
   * A number representing the width and height of the icon. Likely values
   * include (but are not limited to) 128, 48, 24, and 16.
   */
  int get size => proxy['size'];

  /**
   * The URL for this icon image. To display a grayscale version of the icon (to
   * indicate that an extension is disabled, for example), append
   * `?grayscale=true` to the URL.
   */
  String get url => proxy['url'];
}

/**
 * Information about an installed extension, app, or theme.
 */
class ExtensionInfo extends ChromeObject {
  static ExtensionInfo create(JsObject proxy) => proxy == null ? null : new ExtensionInfo(proxy);

  ExtensionInfo(JsObject proxy): super(proxy);

  /**
   * The extension's unique identifier.
   */
  String get id => proxy['id'];

  /**
   * The name of this extension, app, or theme.
   */
  String get name => proxy['name'];

  /**
   * The description of this extension, app, or theme.
   */
  String get description => proxy['description'];

  /**
   * The [version](manifest/version.html) of this extension, app, or theme.
   */
  String get version => proxy['version'];

  /**
   * Whether this extension can be disabled or uninstalled by the user.
   */
  bool get mayDisable => proxy['mayDisable'];

  /**
   * Whether it is currently enabled or disabled.
   */
  bool get enabled => proxy['enabled'];

  /**
   * A reason the item is disabled.
   */
  String get disabledReason => proxy['disabledReason'];

  /**
   * The type of this extension, app, or theme.
   */
  String get type => proxy['type'];

  /**
   * The launch url (only present for apps).
   */
  String get appLaunchUrl => proxy['appLaunchUrl'];

  /**
   * The URL of the homepage of this extension, app, or theme.
   */
  String get homepageUrl => proxy['homepageUrl'];

  /**
   * The update URL of this extension, app, or theme.
   */
  String get updateUrl => proxy['updateUrl'];

  /**
   * Whether the extension, app, or theme declares that it supports offline.
   */
  bool get offlineEnabled => proxy['offlineEnabled'];

  /**
   * The url for the item's options page, if it has one.
   */
  String get optionsUrl => proxy['optionsUrl'];

  /**
   * A list of icon information. Note that this just reflects what was declared
   * in the manifest, and the actual image at that url may be larger or smaller
   * than what was declared, so you might consider using explicit width and
   * height attributes on img tags referencing these images. See the [manifest
   * documentation on icons](manifest/icons.html) for more details.
   */
  List<IconInfo> get icons => listify(proxy['icons'], IconInfo.create);

  /**
   * Returns a list of API based permissions.
   */
  List<String> get permissions => listify(proxy['permissions']);

  /**
   * Returns a list of host based permissions.
   */
  List<String> get hostPermissions => listify(proxy['hostPermissions']);

  /**
   * How the extension was installed. One of<br>[admin]: The extension was
   * installed because of an administrative policy,<br>[development]: The
   * extension was loaded unpacked in developer mode,<br>[normal]: The extension
   * was installed normally via a .crx file,<br>[sideload]: The extension was
   * installed by other software on the machine,<br>[other]: The extension was
   * installed by other means.
   */
  String get installType => proxy['installType'];
}
