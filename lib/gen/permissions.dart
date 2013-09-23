/* This file has been generated from permissions.json - do not edit */

/**
 * Use the `chrome.permissions` API to request [declared optional
 * permissions](#manifest) at run time rather than install time, so users
 * understand why the permissions are needed and grant only those that are
 * necessary.
 */
library chrome.permissions;

import '../src/common.dart';

/// Accessor for the `chrome.permissions` namespace.
final ChromePermissions permissions = new ChromePermissions._();

class ChromePermissions {
  static final JsObject _permissions = context['chrome']['permissions'];

  ChromePermissions._();

  /**
   * Gets the extension's current set of permissions.
   * 
   * Returns:
   * The extension's active permissions.
   */
  Future<Permissions> getAll() {
    ChromeCompleter completer = new ChromeCompleter.oneArg(Permissions.create);
    _permissions.callMethod('getAll', [completer.callback]);
    return completer.future;
  }

  /**
   * Checks if the extension has the specified permissions.
   * 
   * Returns:
   * True if the extension has the specified permissions.
   */
  Future<bool> contains(Permissions permissions) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _permissions.callMethod('contains', [permissions, completer.callback]);
    return completer.future;
  }

  /**
   * Requests access to the specified permissions. These permissions must be
   * defined in the optional_permissions field of the manifest. If there are any
   * problems requesting the permissions, [runtime.lastError] will be set.
   * 
   * Returns:
   * True if the user granted the specified permissions.
   */
  Future<bool> request(Permissions permissions) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _permissions.callMethod('request', [permissions, completer.callback]);
    return completer.future;
  }

  /**
   * Removes access to the specified permissions. If there are any problems
   * removing the permissions, [runtime.lastError] will be set.
   * 
   * Returns:
   * True if the permissions were removed.
   */
  Future<bool> remove(Permissions permissions) {
    ChromeCompleter completer = new ChromeCompleter.oneArg();
    _permissions.callMethod('remove', [permissions, completer.callback]);
    return completer.future;
  }

  /**
   * Fired when the extension acquires new permissions.
   */
  Stream<Permissions> get onAdded => _onAdded.stream;

  final ChromeStreamController<Permissions> _onAdded =
      new ChromeStreamController<Permissions>.oneArg(_permissions['onAdded'], Permissions.create);

  /**
   * Fired when access to permissions has been removed from the extension.
   */
  Stream<Permissions> get onRemoved => _onRemoved.stream;

  final ChromeStreamController<Permissions> _onRemoved =
      new ChromeStreamController<Permissions>.oneArg(_permissions['onRemoved'], Permissions.create);
}

/**
 * `permissions` List of named permissions (does not include hosts or origins).
 * 
 * `origins` List of origin permissions.
 */
class Permissions extends ChromeObject {
  static Permissions create(JsObject proxy) => new Permissions(proxy);

  Permissions(JsObject proxy): super(proxy);

  /**
   * List of named permissions (does not include hosts or origins).
   */
  List<String> get permissions => listify(proxy['permissions']);

  /**
   * List of origin permissions.
   */
  List<String> get origins => listify(proxy['origins']);
}
