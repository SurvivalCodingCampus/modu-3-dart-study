import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final sourceFile = File(sourcePath);
    final targetFile = File(targetPath);

    final contents = sourceFile.readAsStringSync();

    targetFile.writeAsStringSync(contents);
  }
}

void main() {
  final defaultFileOperations = DefaultFileOperations();

  final String path = 'assignments/2025-03-25/src/solution';

  String sourcePath = '$path/exception.dart';
  String targetPath = '$path/exception_copy.dart';

  defaultFileOperations.copy(sourcePath, targetPath);
}
