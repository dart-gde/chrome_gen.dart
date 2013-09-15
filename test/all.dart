
library all_test;

import 'parser_json_test.dart' as parser_json_test;
import 'src_gen_test.dart' as src_gen_test;
import 'translation_test.dart' as translation_test;
import 'utils_test.dart' as utils_test;
//import 'web_idl_files_test.dart' as test_web_idl_files;
//import 'web_idl_test.dart' as test_web_idl;

main() {
  parser_json_test.main();
  src_gen_test.main();
  translation_test.main();
  utils_test.main();
  // TODO: reenable these tests
  //test_web_idl_files.main();
  //test_web_idl.main();
}
