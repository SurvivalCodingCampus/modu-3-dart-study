import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('파일 복사 테스트', () {
    const sourcePath = 'lib/2025-03-25/my_file.txt';
    const targetPath = 'lib/2025-03-25/my_file_copy.txt';

    final DefaultFileOperations defaultFileOperations = DefaultFileOperations();
    defaultFileOperations.copy(sourcePath, targetPath);

    expect(
      File(sourcePath).readAsStringSync(),
      File(targetPath).readAsStringSync(),
      reason: '원본 파일과 복사본 파일의 내용물이 같은지 체크'
    );
  });
}
