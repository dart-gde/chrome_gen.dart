// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/* This file has been generated from usb.idl - do not edit */

/**
 * 
 */
library chrome.usb;

import '../src/common.dart';

/// Accessor for the `chrome.usb` namespace.
final ChromeUsb usb = new ChromeUsb._();

class ChromeUsb {
  static final JsObject _usb = context['chrome']['usb'];

  ChromeUsb._();

  Future getDevices(EnumerateDevicesOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('getDevices', [options, completer.callback]);
    return completer.future;
  }

  Future requestAccess(Device device, int interfaceId) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('requestAccess', [device, interfaceId, completer.callback]);
    return completer.future;
  }

  Future openDevice(Device device) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('openDevice', [device, completer.callback]);
    return completer.future;
  }

  Future findDevices(EnumerateDevicesAndRequestAccessOptions options) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('findDevices', [options, completer.callback]);
    return completer.future;
  }

  Future closeDevice(ConnectionHandle handle) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('closeDevice', [handle, completer.callback]);
    return completer.future;
  }

  Future listInterfaces(ConnectionHandle handle) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('listInterfaces', [handle, completer.callback]);
    return completer.future;
  }

  Future claimInterface(ConnectionHandle handle, int interfaceNumber) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('claimInterface', [handle, interfaceNumber, completer.callback]);
    return completer.future;
  }

  Future releaseInterface(ConnectionHandle handle, int interfaceNumber) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('releaseInterface', [handle, interfaceNumber, completer.callback]);
    return completer.future;
  }

  Future setInterfaceAlternateSetting(ConnectionHandle handle, int interfaceNumber, int alternateSetting) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('setInterfaceAlternateSetting', [handle, interfaceNumber, alternateSetting, completer.callback]);
    return completer.future;
  }

  Future controlTransfer(ConnectionHandle handle, ControlTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('controlTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future bulkTransfer(ConnectionHandle handle, GenericTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('bulkTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future interruptTransfer(ConnectionHandle handle, GenericTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('interruptTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future isochronousTransfer(ConnectionHandle handle, IsochronousTransferInfo transferInfo) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('isochronousTransfer', [handle, transferInfo, completer.callback]);
    return completer.future;
  }

  Future resetDevice(ConnectionHandle handle) {
    ChromeCompleter completer = new ChromeCompleter.noArgs();
    _usb.callMethod('resetDevice', [handle, completer.callback]);
    return completer.future;
  }
}
