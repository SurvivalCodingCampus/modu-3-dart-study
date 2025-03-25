import 'dart:io';

void main() {
  final File myfile = File('my_file.txt');

  //열고 내용 쓰기 닫기
  myfile.writeAsStringSync('hello\n', mode: FileMode.append);
  myfile.writeAsStringSync('hello\n', mode: FileMode.append);
  myfile.writeAsStringSync('hello\n', mode: FileMode.append);

  //파일에서 읽기
  final text = myfile.readAsStringSync();
  print(text);
}
