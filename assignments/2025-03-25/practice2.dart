import 'dart:io';

abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath, {String? filename});
}

class CopyFile implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath, {String? filename}) {
    if (isNotExists(targetPath) && notExistsFile(targetPath)) {
      throw ArgumentError('대상 경로가 유효하지 않습니다.');
    } else if (notExistsFile(targetPath)) {
      final File file = File(sourcePath);
      final copyFile = File('$targetPath/$filename');
      copyFile.writeAsStringSync(file.readAsStringSync());
    } else {
      final File file = File(sourcePath);
      final copyFile = File(targetPath);
      copyFile.writeAsStringSync(file.readAsStringSync());
      //https://velog.io/@sinbee0402/Dart-File-Copy
    }
  }
}

bool isNotExists(String path) {
  final myDir = Directory(path);
  return !myDir.existsSync();
}

bool notExistsFile(String path) {
  final file = File(path);
  return !file.existsSync();
}
// bool isNotExists(String path) {
//   return FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound;
// }-> 파일을 기준으로 경로의 유효성 확인 -> 파일이 없을때 경로 없다고 생각해서 예외 출력

void main() {
  final newFile = CopyFile();
  const sourcePath =
      '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25/original.txt';
  const targetPath =
      '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25';
  String filename = 'home.txt';
  //없는 파일을 새로만들 때 문제 발생 -> 경로/파일명 -> 맞지 않다고 인식
  //1. 상위 디렉토리 존재여부 확인
  //2. home.txt 이름을 받는 요소 넣기 V
  newFile.copy(sourcePath, targetPath, filename: 'home.txt');
}

/// 지정된 경로의 파일을 다른 경로로 복사한다.
///
/// [sourcePath] 복사할 원본 파일의 경로
/// [targetPath] 파일이 복사될 대상 경로
///
/// Throws [ArgumentError] 대상 경로가 유효하지 않은 경우
/// 원본파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 버퍼링이나 에러 처리는 안 해도 된다.
