import 'dart:io';
import 'package:test/test.dart';
import '../../assignments/2025-03-25/file_operations.dart';

void main() {
  group('FileManager Tests', () {
    late FileManager fileManager;
    const String sourcePath = 'test_source.txt';
    const String targetPath = 'test_target.txt';
    const String testContent = 'Hello, Dart!';

    setUp(() {
      fileManager = FileManager();
      final sourceFile = File('assignments/2025-03-25/$sourcePath');
      sourceFile.createSync(recursive: true);
      sourceFile.writeAsStringSync(testContent);
    });

    tearDown(() {
      File('assignments/2025-03-25/$sourcePath').deleteSync();
      File('assignments/2025-03-25/$targetPath').deleteSync();
    });

    test('파일이 정상적으로 복사되는지 테스트', () {
      fileManager.copy(sourcePath, targetPath);
      final targetFile = File('assignments/2025-03-25/$targetPath');
      expect(targetFile.existsSync(), isTrue);
      expect(targetFile.readAsStringSync(), equals(testContent));
    });

    test('원본 파일이 없을 때 예외 발생 테스트', () {
      File('assignments/2025-03-25/$sourcePath').deleteSync(); // 원본 파일 삭제
      expect(
        () => fileManager.copy(sourcePath, targetPath),
        throwsA(isA<FileSystemException>()),
      );
    });
  });
}
