import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-25/file.dart';

void main() {
  group('file 테스트', () {
    const sourcePath =
        '/Users/eastar/Documents/github/modu-3-dart-study/test/2025-03-25/source.txt';
    const targetPath =
        '/Users/eastar/Documents/github/modu-3-dart-study/test/2025-03-25/target.txt';
    final source = File(sourcePath);
    source.writeAsStringSync('Hello, world!!!');
    test('소스패스 유효하지 않을 때 테스트', () {
      final invalidSourcePath =
          '/Users/eastar/Documents/github/modu-3-dart-study/test/2025-03-25/this_is_not_source.txt';
      DefaultFileOperations fileOperations = DefaultFileOperations();
      expect(
        () => fileOperations.copy(invalidSourcePath, targetPath),
        throwsA(isA<ArgumentError>()),
      );
    });
    test('타겟패스 유효하지 않을 때 테스트', () {
      final invalidTargetPath =
          '/Users/eastar/Documents/github/modu-3-dart-study/test/2025-03-25';
      DefaultFileOperations fileOperations = DefaultFileOperations();

      expect(
        () => fileOperations.copy(sourcePath, invalidTargetPath),
        throwsA(isA<ArgumentError>()),
      );
    });
    test('파일복사 테스트', () {
      DefaultFileOperations fileOperations = DefaultFileOperations();
      fileOperations.copy(sourcePath, targetPath);
      expect(
        File(sourcePath).readAsStringSync() ==
            File(targetPath).readAsStringSync(),
        isTrue,
      );
    });
  });
}
