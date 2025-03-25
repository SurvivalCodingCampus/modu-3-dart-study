import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-25/department.dart';
import '../../assignments/2025-03-25/employee.dart';

void main() {
  const String employeeName = 'me';
  const int employeeInt = 27;
  const String departmentName = 'Flutter';
  const String jsonFileName = 'company.txt';

  group('Json : ', () {
    test('to Json', () {
      try {
        Employee employee = Employee(employeeName, employeeInt);
        Department department = Department(departmentName, employee);

        final File company = File(jsonFileName);
        final String content = jsonEncode(department.toJson());
        company.writeAsStringSync(content);

        expect(company.existsSync(), isTrue);
        expect(company.readAsStringSync(), content);
      } on FileSystemException catch (e) {
        throw ArgumentError('파일 작성 중 오류 발생: ${e.message}');
      } catch (e) {
        print('예상치 못한 오류: $e');
      }
    });
    test('from Json', () {
      try {
        final File company = File(jsonFileName);

        // 파일이 없으면 테스트를 위해 생성
        if (!company.existsSync()) {
          Employee employee = Employee(employeeName, employeeInt);
          Department department = Department(departmentName, employee);
          final String content = jsonEncode(department.toJson());
          company.writeAsStringSync(content);
        }

        final String companyString = company.readAsStringSync();
        final Map<String, dynamic> companyJson = jsonDecode(companyString);

        Department department = Department.fromJson(companyJson);

        expect(department, isA<Department>());
        expect(department.name, departmentName);
        expect(department.leader.name, employeeName);
        expect(department.leader.age, employeeInt);

        // 테스트 완료 후 파일 정리
        if (company.existsSync()) {
          company.deleteSync();
        }
      } on PathNotFoundException {
        throw ArgumentError('그런 파일 없수다.');
      } catch (e) {
        print(e);
      }
    });
  });
}
