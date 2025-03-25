import 'package:test/test.dart';
import '../../assignments/2025-03-25/default_file_operations.dart';

void main() {
  final DefaultFileOperations dfo = DefaultFileOperations();
  group('copyFile만들기', () {
    test('정상적인 파일복사 ', () {
      final String sourcePath =
          '/Users/jilong/Desktop/workspace/flutter_modu/lib/2025-03-25/file.dart';
      final String targetPath =
          '/Users/jilong/Desktop/workspace/flutter_modu/assignments/2025-03-25';

      expect(() => dfo.copy(sourcePath, targetPath), returnsNormally);
    });
    test('잘못된 복사대상파일경로', () {
      final String wrongSourcePath =
          '/Users/jilong/Desktop/workspace/flutter_modu/lib/invalidPath/file.dart';
      final String targetPath =
          '/Users/jilong/Desktop/workspace/flutter_modu/assignments/2025-03-25';

      expect(
        () => dfo.copy(wrongSourcePath, targetPath),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            contains('[ArgumentError] 파일 경로를 확인해 주세요'),
          ),
        ),
      );
    });

    test('잘못된 복사파일경로', () {
      final String sourcePath =
          '/Users/jilong/Desktop/workspace/flutter_modu/lib/2025-03-25/file.dart';
      final String wrongTargetPath =
          '/Users/jilong/Desktop/workspace/flutter_modu/invalidTargetPath';

      expect(
        () => dfo.copy(sourcePath, wrongTargetPath),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            contains('[ArgumentError] 파일 경로를 확인해 주세요'),
          ),
        ),
      );
    });
  });
}
