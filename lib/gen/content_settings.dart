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
  static final JsObject _contentSettings = context['chrome']['contentSettings'];

  ChromeContentSettings._();

  /**
   * Whether to allow cookies and other local data to be set by websites. One
   * of<br>[allow]: Accept cookies,<br>[block]: Block
   * cookies,<br>[session_only]: Accept cookies only for the current session.
   * <br>Default is [allow].<br>The primary URL is the URL representing the
   * cookie origin. The secondary URL is the URL of the top-level frame.
   */
  ContentSetting get cookies => ContentSetting.create(_contentSettings['cookies']);

  /**
   * Whether to show images. One of<br>[allow]: Show images,<br>[block]: Don't
   * show images. <br>Default is [allow].<br>The primary URL is the main-frame
   * URL. The secondary URL is the URL of the image.
   */
  ContentSetting get images => ContentSetting.create(_contentSettings['images']);

  /**
   * Whether to run JavaScript. One of<br>[allow]: Run JavaScript,<br>[block]:
   * Don't run JavaScript. <br>Default is [allow].<br>The primary URL is the
   * main-frame URL. The secondary URL is not used.
   */
  ContentSetting get javascript => ContentSetting.create(_contentSettings['javascript']);

  /**
   * Whether to run plug-ins. One of<br>[allow]: Run plug-ins
   * automatically,<br>[block]: Don't run plug-ins automatically. <br>Default is
   * [allow].<br>The primary URL is the main-frame URL. The secondary URL is not
   * used.
   */
  ContentSetting get plugins => ContentSetting.create(_contentSettings['plugins']);

  /**
   * Whether to allow sites to show pop-ups. One of<br>[allow]: Allow sites to
   * show pop-ups,<br>[block]: Don't allow sites to show pop-ups. <br>Default is
   * [block].<br>The primary URL is the main-frame URL. The secondary URL is not
   * used.
   */
  ContentSetting get popups => ContentSetting.create(_contentSettings['popups']);

  /**
   * Whether to allow sites to show desktop notifications. One of<br>[allow]:
   * Allow sites to show desktop notifications,<br>[block]: Don't allow sites to
   * show desktop notifications,<br>[ask]: Ask when a site wants to show desktop
   * notifications. <br>Default is [ask].<br>The primary URL is the main-frame
   * URL. The secondary URL is not used.
   */
  ContentSetting get notifications => ContentSetting.create(_contentSettings['notifications']);
}

/**
 * The only content type using resource identifiers is
 * [contentSettings.plugins.] For more information, see [Resource
 * Identifiers](contentSettings.html#resource-identifiers).
 */
class ResourceIdentifier extends ChromeObject {
  static ResourceIdentifier create(JsObject proxy) => proxy == null ? null : new ResourceIdentifier.fromProxy(proxy);

  ResourceIdentifier({String id, String description}) {
    if (id != null) this.id = id;
    if (description != null) this.description = description;
  }

  ResourceIdentifier.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * The resource identifier for the given content type.
   */
  String get id => proxy['id'];
  set id(String value) => proxy['id'] = value;

  /**
   * A human readable description of the resource.
   */
  String get description => proxy['description'];
  set description(String value) => proxy['description'] = value;
}

class ContentSetting extends ChromeObject {
  static ContentSetting create(JsObject proxy) => proxy == null ? null : new ContentSetting.fromProxy(proxy);

  ContentSetting();

  ContentSetting.fromProxy(JsObject proxy): super.fromProxy(proxy);

  /**
   * Clear all content setting rules set by this extension.
   */
  Future clear(Map details) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('clear', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Gets the current content setting for a given pair of URLs.
   */
  Future<Map> get(Map details) {
    var completer = new ChromeCompleter<Map>.oneArg(mapify);
    proxy.callMethod('get', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Applies a new content setting rule.
   */
  Future set(Map details) {
    var completer = new ChromeCompleter.noArgs();
    proxy.callMethod('set', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Returns:
   * A list of resource identifiers for this content type, or [undefined] if
   * this content type does not use resource identifiers.
   */
  Future<List<ResourceIdentifier>> getResourceIdentifiers() {
    var completer = new ChromeCompleter<List<ResourceIdentifier>>.oneArg((e) => listify(e, ResourceIdentifier.create));
    proxy.callMethod('getResourceIdentifiers', [completer.callback]);
    return completer.future;
  }
}
