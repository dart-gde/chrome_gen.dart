// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library common;

export 'dart:async';
export 'dart:js';

export 'common_exp.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:js';

JsObject _proxy;
JsObject _jsJSON = context['JSON'];

JsObject get chrome {
  if (_proxy == null) {
    _proxy = context['chrome'];
  }

  return _proxy;
}

String get lastError {
  JsObject error = chrome['runtime']['lastError'];

  return error != null ? error['message'] : null;
}

List listify(JsObject obj, [Function transformer = null]) {
  if (obj == null) {
    return null;
  } else {
    List l = new List(obj['length']);

    for (int i = 0; i < l.length; i++) {
      if (transformer != null) {
        l[i] = transformer(obj[i]);
      } else {
        l[i] = obj[i];
      }
    }

    return l;
  }
}

Map mapify(JsObject obj) {
  return JSON.decode(_jsJSON.callMethod('stringify', [obj]));
}

dynamic selfConverter(var obj) => obj;

// TODO: some chrome APIs use lastError, and some don't

/**
 * An object for handling completion callbacks that are common in the chrome.*
 * APIs.
 */
class ChromeCompleter<T> {
  final Completer<T> _completer = new Completer();
  Function _callback;

  ChromeCompleter.noArgs() {
    this._callback = () {
      var le = lastError;
      if (le != null) {
        _completer.completeError(le);
      } else {
        _completer.complete();
      }
    };
  }

  ChromeCompleter.oneArg([Function transformer]) {
    this._callback = ([arg1]) {
      var le = lastError;
      if (le != null) {
        _completer.completeError(le);
      } else {
        if (transformer != null) {
          arg1 = transformer(arg1);
        }
        _completer.complete(arg1);
      }
    };
  }

  ChromeCompleter.twoArgs(Function transformer) {
    this._callback = ([arg1, arg2]) {
      var le = lastError;
      if (le != null) {
        _completer.completeError(le);
      } else {
        _completer.complete(transformer(arg1, arg2));
      }
    };
  }

  Future<T> get future => _completer.future;

  Function get callback => _callback;
}

/**
 * Used to define a method that returns a [JsObject].
 */
typedef JsObject JsObjectFunction();

// TODO: change this over to _event using a String? 'window.onClose'?
// Or can we pass a JsObject in an ctor time?
class ChromeStreamController<T> {
  final JsObjectFunction _event;
  StreamController<T> _controller = new StreamController<T>.broadcast();
  bool _handlerAdded = false;
  Function _listener;

  ChromeStreamController.zeroArgs(this._event, Function transformer, [returnVal]) {
    _controller = new StreamController<T>.broadcast(
        onListen: _ensureHandlerAdded, onCancel: _removeHandler);
    _listener = () {
      _controller.add(transformer());
      return returnVal;
    };
  }

  ChromeStreamController.oneArg(this._event, Function transformer, [returnVal])  {
    _controller = new StreamController<T>.broadcast(
        onListen: _ensureHandlerAdded, onCancel: _removeHandler);
    _listener = ([arg1]) {
      _controller.add(transformer(arg1));
      return returnVal;
    };
  }

  ChromeStreamController.twoArgs(this._event, Function transformer, [returnVal]) {
    _controller = new StreamController<T>.broadcast(
        onListen: _ensureHandlerAdded, onCancel: _removeHandler);
    _listener = ([arg1, arg2]) {
      _controller.add(transformer(arg1, arg2));
      return returnVal;
    };
  }

  ChromeStreamController.threeArgs(this._event, Function transformer, [returnVal]) {
    _controller = new StreamController<T>.broadcast(
        onListen: _ensureHandlerAdded, onCancel: _removeHandler);
    _listener = ([arg1, arg2, arg3]) {
        _controller.add(transformer(arg1, arg2, arg3));
        return returnVal;
    };
  }

  bool get hasListener => _controller.hasListener;

  Stream<T> get stream {
    return _controller.stream;
  }

  void _ensureHandlerAdded() {
    if (!_handlerAdded) {
      _event().callMethod('addListener', [_listener]);
      _handlerAdded = true;
    }
  }

  void _removeHandler() {
    if (_handlerAdded) {
      _event().callMethod('removeListener', [_listener]);
      _handlerAdded = false;
    }
  }
}
