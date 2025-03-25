import 'dart:io';
import 'file_operations.dart';

class FileCopy implements FileOperations {
  String sourcePath;
  String targetPath;

  @override
  void copy(String sourcePath, String targetPath) {
    final sourceFile = File(sourcePath);
    final targetFile = File(targetPath);
    targetFile.writeAsStringSync(sourceFile.readAsStringSync());
  }

  FileCopy({required this.sourcePath, required this.targetPath});
}
