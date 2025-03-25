import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

import '../../assignments/2025-03-25/default_file_operations.dart';

void main() {
  group('파일 테스트', () {
    // 파일 경로가 아닌 디렉토리 경로로 설정
    final sourceDirPath =
        '/Users/myung/flutter_app/modu_3/modu-3-dart-study/test/2025-03-24/';
    final targetPath =
        '/Users/myung/flutter_app/modu_3/modu-3-dart-study/test/2025-03-25/';
    final fileOperation = DefaultFileOperations();
    test("파일 복사 테스트", () {
      // 파일명 추가
      final sourcePath = sourceDirPath + 'test.txt';

      // returnsNormally => 예외가 발생하지 않으면 통과
      expect(() => fileOperation.copy(sourcePath, targetPath), returnsNormally);
    });

    test("파일 에러 테스트", () {
      expect(
        () => fileOperation.copy(sourceDirPath, targetPath),
        throwsA(isA<Exception>()),
      );
    });
  });
}
