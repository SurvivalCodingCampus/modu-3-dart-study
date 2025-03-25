import 'dart:io';
import 'package:modu_3_dart_study/2025-03-25/file_operations.dart';

class DefaultFileOperations implements FileOperations {

  @override
  void copy(String sourcePath, String targetPath){

    try {
      //원본 파일을 연다.
      File sourceFile = File(sourcePath);
      File targetFile = sourceFile.copySync(targetPath); //파일 복사
      print('복사 완료:${copiedFile.path}');
    } catch (e) {
      print('파일 복사 오류 발생 : $e');
    }

  }

}