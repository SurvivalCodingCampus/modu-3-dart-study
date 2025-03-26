import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(sourcePath, targetPath) {
    try {
      File(sourcePath).copySync(targetPath);
    } catch (e) {
      print(e);
    }
  }
}
