chrome_gen.dart
==============

An *experimental* library for accessing the Chrome APIs in a packaged app or
extension.

<!--
[![Build Status](https://drone.io/github.com/devoncarew/chrome_gen.dart/status.png)](https://drone.io/github.com/devoncarew/chrome_gen.dart/latest)
-->

<!--
### Documentation
Generated documentation is available:
- [Chrome Apps API](http://devoncarew.github.io/chrome_gen.dart/app/)
- [Chrome Extensions API](http://devoncarew.github.io/chrome_gen.dart/ext/)
-->

### Running
From the project directory, run:

`dart tool/gen_apis.dart`

This will:
- read `meta/apis.json` and `meta/overrides.json`
- parse the cooresponding `idl/*.json` and `idl/*.idl` files
- generate `lib/chrome_app.dart`, `lib/chrome_ext.dart`, and `lib/gen/*.dart`.
