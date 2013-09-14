gen_tools.dart
==============

Exploring options for code generation for the chrome apps APIs.

[![Build Status](https://drone.io/github.com/devoncarew/gen_tools.dart/status.png)](https://drone.io/github.com/devoncarew/gen_tools.dart/latest)

### Documentation
Generated documentation is available:
- [Chrome Apps API](http://devoncarew.github.io/gen_tools.dart/app/)
- [Chrome Extensions API](http://devoncarew.github.io/gen_tools.dart/ext/)

### Running
From the project directory, run:

`dart tool/gen_apis.dart`

This will:
- read `meta/apis.json` and `meta/overrides.json`
- parse the cooresponding `idl/*.json` and `idl/*.idl` files
- generate `lib/chrome_app.dart`, `lib/chrome_ext.dart`, and `lib/gen/*.dart`.
