
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/exam/default_file_operations.dart';
import 'package:test/test.dart';

void main() {
  final sourcePath = 'test/2025-03-25/test.txt';
  final targetPath = 'test/2025-03-25/test_copy.txt';
  final content = 'test';

  // 테스트 전에 수행되어야 하는 코드
  final File file = File(sourcePath);

  final FileOperations fileOperations = DefaultFileOperations();

  setUp(() {
    // 테스트용 파일 작성
    file.writeAsStringSync(content);
  });

  test('존재하지 않는 파일 복사 시 예외 발생', () {
    fileOperations.copy(sourcePath, targetPath);

    final File targetFile = File(targetPath);
    expect(targetFile.readAsStringSync() == content, isTrue);
  });

  test('존재하지 않는 파일 복사 시 예외 발생', () {
    expect(() => fileOperations.copy('123123', targetPath), throwsException);
  });

  // 테스트 끝나고 수행되어야 하는 코드
  tearDown(() {
    // 테스트용 파일 삭제
    file.deleteSync();
    File(targetPath).deleteSync();
  });
}