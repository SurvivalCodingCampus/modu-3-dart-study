import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/PR2025-03-25/department.dart';
import 'package:modu_3_dart_study/PR2025-03-25/employee.dart';
import 'package:test/test.dart';

void main() {
  final employee = Employee('홍길동', 41);
  final department = Department('총무부', employee);
  group('employee 클래스 test', () {
    test('employee 확인 test', () {
      expect(employee, isA<Employee>());
      expect(employee.name, equals('홍길동'));
      expect(employee.age, equals(41));
    });
  });
  group('department 클래스 test', () {
    test('department 확인 test', () {
      //직렬화
      final String jsonString = jsonEncode(department.toJson());
      //json을 map으로 변환
      final Map<String, dynamic> json = jsonDecode(jsonString);
      Department.fromJson(json);
      //company파일 생성 코드
      String path = 'test/PR2025-03-25/company.txt';
      final companyFile = File(path);
      //파일에 저장
      companyFile.writeAsStringSync(jsonString);
      //파일 읽기
      final String readJsonString = companyFile.readAsStringSync();
      expect(department, isA<Department>());
      expect(department.name, equals('총무부'));
      expect(department.leader.name, equals('홍길동'));
      expect(department.leader.age, equals(41));
      expect(readJsonString, equals(jsonString));
    });
  });
}
