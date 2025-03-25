import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final String path = 'assignments/2025-03-25/src/solution';
    final sourceFile = File('$path/$sourcePath');
    final targetFile = File('$path/$targetPath');

    final contents = sourceFile.readAsStringSync();

    targetFile.writeAsStringSync(contents);
  }
}

void main() {
  final defaultFileOperations = DefaultFileOperations();

  String sourcePath = 'exception.dart';
  String targetPath = 'exception_copy.dart';

  defaultFileOperations.copy(sourcePath, targetPath);
}
