import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-25/data.dart';

void main() {
  group('JSON 테스트', () {
    const targetPath =
        '/Users/eastar/Documents/github/modu-3-dart-study/test/2025-03-25/company.txt';
    Employee employee = Employee('홍길동', 41);
    Department department = Department('총무과', employee);
    test('toJson 테스트', () {
      final file = File(targetPath);
      file.writeAsStringSync(jsonEncode(department.toJson()));
    });
    test('fromJson 테스트', () {
      File file = File(targetPath);
      String json = file.readAsStringSync();
      Map<String, dynamic> jsonMap = jsonDecode(json);

      Department newDepartment = Department.fromJson(jsonMap);
      expect(employee.name == newDepartment.leader.name, isTrue);
      expect(employee.age == newDepartment.leader.age, isTrue);
      expect(department.name == newDepartment.name, isTrue);
      expect(employee == newDepartment.leader, isTrue);
      expect(department == newDepartment, isTrue);
    });
  });
}
