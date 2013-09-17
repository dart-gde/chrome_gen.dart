// Copyright (c) 2013, the gen_tools.dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file.

library all_test;

import 'parser_json_test.dart' as parser_json_test;
import 'src_gen_test.dart' as src_gen_test;
import 'translation_test.dart' as translation_test;
import 'utils_test.dart' as utils_test;
import 'web_idl_files_test.dart' as test_web_idl_files;
import 'web_idl_test.dart' as test_web_idl;
import 'web_idl_arrays_test.dart' as test_web_idl_arrays;
import 'web_idl_attributes_test.dart' as test_web_idl_attributes;
import 'web_idl_constants_test.dart' as test_web_idl_constants;
import 'web_idl_dictionaries_test.dart' as test_web_idl_dictionaries;
import 'web_idl_exception_definitions_test.dart' as test_web_idl_exception_definitions;
import 'web_idl_exception_on_attribute_test.dart' as test_web_idl_exception_on_attribute;
import 'web_idl_exception_raising_test.dart' as test_web_idl_exception_raising;
import 'web_idl_implements_test.dart' as test_web_idl_implements;
import 'web_idl_interface_test.dart' as test_web_idl_interface;
import 'web_idl_methods_test.dart' as test_web_idl_methods;
import 'web_idl_nullable_test.dart' as test_web_idl_nullable;
import 'web_idl_optional_parameters_test.dart' as test_web_idl_optional_parameters;
import 'web_idl_sequences_test.dart' as test_web_idl_sequences;
import 'web_idl_typedefs_test.dart' as test_web_idl_typedefs;

main() {
  parser_json_test.main();
  src_gen_test.main();
  translation_test.main();
  utils_test.main();
  test_web_idl_files.defineTests(includeWebIdl: false);
  test_web_idl.main();
  test_web_idl_arrays.main();
  test_web_idl_attributes.main();
  test_web_idl_constants.main();
  test_web_idl_dictionaries.main();
  test_web_idl_exception_definitions.main();
  test_web_idl_exception_on_attribute.main();
  test_web_idl_exception_raising.main();
  test_web_idl_implements.main();
  test_web_idl_interface.main();
  test_web_idl_methods.main();
  test_web_idl_nullable.main();
  test_web_idl_optional_parameters.main();
  test_web_idl_sequences.main();
  test_web_idl_typedefs.main();
}
