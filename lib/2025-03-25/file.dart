import 'dart:io';

void main() {
  // const filePath =
  //     '/Users/jilong/Desktop/workspace/flutter_modu/lib/2025-03-25';
  final filePath = Directory.current.path + '/lib/2025-03-25';
  
  // 파일 열기
  final File myFile = File('$filePath/my_file.txt');

  // 내용 덮어쓰기 닫기
  myFile.writeAsStringSync('Hello\n');

  // 추가쓰기
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
  myFile.writeAsStringSync('Hello\n', mode: FileMode.append);
}
