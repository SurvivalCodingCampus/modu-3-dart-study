import 'dart:io';

void main() {
  final String path = '${Directory.current.path}/playground/2025-03-25/';
  final File myFile = File('$path/my_file.txt');

  myFile.writeAsStringSync('Hello', mode: FileMode.append);
  print(myFile.readAsStringSync());
}
