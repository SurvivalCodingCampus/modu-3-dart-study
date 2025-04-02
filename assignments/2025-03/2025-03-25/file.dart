import 'dart:io';

void main(List<String> args) {
  const sourcePath =
      '/Users/eastar/Documents/github/modu-3-dart-study/assignments/2025-03-25/save.txt';
  const targetPath =
      '/Users/eastar/Documents/github/modu-3-dart-study/assignments/2025-03-25/copiedSave.txt';
  // final file = File('$sourcePath/save.txt');
  // file.writeAsStringSync('Hello, world!!');

  DefaultFileOperations test = DefaultFileOperations();
  test.copy(sourcePath, targetPath);
}

class DefaultFileOperations implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
      final sourceFile = File(sourcePath);
      File copiedFile = sourceFile.copySync(targetPath);
      print('복사 완료. 저장된 경로 : ${copiedFile.path}');
      if (!sourceFile.existsSync()) {
        throw ArgumentError('SourcePath가 유효하지 않습니다.');
      }
    } catch (e) {
      throw ArgumentError('TargetPath가 유효하지 않습니다.');
    }
  }
}

abstract interface class FileOperations {
  // 지정된 경로의 파일을 다른 경로로 복사합니다.

  // [sourcePath] 복사할 원본 파일의 경로
  // [targetPath] 파일이 복사될 대상 경로

  // Throws [ArgumentError] 대상 경로가 유효하지 않은 경우
  void copy(String sourcePath, String targetPath);
}
