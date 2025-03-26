abstract interface class FileOperation {
  void copy(String sourcePath, String targetPath);

  void write(String targetPath, [String contents = '']);
}
