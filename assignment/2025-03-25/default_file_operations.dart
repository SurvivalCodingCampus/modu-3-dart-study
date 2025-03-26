import 'index.dart';

class DefaultFileOperations implements FileOperation {
  // 원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고, 버퍼링이나 에러 처리는 안 해도 된다
  @override
  void copy(String sourcePath, String targetPath) {
    final File file = File(sourcePath);
    file.copySync(targetPath);
  }

  @override
  void write(String targetPath, [String contents = '']) {
    final File file = File(targetPath);
    file.writeAsStringSync(contents);
  }
}
