abstract interface class FileOperations {
  /// 지정된 경로의 파일을 다른 경로로 복사합니다.
  ///
  /// [sourecePath] 복사할 원본 파일의 경로
  /// [targetPath] 파일이 복사될 대상 경로
  ///
  /// Throws [ArgumentError] 대상 경로가 유효하지 않을 경우
  void copy(String sourcePath, String targetPath);
}

