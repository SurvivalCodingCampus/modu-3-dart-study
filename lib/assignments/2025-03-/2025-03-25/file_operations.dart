abstract interface class FileOperations {
  // 복사하기
  void copy(String sourcePath, String targetPath);

  // 파일에 작성하기
  void writeToFile(String sourcePath, String content);
}
