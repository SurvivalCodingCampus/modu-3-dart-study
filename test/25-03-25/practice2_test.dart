import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-25/practice2.dart';

void main() {
  group('copyFile Test', () {
    test('target 경로가 유효하지 않음.', () {
      final newFile = CopyFile();
      const sourcePath =
          '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25';
      const targetPath =
          '/Msers/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25';
      expect(
        () => newFile.copy('$sourcePath/original.txt', '$targetPath/home.txt'),
        throwsArgumentError,
      );
    });

    test('target 경로가 유효함.', () {
      final newFile = CopyFile();
      const sourcePath =
          '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25/original.txt';
      const targetPath =
          '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25/home.txt';
      expect(() => newFile.copy(sourcePath, targetPath), returnsNormally);
    });
  });
}
