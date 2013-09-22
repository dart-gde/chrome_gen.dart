// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

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
