
import 'dart:io';

import '../../lib/build/build.dart' as build;

void main() {
  // verify execution location
  if (!new Directory('app/demo').existsSync()) {
    print('This script must be run from the project root.');
    exit(1);
  }

  // copy packages
  print('copying packages/ to app/packages/...');
  build.copyPackages(new Directory('app/demo'));

  // build with dart2js
  runProcess(
      'dart2js',
      ['app/demo/demo.dart', '--out=app/demo/demo.dart.js']);

  // clean up some clutter
  runProcess('rm', ['app/demo/demo.dart.js.deps', 'app/demo/demo.dart.js.map']);
}

void runProcess(String executable, List<String> arguments) {
  print("${executable} ${arguments.join(' ')}");

  ProcessResult result = Process.runSync(executable, arguments);

  if (result.stdout != null && !result.stdout.isEmpty) {
    print(result.stdout.trim());
  }

  if (result.stderr != null && !result.stderr.isEmpty) {
    print(result.stderr);
  }

  if (result.exitCode != 0) {
    throw new Exception(
        "${executable} failed with a return code of ${result.exitCode}");
  }
}
