import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import '../../assignments/2025-03-25/department.dart';
import '../../assignments/2025-03-25/employee.dart';

void main() {
  group('JSON 파일만들기', () {
    final String jsonFilePath =
        Directory.current.path +'/assignments/2025-03-25/company.txt';

    test('객체를 JSON으로 변환', () {
      final Employee employee = Employee('홍길동', 41);
      final Department department = Department('총무부', employee);

      final Map<String, dynamic> json = department.toJson();
      final String jsonString = jsonEncode(json);

      final File companyFile = File(jsonFilePath);
      companyFile.writeAsStringSync(jsonString);

      final String fileContent = companyFile.readAsStringSync();
      final Map<String, dynamic> jsonMap = jsonDecode(fileContent);

      expect(jsonMap['name'], equals('총무부'));
      expect(jsonMap['leader']['name'], equals('홍길동'));
      expect(jsonMap['leader']['age'], equals(41));
    });

    test('JSON 데이터를 객체로 변환', () {
      final File jsonFile = File(jsonFilePath);

      final String jsonString = jsonFile.readAsStringSync();
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final Department deserializeDepartment = Department.fromJson(jsonMap);

      expect(deserializeDepartment.name, equals('총무부'));
      expect(deserializeDepartment.leader.name, equals('홍길동'));
      expect(deserializeDepartment.leader.age, equals(41));
    });
  });
}
