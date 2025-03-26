import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/department.dart';
import 'package:modu_3_dart_study/2025-03-25/employee.dart';
import 'package:test/test.dart';

void main() {
  group('직렬화 및 역직렬화', () {
    const name = '홍길동';
    const departmentName = '총무부';
    const age = 41;
    const path = 'lib/2025-03-25/company.txt';
    final File file = File(path);
    final Employee employee = Employee(name, age);
    final Department department = Department(departmentName, employee);

    test('직렬화 후 company.txt 파일에 저장 테스트', () {
      // 객체 -> Map(json)
      final Map<String, dynamic> json = department.toJson();

      // Map(json) -> String
      String jsonString = jsonEncode(json);

      file.writeAsStringSync(jsonString);

      expect(
        File(path).readAsStringSync(),
        jsonString,
        reason: '직렬화 후 생성된 String과 company.txt에 저장된 값이 같은지 확인',
      );
    });
    test('직렬화 된 company.txt 파일의 역직렬화 테스트', () {
      // company.txt의 String 불러오기
      final String fileString = File(path).readAsStringSync();

      // String -> Map(json)
      final Map<String, dynamic> decodedJson = jsonDecode(fileString);

      // Map(json) -> 객체
      final Department decodedDepartment = Department.fromJson(decodedJson);
      final Employee decodedEmployee = decodedDepartment.leader;

      expect(
        decodedDepartment,
        department,
        reason: '처음 생성한 department와 복원한 decodedDepartment이 같은지 확인',
      );
      expect(
        decodedEmployee,
        employee,
        reason: '처음 생성한 employee와 복원한 decodedEmployee이 같은지 확인',
      );
    });
  });
}
