import 'dart:io';

void main() {
  final myFile = File(
    r'C:\Users\82105\Desktop\flutter\modu-3-dart-study\lib\mar\2025-03-25\my_file.txt',
  );

  myFile.writeAsStringSync('Hello, world');

  final text = myFile.readAsStringSync();
  print(text);
}
