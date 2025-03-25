import 'dart:io';
import 'package:modu_3_dart_study/2025-03-25/file_instance.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    // 1) 원본 파일 객체 생성
    final sourceFile = File(sourcePath);

    // 2) 원본 파일 내용 읽기
    final contents = sourceFile.readAsStringSync();

    // 3) 새 파일(복사 대상) 객체 생성
    final targetFile = File(targetPath);

    // 4) 복사 대상 파일에 내용 쓰기
    targetFile.writeAsStringSync(contents);

    // 5) 복사 완료 메시지
    print('$sourcePath 에서 $targetPath 로 복사 완료!');
  }
}