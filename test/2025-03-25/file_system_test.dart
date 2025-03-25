import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-25/file_system.dart';

void main() {
  group('파일 시스템 : ', () {
    // given
    FileSystem fileSystem = FileSystem();
    const String originalFileName = 'test.txt';
    const String copyFileName = 'test2.txt';

    test('파일 존재', () {
      // given
      final String copyContent;
      final String originalContent;

      // when
      try {
        fileSystem.copy(originalFileName, copyFileName);
        originalContent = File(originalFileName).readAsStringSync();
        copyContent = File(copyFileName).readAsStringSync();
      } on PathNotFoundException {
        throw ArgumentError('파일이 해당 경로에 없습니다.');
      }

      // then
      expect(File(copyFileName).existsSync(), isTrue);
      expect(originalContent, copyContent);
    });
    test('파일 안 존재', () {
      // then
      expect(
        () => fileSystem.copy('test3.txt', copyFileName),
        throwsA(isArgumentError),
      );
    });
  });
  // given
}
