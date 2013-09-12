gen_tools.dart
==============

Exploring options for code generation for the chrome apps APIs.

[![Build Status](https://drone.io/github.com/devoncarew/gen_tools.dart/status.png)](https://drone.io/github.com/devoncarew/gen_tools.dart/latest)

<!-- ### Documentation
Sample API documentation for generated code is available [here](http://devoncarew.github.io/gen_tools.dart/docs/chrome_app.html).
-->

### Running
From the project directory, run:

`dart tool/gen_apis.dart`

This will read meta/apis.json, parse the cooresponding idl/*.json and idl/*.idl
files, and generate lib/chrome_app.dart, lib/chrome_ext.dart, and lib/gen/*.dart.
