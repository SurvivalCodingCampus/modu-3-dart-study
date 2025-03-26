import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final File sourceFile = File(sourcePath);
    final File copiedFile = sourceFile.copySync(targetPath); // 복사 실행
    print('${copiedFile.path}에 복사되었습니다.');
  }
}
