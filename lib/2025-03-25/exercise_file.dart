import 'dart:io';



abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {

  @override
  void copy(String sourcePath, String targetPath) {
    File sourceFile = File(sourcePath);

    try {
      sourceFile.copySync(targetPath);
    } catch (e) {
      print('파일 복사 실패 $e');
    }
  }
}


