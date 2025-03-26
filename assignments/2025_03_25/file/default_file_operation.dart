import 'dart:io';
import 'file_operation.dart';

class DefaultFileOperation implements FileOperation {
  @override
  void copy(String sourcePath, String targetPath) {
    final File originalFile = File(sourcePath);
    originalFile.copySync(targetPath);
  }
}
