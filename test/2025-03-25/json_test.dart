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
      } catch (e) {
        print('일단 에러');
      }
    });
    test('from Json', () {
      try {
        final File company = File(jsonFileName);

        final String companyString = company.readAsStringSync();
        final Map<String, dynamic> companyJson = jsonDecode(companyString);

        Department department = Department.fromJson(companyJson);

        expect(department, isA<Department>());
        expect(department.name, departmentName);
        expect(department.leader.name, employeeName);
        expect(department.leader.age, employeeInt);
      } on PathNotFoundException {
        throw ArgumentError('그런 파일 없수다.');
      } catch (e) {
        print(e);
      }
    });
  });
}
