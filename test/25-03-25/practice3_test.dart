import 'dart:convert';
import 'dart:io';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-25/practice3.dart';

void main() {
  group('json test', () {
    test('직렬화', () {
      final employee = Employee('홍길동', 41);
      final department = Department('총무부', employee);
      Map<String, dynamic> json = department.toJson();
      String jsonString = jsonEncode(json);
      const filePath =
          '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25';
      File file = File('$filePath/company2.txt');
      file.writeAsStringSync(jsonString);
      expect(file.readAsStringSync(), jsonString);
    });
    test('역직렬화', () {
      File file = File(
        '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25/company2.txt',
      );
      String readJsonString = file.readAsStringSync();
      final Map<String, dynamic> data = jsonDecode(readJsonString);
      final Employee employee2 = Employee.fromJson(data['leader']);
      final Department department2 = Department.fromJson(data);
      //역직렬화 데이터 확인
      expect(department2.name, '총무부');
      expect(department2.leader.name, '홍길동');
      expect(department2.leader.age, 41);
      // 역직렬화 됨후, 원본 json과 다르면 안됨
      expect(readJsonString, equals(jsonEncode(department2.toJson())));
    });
  });
}
