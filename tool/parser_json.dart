// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

/// A library to parse web json API definitions into IDL model objects.
library parser_json;

import 'dart:convert';

import 'model_idl.dart';
import 'src/utils.dart';

/**
 * A class to parse web JSON API definitions into an [IDLNamespace] object.
 */
class JsonParser {

  JsonParser();

  IDLNamespace namespace;

  IDLNamespace parse(String jsonText) {
    namespace = new IDLNamespace();

    // pre-filter to remove line comments -
    List<String> lines = new LineSplitter().convert(jsonText);
    Iterable newLines = lines.map((String line) {
      int index = line.indexOf('//');

      // If we find // foo, we remove it from the line, unless it looks like
      // :// foo (as in, http://cheese.com).

      if (index == -1) {
        return line;
      } else if (index == 0 || line.codeUnitAt(index - 1) != 58) { // 58 == ':'
        return line.substring(0, index);
      } else {
        return line;
      }
    });

    _parseJson(JSON.decode(newLines.join('\n')));

    return namespace;
  }

  void _parseJson(dynamic json) {
    Map m = json[0];

    namespace = new IDLNamespace();

    namespace.name = m['namespace'];
    namespace.description = convertHtmlToDartdoc(m['description']);

    // functions
    if (m.containsKey('functions')) {
      for (var f in m['functions']) {
        namespace.functions.add(_parseFunction(f));
      }
    }

    // TODO: types


    // events
    if (m.containsKey('events')) {
      for (var e in m['events']) {
        namespace.events.add(_parseEvent(e));
      }
    }

    // properties
    if (m.containsKey('properties')) {
      Map properties = m['properties'];

      for (String key in properties.keys) {
        Map p = properties[key];

        // "nodoc": true
        if (true != p['nodoc']) {
          namespace.properties.add(_parseProperty(key, p));
        }
      }
    }
  }

  IDLFunction _parseFunction(f) {
    IDLFunction function = new IDLFunction(f['name'],
        convertHtmlToDartdoc(f['description']));

    if (f.containsKey('parameters')) {
      function.parameters = _parseParameters(f['parameters']);
    }

    if (f.containsKey('returns')) {
      var r = f['returns'];

      function.returnType = new IDLType.fromMap(r);
    }

    return function;
  }

  IDLEvent _parseEvent(e) {
    IDLEvent event = new IDLEvent(e['name']);

    event.description = convertHtmlToDartdoc(e['description']);

    if (e.containsKey('parameters')) {
      event.params = _parseParameters(e['parameters']);
    }

    return event;
  }

  List<IDLParameter> _parseParameters(List params) {
    List<IDLParameter> result = [];

    for (Map p in params) {
      IDLParameter param = new IDLParameter(p['name']);

      param.type = new IDLType.fromMap(p);
      if (param.type == null) {
        param.type = IDLType.VAR;
      }

      if (p.containsKey('optional')) {
        // Look for "true", and "false", as well as boolean
        if (p['optional'] is bool) {
          param.optional = p['optional'];
        } else {
          param.optional = "true" == p['optional'];
        }
      }

      param.description = convertHtmlToDartdoc(p['description']);

      if (p.containsKey('parameters')) {
        param.params = _parseParameters(p['parameters']);
      }

      result.add(param);
    }

    return result;
  }

  IDLProperty _parseProperty(String name, Map p) {
    IDLProperty property = new IDLProperty(name);
    property.description = convertHtmlToDartdoc(p['description']);

    // value
    if (p.containsKey('value')) {
      if (p['value'] is num) {
        num val = p['value'];

        if (val.toInt().toDouble() == val.toDouble()) {
          property.returnType = new IDLType('integer');
        }
      }
    }

    if (property.returnType == null) {
      property.returnType = new IDLType.fromMap(p);
    }

    return property;
  }

}
