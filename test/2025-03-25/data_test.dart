import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-25/data.dart';

void main() {
    test('toJson 테스트',() {
      const targetPath =
      '/Users/eastar/Documents/github/modu-3-dart-study/test/2025-03-25/gildong.txt';
      Employee employee = Employee('홍길동', 41);
      Department department = Department('총무과', employee);
      final file = File(targetPath);
      file.writeAsStringSync(jsonEncode(department.toJson()));
    },);
}
