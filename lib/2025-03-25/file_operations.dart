import 'dart:io';

// 인터페이스 정의 (추상 클래스)
abstract interface class FileOperations {
  void copy(String sourcePath, String targetPath);
}

// FileOperations를 구현한 클래스
class FileManager implements FileOperations {
  @override
  void copy(String sourcePath, String targetPath) {
    try {
    final file = File('assignments/2025-03-25/$sourcePath');  
      // 파일이 존재하지 않으면 예외 발생
      if (!file.existsSync()) {
        throw FileSystemException('원본 파일이 존재하지 않습니다', sourcePath);
      }

      final text = file.readAsStringSync();

      final myFile = File('assignments/2025-03-25/$targetPath');
      myFile.writeAsStringSync(text);

      print('파일 복사 완료: $sourcePath → $targetPath');
    } catch (e) {
      print(e);
    }
  }
}

void main() {
  FileManager fileManager = FileManager();
  fileManager.copy('source.txt', 'target.txt');
}