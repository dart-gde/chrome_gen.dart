
library chrome.src.common;

import 'dart:convert';

import 'dart:async';
export 'dart:async';

import 'dart:js';
export 'dart:js';

import 'package:logging/logging.dart' as log;

export 'common_exp.dart';

final log.Logger _logger = new log.Logger('chrome_gen');

final JsObject _jsJSON = context['JSON'];

final JsObject chrome = context['chrome'];

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

dynamic apiNotAvailable(String apiName) {
  // TODO: we need a bit more warning then this - if people aren't using
  // logging, they won't see a message.
  _logger.warning('${apiName} not available.');
  _logger.info('This could be caused by a missing manifest.json permission or by running on an older version of Chrome.');

  return null;
}

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

class ChromeStreamController<T> {
  final JsObject _event;
  StreamController<T> _controller = new StreamController<T>.broadcast();
  bool _handlerAdded = false;
  Function _listener;

  ChromeStreamController.noArgs(this._event) {
    _controller = new StreamController<T>.broadcast(
        onListen: _ensureHandlerAdded, onCancel: _removeHandler);
    _listener = () {
      _controller.add(null);
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
      _event.callMethod('addListener', [_listener]);
      _handlerAdded = true;
    }
  }

  void _removeHandler() {
    if (_handlerAdded) {
      _event.callMethod('removeListener', [_listener]);
      _handlerAdded = false;
    }
  }
}
