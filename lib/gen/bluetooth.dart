/* This file has been generated from bluetooth.idl - do not edit */

library chrome.bluetooth;

import '../src/common.dart';

/// Accessor for the `chrome.bluetooth` namespace.
final ChromeBluetooth bluetooth = new ChromeBluetooth._();

class ChromeBluetooth {
  static final JsObject _bluetooth = context['chrome']['bluetooth'];

  ChromeBluetooth._();

  Future addProfile(Profile profile) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('addProfile', [profile, completer.callback]);
    return completer.future;
  }

  Future removeProfile(Profile profile) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('removeProfile', [profile, completer.callback]);
    return completer.future;
  }

  Future<AdapterState> getAdapterState() {
    var completer = new ChromeCompleter<AdapterState>.oneArg(AdapterState.create);
    _bluetooth.callMethod('getAdapterState', [completer.callback]);
    return completer.future;
  }

  Future getBluetoothDevices(GetBluetoothDevicesOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getBluetoothDevices', [options, completer.callback]);
    return completer.future;
  }

  Future<Profile> getProfiles(GetProfilesOptions options) {
    var completer = new ChromeCompleter<Profile>.oneArg(Profile.create);
    _bluetooth.callMethod('getProfiles', [options, completer.callback]);
    return completer.future;
  }

  Future<ServiceRecord> getServices(GetServicesOptions options) {
    var completer = new ChromeCompleter<ServiceRecord>.oneArg(ServiceRecord.create);
    _bluetooth.callMethod('getServices', [options, completer.callback]);
    return completer.future;
  }

  Future connect(ConnectOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('connect', [options, completer.callback]);
    return completer.future;
  }

  Future disconnect(DisconnectOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('disconnect', [options, completer.callback]);
    return completer.future;
  }

  Future<ArrayBuffer> read(ReadOptions options) {
    var completer = new ChromeCompleter<ArrayBuffer>.oneArg(ArrayBuffer.create);
    _bluetooth.callMethod('read', [options, completer.callback]);
    return completer.future;
  }

  Future<int> write(WriteOptions options) {
    var completer = new ChromeCompleter<int>.oneArg();
    _bluetooth.callMethod('write', [options, completer.callback]);
    return completer.future;
  }

  Future<OutOfBandPairingData> getLocalOutOfBandPairingData() {
    var completer = new ChromeCompleter<OutOfBandPairingData>.oneArg(OutOfBandPairingData.create);
    _bluetooth.callMethod('getLocalOutOfBandPairingData', [completer.callback]);
    return completer.future;
  }

  Future setOutOfBandPairingData(SetOutOfBandPairingDataOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('setOutOfBandPairingData', [options, completer.callback]);
    return completer.future;
  }

  Future startDiscovery(StartDiscoveryOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('startDiscovery', [options, completer.callback]);
    return completer.future;
  }

  Future stopDiscovery() {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('stopDiscovery', [completer.callback]);
    return completer.future;
  }

  Stream<AdapterState> get onAdapterStateChanged => _onAdapterStateChanged.stream;

  final ChromeStreamController<AdapterState> _onAdapterStateChanged =
      new ChromeStreamController<AdapterState>.oneArg(_bluetooth['onAdapterStateChanged'], AdapterState.create);

  Stream<Socket> get onConnection => _onConnection.stream;

  final ChromeStreamController<Socket> _onConnection =
      new ChromeStreamController<Socket>.oneArg(_bluetooth['onConnection'], Socket.create);
}

class AdapterState extends ChromeObject {
  static AdapterState create(JsObject proxy) => proxy == null ? null : new AdapterState.fromProxy(proxy);

  AdapterState({String address, String name, bool powered, bool available, bool discovering}) {
    if (address != null) this.address = address;
    if (name != null) this.name = name;
    if (powered != null) this.powered = powered;
    if (available != null) this.available = available;
    if (discovering != null) this.discovering = discovering;
  }

  AdapterState.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  bool get powered => proxy['powered'];
  set powered(bool value) => proxy['powered'] = value;

  bool get available => proxy['available'];
  set available(bool value) => proxy['available'] = value;

  bool get discovering => proxy['discovering'];
  set discovering(bool value) => proxy['discovering'] = value;
}

class BluetoothDevice extends ChromeObject {
  static BluetoothDevice create(JsObject proxy) => proxy == null ? null : new BluetoothDevice.fromProxy(proxy);

  BluetoothDevice({String address, String name, bool paired, bool connected}) {
    if (address != null) this.address = address;
    if (name != null) this.name = name;
    if (paired != null) this.paired = paired;
    if (connected != null) this.connected = connected;
  }

  BluetoothDevice.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  bool get paired => proxy['paired'];
  set paired(bool value) => proxy['paired'] = value;

  bool get connected => proxy['connected'];
  set connected(bool value) => proxy['connected'] = value;
}

class Profile extends ChromeObject {
  static Profile create(JsObject proxy) => proxy == null ? null : new Profile.fromProxy(proxy);

  Profile({String uuid, String name, int channel, int psm, bool requireAuthentication, bool requireAuthorization, bool autoConnect, int version, int features}) {
    if (uuid != null) this.uuid = uuid;
    if (name != null) this.name = name;
    if (channel != null) this.channel = channel;
    if (psm != null) this.psm = psm;
    if (requireAuthentication != null) this.requireAuthentication = requireAuthentication;
    if (requireAuthorization != null) this.requireAuthorization = requireAuthorization;
    if (autoConnect != null) this.autoConnect = autoConnect;
    if (version != null) this.version = version;
    if (features != null) this.features = features;
  }

  Profile.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get uuid => proxy['uuid'];
  set uuid(String value) => proxy['uuid'] = value;

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  int get channel => proxy['channel'];
  set channel(int value) => proxy['channel'] = value;

  int get psm => proxy['psm'];
  set psm(int value) => proxy['psm'] = value;

  bool get requireAuthentication => proxy['requireAuthentication'];
  set requireAuthentication(bool value) => proxy['requireAuthentication'] = value;

  bool get requireAuthorization => proxy['requireAuthorization'];
  set requireAuthorization(bool value) => proxy['requireAuthorization'] = value;

  bool get autoConnect => proxy['autoConnect'];
  set autoConnect(bool value) => proxy['autoConnect'] = value;

  int get version => proxy['version'];
  set version(int value) => proxy['version'] = value;

  int get features => proxy['features'];
  set features(int value) => proxy['features'] = value;
}

class ServiceRecord extends ChromeObject {
  static ServiceRecord create(JsObject proxy) => proxy == null ? null : new ServiceRecord.fromProxy(proxy);

  ServiceRecord({String name, String uuid}) {
    if (name != null) this.name = name;
    if (uuid != null) this.uuid = uuid;
  }

  ServiceRecord.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get name => proxy['name'];
  set name(String value) => proxy['name'] = value;

  String get uuid => proxy['uuid'];
  set uuid(String value) => proxy['uuid'] = value;
}

class Socket extends ChromeObject {
  static Socket create(JsObject proxy) => proxy == null ? null : new Socket.fromProxy(proxy);

  Socket({BluetoothDevice device, Profile profile, int id}) {
    if (device != null) this.device = device;
    if (profile != null) this.profile = profile;
    if (id != null) this.id = id;
  }

  Socket.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDevice get device => BluetoothDevice.create(proxy['device']);
  set device(BluetoothDevice value) => proxy['device'] = value;

  Profile get profile => Profile.create(proxy['profile']);
  set profile(Profile value) => proxy['profile'] = value;

  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;
}

class OutOfBandPairingData extends ChromeObject {
  static OutOfBandPairingData create(JsObject proxy) => proxy == null ? null : new OutOfBandPairingData.fromProxy(proxy);

  OutOfBandPairingData({ArrayBuffer hash, ArrayBuffer randomizer}) {
    if (hash != null) this.hash = hash;
    if (randomizer != null) this.randomizer = randomizer;
  }

  OutOfBandPairingData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  ArrayBuffer get hash => ArrayBuffer.create(proxy['hash']);
  set hash(ArrayBuffer value) => proxy['hash'] = value;

  ArrayBuffer get randomizer => ArrayBuffer.create(proxy['randomizer']);
  set randomizer(ArrayBuffer value) => proxy['randomizer'] = value;
}

class GetBluetoothDevicesOptions extends ChromeObject {
  static GetBluetoothDevicesOptions create(JsObject proxy) => proxy == null ? null : new GetBluetoothDevicesOptions.fromProxy(proxy);

  GetBluetoothDevicesOptions({Profile profile, BluetoothDeviceCallback deviceCallback}) {
    if (profile != null) this.profile = profile;
    if (deviceCallback != null) this.deviceCallback = deviceCallback;
  }

  GetBluetoothDevicesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Profile get profile => Profile.create(proxy['profile']);
  set profile(Profile value) => proxy['profile'] = value;

  BluetoothDeviceCallback get deviceCallback => BluetoothDeviceCallback.create(proxy['deviceCallback']);
  set deviceCallback(BluetoothDeviceCallback value) => proxy['deviceCallback'] = value;
}

class GetProfilesOptions extends ChromeObject {
  static GetProfilesOptions create(JsObject proxy) => proxy == null ? null : new GetProfilesOptions.fromProxy(proxy);

  GetProfilesOptions({BluetoothDevice device}) {
    if (device != null) this.device = device;
  }

  GetProfilesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDevice get device => BluetoothDevice.create(proxy['device']);
  set device(BluetoothDevice value) => proxy['device'] = value;
}

class GetServicesOptions extends ChromeObject {
  static GetServicesOptions create(JsObject proxy) => proxy == null ? null : new GetServicesOptions.fromProxy(proxy);

  GetServicesOptions({String deviceAddress}) {
    if (deviceAddress != null) this.deviceAddress = deviceAddress;
  }

  GetServicesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get deviceAddress => proxy['deviceAddress'];
  set deviceAddress(String value) => proxy['deviceAddress'] = value;
}

class ConnectOptions extends ChromeObject {
  static ConnectOptions create(JsObject proxy) => proxy == null ? null : new ConnectOptions.fromProxy(proxy);

  ConnectOptions({BluetoothDevice device, Profile profile}) {
    if (device != null) this.device = device;
    if (profile != null) this.profile = profile;
  }

  ConnectOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDevice get device => BluetoothDevice.create(proxy['device']);
  set device(BluetoothDevice value) => proxy['device'] = value;

  Profile get profile => Profile.create(proxy['profile']);
  set profile(Profile value) => proxy['profile'] = value;
}

class DisconnectOptions extends ChromeObject {
  static DisconnectOptions create(JsObject proxy) => proxy == null ? null : new DisconnectOptions.fromProxy(proxy);

  DisconnectOptions({Socket socket}) {
    if (socket != null) this.socket = socket;
  }

  DisconnectOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Socket get socket => Socket.create(proxy['socket']);
  set socket(Socket value) => proxy['socket'] = value;
}

class ReadOptions extends ChromeObject {
  static ReadOptions create(JsObject proxy) => proxy == null ? null : new ReadOptions.fromProxy(proxy);

  ReadOptions({Socket socket}) {
    if (socket != null) this.socket = socket;
  }

  ReadOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Socket get socket => Socket.create(proxy['socket']);
  set socket(Socket value) => proxy['socket'] = value;
}

class WriteOptions extends ChromeObject {
  static WriteOptions create(JsObject proxy) => proxy == null ? null : new WriteOptions.fromProxy(proxy);

  WriteOptions({Socket socket, ArrayBuffer data}) {
    if (socket != null) this.socket = socket;
    if (data != null) this.data = data;
  }

  WriteOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Socket get socket => Socket.create(proxy['socket']);
  set socket(Socket value) => proxy['socket'] = value;

  ArrayBuffer get data => ArrayBuffer.create(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class SetOutOfBandPairingDataOptions extends ChromeObject {
  static SetOutOfBandPairingDataOptions create(JsObject proxy) => proxy == null ? null : new SetOutOfBandPairingDataOptions.fromProxy(proxy);

  SetOutOfBandPairingDataOptions({String address, OutOfBandPairingData data}) {
    if (address != null) this.address = address;
    if (data != null) this.data = data;
  }

  SetOutOfBandPairingDataOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;

  OutOfBandPairingData get data => OutOfBandPairingData.create(proxy['data']);
  set data(OutOfBandPairingData value) => proxy['data'] = value;
}

class StartDiscoveryOptions extends ChromeObject {
  static StartDiscoveryOptions create(JsObject proxy) => proxy == null ? null : new StartDiscoveryOptions.fromProxy(proxy);

  StartDiscoveryOptions({BluetoothDeviceCallback deviceCallback}) {
    if (deviceCallback != null) this.deviceCallback = deviceCallback;
  }

  StartDiscoveryOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDeviceCallback get deviceCallback => BluetoothDeviceCallback.create(proxy['deviceCallback']);
  set deviceCallback(BluetoothDeviceCallback value) => proxy['deviceCallback'] = value;
}
