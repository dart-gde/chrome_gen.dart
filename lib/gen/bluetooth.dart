/* This file has been generated from bluetooth.idl - do not edit */

/**
 * 
 */
library chrome.bluetooth;

import '../src/common.dart';

/// Accessor for the `chrome.bluetooth` namespace.
final ChromeBluetooth bluetooth = new ChromeBluetooth._();

class ChromeBluetooth {
  static final JsObject _bluetooth = context['chrome']['bluetooth'];

  ChromeBluetooth._();

  Future addProfile(Profile profile) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('addProfile', [profile, completer.callback]);
    return completer.future;
  }

  Future removeProfile(Profile profile) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('removeProfile', [profile, completer.callback]);
    return completer.future;
  }

  Future getAdapterState() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getAdapterState', [completer.callback]);
    return completer.future;
  }

  Future getDevices(GetDevicesOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getDevices', [options, completer.callback]);
    return completer.future;
  }

  Future getProfiles(GetProfilesOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getProfiles', [options, completer.callback]);
    return completer.future;
  }

  Future getServices(GetServicesOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getServices', [options, completer.callback]);
    return completer.future;
  }

  Future connect(ConnectOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('connect', [options, completer.callback]);
    return completer.future;
  }

  Future disconnect(DisconnectOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('disconnect', [options, completer.callback]);
    return completer.future;
  }

  Future read(ReadOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('read', [options, completer.callback]);
    return completer.future;
  }

  Future write(WriteOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('write', [options, completer.callback]);
    return completer.future;
  }

  Future getLocalOutOfBandPairingData() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getLocalOutOfBandPairingData', [completer.callback]);
    return completer.future;
  }

  Future setOutOfBandPairingData(SetOutOfBandPairingDataOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('setOutOfBandPairingData', [options, completer.callback]);
    return completer.future;
  }

  Future startDiscovery(StartDiscoveryOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('startDiscovery', [options, completer.callback]);
    return completer.future;
  }

  Future stopDiscovery() {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('stopDiscovery', [completer.callback]);
    return completer.future;
  }

  Stream<AdapterState> get onAdapterStateChanged => _onAdapterStateChanged.stream;

  final ChromeStreamController<AdapterState> _onAdapterStateChanged =
      new ChromeStreamController<AdapterState>.oneArg(_bluetooth['onAdapterStateChanged'], selfConverter);

  Stream<Socket> get onConnection => _onConnection.stream;

  final ChromeStreamController<Socket> _onConnection =
      new ChromeStreamController<Socket>.oneArg(_bluetooth['onConnection'], selfConverter);
}

class AdapterState extends ChromeObject {
  static AdapterState create(JsObject proxy) => new AdapterState(proxy);

  AdapterState(JsObject proxy): super(proxy);
}

class Device extends ChromeObject {
  static Device create(JsObject proxy) => new Device(proxy);

  Device(JsObject proxy): super(proxy);
}

class Profile extends ChromeObject {
  static Profile create(JsObject proxy) => new Profile(proxy);

  Profile(JsObject proxy): super(proxy);
}

class ServiceRecord extends ChromeObject {
  static ServiceRecord create(JsObject proxy) => new ServiceRecord(proxy);

  ServiceRecord(JsObject proxy): super(proxy);
}

class Socket extends ChromeObject {
  static Socket create(JsObject proxy) => new Socket(proxy);

  Socket(JsObject proxy): super(proxy);
}

class OutOfBandPairingData extends ChromeObject {
  static OutOfBandPairingData create(JsObject proxy) => new OutOfBandPairingData(proxy);

  OutOfBandPairingData(JsObject proxy): super(proxy);
}

class GetDevicesOptions extends ChromeObject {
  static GetDevicesOptions create(JsObject proxy) => new GetDevicesOptions(proxy);

  GetDevicesOptions(JsObject proxy): super(proxy);
}

class GetProfilesOptions extends ChromeObject {
  static GetProfilesOptions create(JsObject proxy) => new GetProfilesOptions(proxy);

  GetProfilesOptions(JsObject proxy): super(proxy);
}

class GetServicesOptions extends ChromeObject {
  static GetServicesOptions create(JsObject proxy) => new GetServicesOptions(proxy);

  GetServicesOptions(JsObject proxy): super(proxy);
}

class ConnectOptions extends ChromeObject {
  static ConnectOptions create(JsObject proxy) => new ConnectOptions(proxy);

  ConnectOptions(JsObject proxy): super(proxy);
}

class DisconnectOptions extends ChromeObject {
  static DisconnectOptions create(JsObject proxy) => new DisconnectOptions(proxy);

  DisconnectOptions(JsObject proxy): super(proxy);
}

class ReadOptions extends ChromeObject {
  static ReadOptions create(JsObject proxy) => new ReadOptions(proxy);

  ReadOptions(JsObject proxy): super(proxy);
}

class WriteOptions extends ChromeObject {
  static WriteOptions create(JsObject proxy) => new WriteOptions(proxy);

  WriteOptions(JsObject proxy): super(proxy);
}

class SetOutOfBandPairingDataOptions extends ChromeObject {
  static SetOutOfBandPairingDataOptions create(JsObject proxy) => new SetOutOfBandPairingDataOptions(proxy);

  SetOutOfBandPairingDataOptions(JsObject proxy): super(proxy);
}

class StartDiscoveryOptions extends ChromeObject {
  static StartDiscoveryOptions create(JsObject proxy) => new StartDiscoveryOptions(proxy);

  StartDiscoveryOptions(JsObject proxy): super(proxy);
}
