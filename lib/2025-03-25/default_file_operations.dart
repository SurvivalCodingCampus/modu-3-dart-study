import 'dart:io';

abstract interface class FileOperations {
// / 지정된 경로의 파일을 다른 경로로 복사합니다.
  ///
  /// [sourcePath] 복사할 원본 파일의 경로
  /// [targetPath] 파일이 복사될 대상 경로
  ///

  /// Throws [ArgumentError] 대상 경로가 유효하지 않은 경우
  void copy(String sourcePath, String targetPath);
}


class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {

    // 파일 경로 검사 및 파일 존재 여부 확인
    final sourceFile = File(sourcePath);

    // 원본 파일이 존재하는지 확인
    if (!sourceFile.existsSync()) {
      error('원본 경로에 파일이 존재하지 않음', reason: sourcePath);
    }
    // 대상 경로 검사 (대상 디렉토리 존재 여부 확인)
    final targetDirectory = Directory(targetPath).parent;
    if (!targetDirectory.existsSync()) {
      error('대상 경로가 존재하지 않음', reason: targetPath);
    }

    try {
      // 파일 복사
      sourceFile.copySync(targetPath);

      // 복사 완료 후 메시지 출력
      print ('=============================');
      print('파일 복사 완료!');
      print('=============================');
      print('원본 파일 경로: $sourcePath');
      print('복사된 파일 경로: $targetPath');
      print('=============================');
    } catch (e) {
        error('복사 실패', reason: e.toString());
    }
  }

  static void error(String message, {String reason = ''}) {
    print ('=============================');
    print('오류: $message');
    print ('=============================');
    throw PathNotFoundException('$message :', OSError(reason));
  }
}
