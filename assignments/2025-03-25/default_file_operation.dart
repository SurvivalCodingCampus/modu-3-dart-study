import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    File sourceFile = File(sourcePath);
    sourceFile.copy(targetPath);
  }
}