import 'dart:io';
import 'package:modu_3_dart_study/PR2025-03-25/filecopy.dart';
import 'package:test/test.dart';

void main() {
  test('원본과 복사된 파일이 같은지 확인하는 Test', () {
    final fileCopy = FileCopy(
      sourcePath:
          'C:/Users/gomti/DartCamp/modu-3-dart-study/lib/PR2025-03-25/my_originalFile.txt',
      targetPath:
          'C:/Users/gomti/DartCamp/modu-3-dart-study/lib/PR2025-03-25/my_copyFile.txt',
    );
    //FileCopy의 메서드 copy 실행
    fileCopy.copy(fileCopy.sourcePath, fileCopy.targetPath);
    //두개 읽어서 같은지 비교
    final originalFile = File(fileCopy.sourcePath);
    final copiedFile = File(fileCopy.targetPath);
    expect(originalFile.readAsStringSync(), copiedFile.readAsStringSync());
  });
}
