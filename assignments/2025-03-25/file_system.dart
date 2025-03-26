import 'dart:io';

import 'file_operations.dart';

class FileSystem implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
      final File originalFile = File(sourcePath);

      originalFile.copySync(targetPath);
    } on PathNotFoundException {
      throw ArgumentError('파일이 해당 경로에 없습니다.');
    }
  }
}
