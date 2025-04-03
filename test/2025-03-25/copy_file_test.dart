import 'dart:io';
import 'package:test/test.dart';
import '../../assignments/2025-03-25/default_file_operations.dart';

void main() {
  final DefaultFileOperations dfo = DefaultFileOperations();
  group('copyFile만들기', () {
    test('정상적인 파일복사 ', () async {
      final String sourcePath =
          Directory.current.path + '/lib/2025-03-25/file.dart';
      final String targetPath = Directory.current.path + '/lib/2025-03-25';

      expect(
        () async => await dfo.copy(sourcePath, targetPath),
        returnsNormally,
      );
    });
    test('잘못된 복사대상파일경로', () async {
      final String wrongSourcePath =
          '/Users/jilong/Desktop/workspace/flutter_modu/lib/invalidPath/file.dart';
      final String targetPath =
          '/Users/jilong/Desktop/workspace/flutter_modu/assignments/2025-03-25';

      expect(
        () async => await dfo.copy(wrongSourcePath, targetPath),
        throwsA(
          isA<ArgumentError>().having(
            (e) => e.message,
            'message',
            contains('[ArgumentError] 파일 경로를 확인해 주세요'),
          ),
        ),
      );
    });

    test('잘못된 복사파일경로', () async {
      final String sourcePath =
          '/Users/jilong/Desktop/workspace/flutter_modu/lib/2025-03-25/file.dart';
      final String wrongTargetPath =
          '/Users/jilong/Desktop/workspace/flutter_modu/invalidTargetPath';

      expect(
        () async => await dfo.copy(sourcePath, wrongTargetPath),
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
