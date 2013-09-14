
library all_test;

import 'generate_dart_test.dart' as generate_dart_test;
import 'json_parser_test.dart' as json_parser_test;
import 'translation_test.dart' as translation_test;
import 'utility_test.dart' as utility_test;
import 'web_idl_files_test.dart' as test_web_idl_files;
import 'web_idl_test.dart' as test_web_idl;

main() {
  generate_dart_test.main();
  json_parser_test.main();
  translation_test.main();
  utility_test.main();
  // TODO: reenable these tests
  //test_web_idl_files.main();
  //test_web_idl.main();
}
