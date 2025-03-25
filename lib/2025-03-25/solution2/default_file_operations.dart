import 'dart:io';

void main() {
  DefaultFileOperations fileClass = DefaultFileOperations();
  fileClass.copy(
    "lib/2025-03-25/solution1/try_catch.dart",
    "lib/2025-03-25/solution2/try_catch.dart",
  );
}

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    final sourceFile = File(sourcePath);
    final copyFile = File(targetPath);

    //readAsStringSync() : 파일 내용을 읽어 온다.
    //writeAsStringSync : 파일에 해당 내용을 쓴다.

    try {
      //소스파일이 존재하는지 확인
      if (!sourceFile.existsSync()) {
        return;
      }

      //디렉토리가 있는지 존재하는지 확인
      final targetDir = Directory(copyFile.parent.path);
      if (!targetDir.existsSync()) {
        targetDir.createSync(recursive: true);
      }

      copyFile.writeAsStringSync(sourceFile.readAsStringSync());

      print("파일 저장에 성공 하였습니다");
    } catch (e) {
      print("$e 파일 저장에 성공하지 못하였습니다");
    }
  }
}
