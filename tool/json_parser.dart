/// A library to parse web json API definitions into IDL model objects.
library json.parser;

import 'dart:convert';

import 'idl_model.dart';
import 'utility.dart';

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
      int index = line.indexOf('// ');
      return index == -1 ? line : line.substring(0, line.indexOf('// '));
    });

    _parseJson(JSON.decode(newLines.join('\n')));

    return namespace;
  }

  void _parseJson(dynamic json) {
    Map m = json[0];

    namespace = new IDLNamespace();

    namespace.name = m['namespace'];
    namespace.description = convertHtmlToDartdoc(m['description']);

    if (m.containsKey('functions')) {
      for (var f in m['functions']) {
        IDLFunction function = new IDLFunction(f['name'],
            convertHtmlToDartdoc(f['description']));

        if (f.containsKey('parameters')) {
          for (var p in f['parameters']) {
            IDLParameter param = new IDLParameter(p['name']);

            if (p.containsKey('type')) {
              param.type = new IDLType(p['type']);
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

            function.parameters.add(param);
          }
        }

        if (f.containsKey('returns')) {
          var r = f['returns'];

          function.returnType = new IDLType(r['type']);
        } else {
          function.returnType = IDLType.VOID;
        }

        namespace.functions.add(function);
      }
    }

    // TODO: types

    // TODO: events
    if (m.containsKey('events')) {
      for (var e in m['events']) {
        IDLEvent event = new IDLEvent(e['name']);
        event.description = convertHtmlToDartdoc(e['description']);
        namespace.events.add(event);
      }
    }

    // TODO: properties
    if (m.containsKey('properties')) {
      Map properties = m['properties'];
      for (var key in properties.keys) {
        IDLProperty property = new IDLProperty(key);
        Map map = properties[key];
        property.description = convertHtmlToDartdoc(map['description']);

        // value
        if (map.containsKey('value')) {
          if (map['value'] is int) {
            property.returnType = new IDLType.fromDartName('int');
          }
        }

        if (map.containsKey('type')) {
          property.returnType = new IDLType(map['type']);
        }

        // "nodoc": true
        if (true != map['nodoc']) {
          namespace.properties.add(property);
        }
      }
    }
  }

}
