abstract interface class FileOperations {
  Future<void> copy(String sourcePath, String targetPath);
}
