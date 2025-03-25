import 'dart:io';
import 'file_operations.dart';

class DefaultFileOperations implements FileOperations {
  final String current = Directory.current.path;

  @override
  void copy(String sourcePath, String targetPath) {
    File('$current/$sourcePath').copySync(targetPath);
  }
}
