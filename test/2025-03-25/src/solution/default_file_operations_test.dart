import 'dart:io';

import 'package:test/test.dart';

import '../../../../assignments/2025-03-25/src/solution/default_file_operations.dart';

void main() {
  test('DefaultFileOperations', () {
    // 테스트를 위한 임시 파일 생성
    final originalPath = 'test_temp_original.txt';
    final copyPath = 'test_temp_copy.txt';
    final originalFile = File(originalPath);
    originalFile.writeAsStringSync('테스트 내용');

    // 파일 복사 기능 호출
    final fileOperations = DefaultFileOperations();
    fileOperations.copy(originalPath, copyPath);

    // 내용 비교
    final copiedFile = File(copyPath);
    expect(originalFile.readAsStringSync(), copiedFile.readAsStringSync());

    // 테스트 후 임시 파일 정리
    originalFile.deleteSync();
    copiedFile.deleteSync();
  });
}
