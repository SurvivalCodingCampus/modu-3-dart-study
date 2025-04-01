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

  // 한번
  setUpAll(() async {
    // 테스트용 파일 작성
    await file.writeAsString(content);
  });

  // 매번
  setUp(() async {});

  test('존재하지 않는 파일 복사 시 예외 발생', () async {
    await fileOperations.copy(sourcePath, targetPath);

    final File targetFile = File(targetPath);
    expect(await targetFile.readAsString() == content, isTrue);
  });

  test('파일 복사 성공', () async {
    expect(
      () async => await fileOperations.copy('123123', targetPath),
      throwsException,
    );
  });

  // 테스트 끝나고 수행되어야 하는 코드
  tearDown(() async {});

  // 끝날 때 한 번
  tearDownAll(() async {
    // 테스트용 파일 삭제
    await file.delete();
    await File(targetPath).delete();
  });
}
