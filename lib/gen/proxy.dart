/* This file has been generated from proxy.json - do not edit */

/**
 * Use the `chrome.proxy` API to manage Chrome's proxy settings. This API relies
 * on the [ChromeSetting prototype of the type API](types.html#ChromeSetting)
 * for getting and setting the proxy configuration.
 */
library chrome.proxy;

import 'types.dart';
import '../src/common.dart';

/// Accessor for the `chrome.proxy` namespace.
final ChromeProxy proxy = new ChromeProxy._();

class ChromeProxy {
  static final JsObject _proxy = context['chrome']['proxy'];

  ChromeProxy._();

  /**
   * Proxy settings to be used. The value of this setting is a ProxyConfig
   * object.
   */
  ChromeSetting get settings => new ChromeSetting(_proxy['settings']);

  /**
   * Notifies about proxy errors.
   */
  Stream<Map> get onProxyError => _onProxyError.stream;

  final ChromeStreamController<Map> _onProxyError =
      new ChromeStreamController<Map>.oneArg(_proxy['onProxyError'], mapify);
}

/**
 * An object encapsulating a single proxy server's specification.
 * 
 * `scheme` The scheme (protocol) of the proxy server itself. Defaults to
 * 'http'.
 * 
 * `host` The URI of the proxy server. This must be an ASCII hostname (in
 * Punycode format). IDNA is not supported, yet.
 * 
 * `port` The port of the proxy server. Defaults to a port that depends on the
 * scheme.
 */
class ProxyServer extends ChromeObject {
  static ProxyServer create(JsObject proxy) => new ProxyServer(proxy);

  ProxyServer(JsObject proxy): super(proxy);

  /**
   * The scheme (protocol) of the proxy server itself. Defaults to 'http'.
   */
  String get scheme => this.proxy['scheme'];

  /**
   * The URI of the proxy server. This must be an ASCII hostname (in Punycode
   * format). IDNA is not supported, yet.
   */
  String get host => this.proxy['host'];

  /**
   * The port of the proxy server. Defaults to a port that depends on the
   * scheme.
   */
  int get port => this.proxy['port'];
}

/**
 * An object encapsulating the set of proxy rules for all protocols. Use either
 * 'singleProxy' or (a subset of) 'proxyForHttp', 'proxyForHttps', 'proxyForFtp'
 * and 'fallbackProxy'.
 * 
 * `singleProxy` The proxy server to be used for all per-URL requests (that is
 * http, https, and ftp).
 * 
 * `proxyForHttp` The proxy server to be used for HTTP requests.
 * 
 * `proxyForHttps` The proxy server to be used for HTTPS requests.
 * 
 * `proxyForFtp` The proxy server to be used for FTP requests.
 * 
 * `fallbackProxy` The proxy server to be used for everthing else or if any of
 * the specific proxyFor... is not specified.
 * 
 * `bypassList` List of servers to connect to without a proxy server.
 */
class ProxyRules extends ChromeObject {
  static ProxyRules create(JsObject proxy) => new ProxyRules(proxy);

  ProxyRules(JsObject proxy): super(proxy);

  /**
   * The proxy server to be used for all per-URL requests (that is http, https,
   * and ftp).
   */
  ProxyServer get singleProxy => new ProxyServer(this.proxy['singleProxy']);

  /**
   * The proxy server to be used for HTTP requests.
   */
  ProxyServer get proxyForHttp => new ProxyServer(this.proxy['proxyForHttp']);

  /**
   * The proxy server to be used for HTTPS requests.
   */
  ProxyServer get proxyForHttps => new ProxyServer(this.proxy['proxyForHttps']);

  /**
   * The proxy server to be used for FTP requests.
   */
  ProxyServer get proxyForFtp => new ProxyServer(this.proxy['proxyForFtp']);

  /**
   * The proxy server to be used for everthing else or if any of the specific
   * proxyFor... is not specified.
   */
  ProxyServer get fallbackProxy => new ProxyServer(this.proxy['fallbackProxy']);

  /**
   * List of servers to connect to without a proxy server.
   */
  List<String> get bypassList => listify(this.proxy['bypassList']);
}

/**
 * An object holding proxy auto-config information. Exactly one of the fields
 * should be non-empty.
 * 
 * `url` URL of the PAC file to be used.
 * 
 * `data` A PAC script.
 * 
 * `mandatory` If true, an invalid PAC script will prevent the network stack
 * from falling back to direct connections. Defaults to false.
 */
class PacScript extends ChromeObject {
  static PacScript create(JsObject proxy) => new PacScript(proxy);

  PacScript(JsObject proxy): super(proxy);

  /**
   * URL of the PAC file to be used.
   */
  String get url => this.proxy['url'];

  /**
   * A PAC script.
   */
  String get data => this.proxy['data'];

  /**
   * If true, an invalid PAC script will prevent the network stack from falling
   * back to direct connections. Defaults to false.
   */
  bool get mandatory => this.proxy['mandatory'];
}

/**
 * An object encapsulating a complete proxy configuration.
 * 
 * `rules` The proxy rules describing this configuration. Use this for
 * 'fixed_servers' mode.
 * 
 * `pacScript` The proxy auto-config (PAC) script for this configuration. Use
 * this for 'pac_script' mode.
 * 
 * `mode` 'direct' = Never use a proxy<br>'auto_detect' = Auto detect proxy
 * settings<br>'pac_script' = Use specified PAC script<br>'fixed_servers' =
 * Manually specify proxy servers<br>'system' = Use system proxy settings
 */
class ProxyConfig extends ChromeObject {
  static ProxyConfig create(JsObject proxy) => new ProxyConfig(proxy);

  ProxyConfig(JsObject proxy): super(proxy);

  /**
   * The proxy rules describing this configuration. Use this for 'fixed_servers'
   * mode.
   */
  ProxyRules get rules => new ProxyRules(this.proxy['rules']);

  /**
   * The proxy auto-config (PAC) script for this configuration. Use this for
   * 'pac_script' mode.
   */
  PacScript get pacScript => new PacScript(this.proxy['pacScript']);

  /**
   * 'direct' = Never use a proxy<br>'auto_detect' = Auto detect proxy
   * settings<br>'pac_script' = Use specified PAC script<br>'fixed_servers' =
   * Manually specify proxy servers<br>'system' = Use system proxy settings
   */
  String get mode => this.proxy['mode'];
}
