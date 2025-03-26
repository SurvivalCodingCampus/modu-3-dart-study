import 'dart:io';

void main() {
  final currentDir =
      'C:\\Users\\Ujun\\modu-3-dart-study\\assignments\\2025_03_25\\file\\';
  const originalPath = 'my_file.txt';
  const copyPath = 'my_file1.txt';

  // file directory 에 파일 생성 완료
  File myfile = File('$currentDir$originalPath');

  // 입력 완료 (덮어씀)
  myfile.writeAsStringSync('Hello, World!');
  // 추가 작성 (원본 유지)
  myfile.writeAsStringSync('Hi!', mode: FileMode.append);

  // 출력 완료
  print(myfile.readAsStringSync());

  // 파일 복사 완료
  try {
    myfile.copy('$currentDir$copyPath');
  } catch (e) {
    print('에러 발생 : $e');
  }
}
