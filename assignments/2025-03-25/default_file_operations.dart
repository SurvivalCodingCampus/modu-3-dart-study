import 'dart:io';

import 'file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    // sourcePath : 복사할 원본 파일의 경로
    // targetPath : 파일이 복사될 대상의 경로
    try {
      // 1.  복사할 파일의 확장자와 이름 가져오기
      // 1-1 복사대상의 파일이름, 확장자 가져오기
      final File originFile = File(sourcePath.trim());
      final List<String> sourcePathList = sourcePath.split('/');

      final String originFilePath = sourcePathList[sourcePathList.length - 1];
      // final String originFileName = originFilePath.split('.')[0];
      // final String originFileExtension = originFilePath.split('.')[1];
      final int lastDotIndex = originFilePath.lastIndexOf('.');
      String originFileName;
      String originFileExtension;

      if (lastDotIndex != -1) {
        // 점(.)이 있는 경우
        originFileName = originFilePath.substring(0, lastDotIndex); 
        originFileExtension = originFilePath.substring(lastDotIndex + 1); 
      } else {
        // 점(.)이 없는 경우
        originFileName = originFilePath; 
        originFileExtension = '.txt'; 
      }

      // print('파일명 : $originFileName, 확장자: $originFileExtension');
      // 1-2 복사 대상의 내용 읽어오기
      final List<int> originFileContent = originFile.readAsBytesSync();

      // 2. 복사본 파일
      // 2-1. 복사본 파일의 이름과 주소 생성 (StringBuffer)
      StringBuffer copyFileNameAndExension = StringBuffer(originFileName);
      copyFileNameAndExension.write('_copy.');
      copyFileNameAndExension.write(originFileExtension);

      String copyFilePath = '${targetPath.trim()}/$copyFileNameAndExension';

      // 2-2. 동일한 파일이름이 확인후 다른 이름의 파일 만들기  (중복 방지)
      int counter = 1;
      while (File(copyFilePath).existsSync()) {
        copyFileNameAndExension.clear();

        // 새로운 파일 이름 생성
        copyFileNameAndExension.write('${originFileName}_copy_$counter.');
        copyFileNameAndExension.write(originFileExtension);

        // 복사 파일경로수정
        copyFilePath = '${targetPath.trim()}/$copyFileNameAndExension';
        counter++;
      }

      // 2-3. 파일이 복사될 경로에 파일 만들기
      final File copyFile = File(copyFilePath);
      // 2-4. 복사 대상에 파일 넣기
      copyFile.writeAsBytesSync(originFileContent);
    } on PathNotFoundException catch (e) {
      print('오류 메시지: ${e.message}');
      print('문제 경로: ${e.path}');
      throw ArgumentError('[ArgumentError] 파일 경로를 확인해 주세요');
    } on FileSystemException catch (e) {
      print('파일 작업 중 문제가 발생했습니다:');
      print('오류 메시지: ${e.message}');
      print('문제 경로: ${e.path}');
      throw FileSystemException('[FileSystemException] 파일 작업 중 문제가 발생했습니다:');
    }
  }
}
