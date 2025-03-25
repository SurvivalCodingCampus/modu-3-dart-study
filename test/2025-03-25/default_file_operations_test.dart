import 'package:flutter_test/flutter_test.dart';
import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';

void main() {

  DefaultFileOperations defaultFileOperations = DefaultFileOperations();
  

  try {

    defaultFileOperations.copy(sourcePath, targetPath);

  } catch (e) {
    print('파일 복사 오류 발생 : $e');
  }
}