import 'dart:io';
import 'file_operations.dart';

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    if(checkFile(sourcePath)) {
      final file = File(sourcePath);
      final copyFile = file.copySync(targetPath);

      //final copyFile1 = file.copy(targetPath);

      // final copyFile2 = File(targetPath);
      // final contents = file.readAsStringSync();
      // copyFile2.writeAsStringSync(contents);

      // print(copyFile.path);
      // print(copyFile.absolute);
      // print(copyFile.hashCode);
      // print(copyFile.runtimeType);
      // print(copyFile.uri);
      print('파일 복사 완료.');
    } else {
      print('파일이 존재하지 않습니다.');
    }
  }

  bool checkFile(String path) {
    return File(path).existsSync();
  }
}

void main() {
  DefaultFileOperations fileOperations = DefaultFileOperations();
  fileOperations.copy(
      '/Users/yunsuk990/Desktop/modu/Modu_Flutter/assignments/2025-03-25/save',
      '/Users/yunsuk990/Desktop/modu/Modu_Flutter/assignments/2025-03-25/target'
  );
  // path.dart

}
