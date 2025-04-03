import 'dart:io';

import 'file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
      final myFile = File(sourcePath);
      // 파일이 없다면 파일 생성
      createIfNotExists(myFile);
      // 파일명만 가져오기
      final fileName = myFile.path.split('/').last;
      print("fileName :$fileName");
      myFile.copySync('$targetPath$fileName');
    } catch (e) {
      throw Exception("에러가 발생하였습니다 : $e");
    }
  }

  // 파일이 없을 때 생성하는 함수
  void createIfNotExists(File file) {
    try {
      if (!file.existsSync()) {
        file.createSync();
        print("파일이 없어서 생성");
      }
    } on FileSystemException {
      print("디렉터리 주소임");
      // 만약 파일명이 아니라 디렉터리 주소일 경우,
      // 상위 메서드로 에러 던지기
      rethrow;
    }
  }

  @override
  void writeToFile(String sourcePath, String content) {
    try {
      final myFile = File(sourcePath);
      createIfNotExists(myFile);
      myFile.writeAsStringSync(
        content,
        // 파일 끝에 내용 추가
        mode: FileMode.append,
      );
    } catch (e) {
      throw Exception("글 작성중 에러 발생");
    }
  }
}
