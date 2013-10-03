/* This file has been generated from bluetooth.idl - do not edit */

library chrome.bluetooth;

import '../src/common.dart';

/// Accessor for the `chrome.bluetooth` namespace.
final ChromeBluetooth bluetooth = (ChromeBluetooth._bluetooth == null ? null : new ChromeBluetooth._());

class ChromeBluetooth {
  static final JsObject _bluetooth = context['chrome']['bluetooth'];

  ChromeBluetooth._();

  /**
   * These functions all report failures via chrome.runtime.lastError. Registers
   * the JavaScript application as an implementation for the given Profile; if a
   * channel or PSM is specified, the profile will be exported in the host's SDP
   * and GATT tables and advertised to other devices.
   */
  Future addProfile(Profile profile) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('addProfile', [profile, completer.callback]);
    return completer.future;
  }

  /**
   * Unregisters the JavaScript application as an implementation for the given
   * Profile; only the uuid field of the Profile object is used.
   */
  Future removeProfile(Profile profile) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('removeProfile', [profile, completer.callback]);
    return completer.future;
  }

  /**
   * Get information about the Bluetooth adapter.
   * [callback] : Called with an AdapterState object describing the adapter
   * state.
   */
  Future<AdapterState> getAdapterState() {
    var completer = new ChromeCompleter<AdapterState>.oneArg(_createAdapterState);
    _bluetooth.callMethod('getAdapterState', [completer.callback]);
    return completer.future;
  }

  /**
   * Get a bluetooth devices known to the system.  Known devices are either
   * currently paired, or have been paired in the past.
   * [options]  : Controls which devices are returned and provides             
   * [deviceCallback], which is called for each matching device.
   * [callback] : Called when the search is completed.             
   * [options.deviceCallback] will not be called after             
   * [callback] has been called.
   */
  Future getBluetoothDevices(GetBluetoothDevicesOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('getBluetoothDevices', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the set of exported profiles for the device specified in options.
   * This function will not initiate a connection to the remote device.
   */
  Future<Profile> getProfiles(GetProfilesOptions options) {
    var completer = new ChromeCompleter<Profile>.oneArg(_createProfile);
    _bluetooth.callMethod('getProfiles', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Get a list of services provided by a device.
   */
  Future<ServiceRecord> getServices(GetServicesOptions options) {
    var completer = new ChromeCompleter<ServiceRecord>.oneArg(_createServiceRecord);
    _bluetooth.callMethod('getServices', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Connect to a service on a device.
   * [options]  : The options for the connection.
   * [callback] : Called to indicate success or failure.
   */
  Future connect(ConnectOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('connect', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Close a Bluetooth connection.
   * [options]  : The options for this function.
   * [callback] : Called to indicate success or failure.
   */
  Future disconnect(DisconnectOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('disconnect', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Read data from a Bluetooth connection.
   * [options]  : The options for this function.
   * [callback] : Called with the data when it is available.
   */
  Future<ArrayBuffer> read(ReadOptions options) {
    var completer = new ChromeCompleter<ArrayBuffer>.oneArg(_createArrayBuffer);
    _bluetooth.callMethod('read', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Write data to a Bluetooth connection.
   * [options]  : The options for this function.
   * [callback] : Called with the number of bytes written.
   */
  Future<int> write(WriteOptions options) {
    var completer = new ChromeCompleter<int>.oneArg();
    _bluetooth.callMethod('write', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Get the local Out of Band Pairing data.
   * [callback] : Called with the data.
   */
  Future<OutOfBandPairingData> getLocalOutOfBandPairingData() {
    var completer = new ChromeCompleter<OutOfBandPairingData>.oneArg(_createOutOfBandPairingData);
    _bluetooth.callMethod('getLocalOutOfBandPairingData', [completer.callback]);
    return completer.future;
  }

  /**
   * Set the Out of Band Pairing data for a remote device. Any previous Out Of
   * Band Pairing Data for this device is overwritten.
   * [options]  : The options for this function.
   * [callback] : Called to indicate success or failure.
   */
  Future setOutOfBandPairingData(SetOutOfBandPairingDataOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('setOutOfBandPairingData', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Start discovery. Discovered devices will be returned via the
   * [onBluetoothDeviceDiscovered] callback.  Discovery will fail to start if it is
   * already in progress.  Discovery can be resource intensive: stopDiscovery
   * should be called as soon as possible.
   * [options]  : The options for this function.
   * [callback] : Called to indicate success or failure.
   */
  Future startDiscovery(StartDiscoveryOptions options) {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('startDiscovery', [options, completer.callback]);
    return completer.future;
  }

  /**
   * Stop discovery.
   * [callback] : Called to indicate success or failure.
   */
  Future stopDiscovery() {
    var completer = new ChromeCompleter.noArgs();
    _bluetooth.callMethod('stopDiscovery', [completer.callback]);
    return completer.future;
  }

  Stream<AdapterState> get onAdapterStateChanged => _onAdapterStateChanged.stream;

  final ChromeStreamController<AdapterState> _onAdapterStateChanged =
      new ChromeStreamController<AdapterState>.oneArg(_bluetooth['onAdapterStateChanged'], _createAdapterState);

  Stream<Socket> get onConnection => _onConnection.stream;

  final ChromeStreamController<Socket> _onConnection =
      new ChromeStreamController<Socket>.oneArg(_bluetooth['onConnection'], _createSocket);
}

class AdapterState extends ChromeObject {

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

  Socket({BluetoothDevice device, Profile profile, int id}) {
    if (device != null) this.device = device;
    if (profile != null) this.profile = profile;
    if (id != null) this.id = id;
  }

  Socket.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDevice get device => _createBluetoothDevice(proxy['device']);
  set device(BluetoothDevice value) => proxy['device'] = value;

  Profile get profile => _createProfile(proxy['profile']);
  set profile(Profile value) => proxy['profile'] = value;

  int get id => proxy['id'];
  set id(int value) => proxy['id'] = value;
}

class OutOfBandPairingData extends ChromeObject {

  OutOfBandPairingData({ArrayBuffer hash, ArrayBuffer randomizer}) {
    if (hash != null) this.hash = hash;
    if (randomizer != null) this.randomizer = randomizer;
  }

  OutOfBandPairingData.fromProxy(JsObject proxy): super.fromProxy(proxy);

  ArrayBuffer get hash => _createArrayBuffer(proxy['hash']);
  set hash(ArrayBuffer value) => proxy['hash'] = value;

  ArrayBuffer get randomizer => _createArrayBuffer(proxy['randomizer']);
  set randomizer(ArrayBuffer value) => proxy['randomizer'] = value;
}

class GetBluetoothDevicesOptions extends ChromeObject {

  GetBluetoothDevicesOptions({Profile profile, BluetoothDeviceCallback deviceCallback}) {
    if (profile != null) this.profile = profile;
    if (deviceCallback != null) this.deviceCallback = deviceCallback;
  }

  GetBluetoothDevicesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Profile get profile => _createProfile(proxy['profile']);
  set profile(Profile value) => proxy['profile'] = value;

  BluetoothDeviceCallback get deviceCallback => _createBluetoothDeviceCallback(proxy['deviceCallback']);
  set deviceCallback(BluetoothDeviceCallback value) => proxy['deviceCallback'] = value;
}

class GetProfilesOptions extends ChromeObject {

  GetProfilesOptions({BluetoothDevice device}) {
    if (device != null) this.device = device;
  }

  GetProfilesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDevice get device => _createBluetoothDevice(proxy['device']);
  set device(BluetoothDevice value) => proxy['device'] = value;
}

class GetServicesOptions extends ChromeObject {

  GetServicesOptions({String deviceAddress}) {
    if (deviceAddress != null) this.deviceAddress = deviceAddress;
  }

  GetServicesOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get deviceAddress => proxy['deviceAddress'];
  set deviceAddress(String value) => proxy['deviceAddress'] = value;
}

class ConnectOptions extends ChromeObject {

  ConnectOptions({BluetoothDevice device, Profile profile}) {
    if (device != null) this.device = device;
    if (profile != null) this.profile = profile;
  }

  ConnectOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDevice get device => _createBluetoothDevice(proxy['device']);
  set device(BluetoothDevice value) => proxy['device'] = value;

  Profile get profile => _createProfile(proxy['profile']);
  set profile(Profile value) => proxy['profile'] = value;
}

class DisconnectOptions extends ChromeObject {

  DisconnectOptions({Socket socket}) {
    if (socket != null) this.socket = socket;
  }

  DisconnectOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Socket get socket => _createSocket(proxy['socket']);
  set socket(Socket value) => proxy['socket'] = value;
}

class ReadOptions extends ChromeObject {

  ReadOptions({Socket socket}) {
    if (socket != null) this.socket = socket;
  }

  ReadOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Socket get socket => _createSocket(proxy['socket']);
  set socket(Socket value) => proxy['socket'] = value;
}

class WriteOptions extends ChromeObject {

  WriteOptions({Socket socket, ArrayBuffer data}) {
    if (socket != null) this.socket = socket;
    if (data != null) this.data = data;
  }

  WriteOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  Socket get socket => _createSocket(proxy['socket']);
  set socket(Socket value) => proxy['socket'] = value;

  ArrayBuffer get data => _createArrayBuffer(proxy['data']);
  set data(ArrayBuffer value) => proxy['data'] = value;
}

class SetOutOfBandPairingDataOptions extends ChromeObject {

  SetOutOfBandPairingDataOptions({String address, OutOfBandPairingData data}) {
    if (address != null) this.address = address;
    if (data != null) this.data = data;
  }

  SetOutOfBandPairingDataOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  String get address => proxy['address'];
  set address(String value) => proxy['address'] = value;

  OutOfBandPairingData get data => _createOutOfBandPairingData(proxy['data']);
  set data(OutOfBandPairingData value) => proxy['data'] = value;
}

class StartDiscoveryOptions extends ChromeObject {

  StartDiscoveryOptions({BluetoothDeviceCallback deviceCallback}) {
    if (deviceCallback != null) this.deviceCallback = deviceCallback;
  }

  StartDiscoveryOptions.fromProxy(JsObject proxy): super.fromProxy(proxy);

  BluetoothDeviceCallback get deviceCallback => _createBluetoothDeviceCallback(proxy['deviceCallback']);
  set deviceCallback(BluetoothDeviceCallback value) => proxy['deviceCallback'] = value;
}

AdapterState _createAdapterState(JsObject proxy) => proxy == null ? null : new AdapterState.fromProxy(proxy);
Profile _createProfile(JsObject proxy) => proxy == null ? null : new Profile.fromProxy(proxy);
ServiceRecord _createServiceRecord(JsObject proxy) => proxy == null ? null : new ServiceRecord.fromProxy(proxy);
ArrayBuffer _createArrayBuffer(JsObject proxy) => proxy == null ? null : new ArrayBuffer.fromProxy(proxy);
OutOfBandPairingData _createOutOfBandPairingData(JsObject proxy) => proxy == null ? null : new OutOfBandPairingData.fromProxy(proxy);
Socket _createSocket(JsObject proxy) => proxy == null ? null : new Socket.fromProxy(proxy);
BluetoothDevice _createBluetoothDevice(JsObject proxy) => proxy == null ? null : new BluetoothDevice.fromProxy(proxy);
BluetoothDeviceCallback _createBluetoothDeviceCallback(JsObject proxy) => proxy == null ? null : new BluetoothDeviceCallback.fromProxy(proxy);
