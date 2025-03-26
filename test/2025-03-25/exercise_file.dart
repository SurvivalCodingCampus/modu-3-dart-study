import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/exercise_file.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  String sourcePath = 'lib/2025-03-25/exercise_file_txt';
  String targetPath = 'lib/2025-03-25/exercise_file_1_txt';

  DefaultFileOperations defaultFileOperations = DefaultFileOperations();
  defaultFileOperations.copy(sourcePath, targetPath);

  test('File copy Test', () {
    File(targetPath).deleteSync(recursive: true);
    DefaultFileOperations().copy(sourcePath, targetPath);

    expect(File(targetPath).existsSync(), isTrue);

    String origin = File(sourcePath).readAsStringSync();
    String copy = File(targetPath).readAsStringSync();
    expect(copy, equals(origin));
  });
}
