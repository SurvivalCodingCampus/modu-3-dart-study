import 'dart:convert';

import 'package:test/test.dart';

import '../../../../assignments/2025-03-25/src/solution/serialization.dart';

void main() {
  const String name = '홍길동';
  const int age = 41;
  const String depart = '총무부';

  final employee = Employee(name: name, age: age);

  final department = Department(name: depart, leader: employee);

  group('Serialization', () {
    group('Employee', () {
      test('생성', () {
        expect(employee, isA<Employee>());
        expect(employee.name, name);
        expect(employee.age, age);
      });

      test('직렬화', () {
        final data = employee.toJson();
        expect(data, {'name': name, 'age': age});
      });

      test('역질렬화', () {
        final data = employee.toJson();
        final json = jsonEncode(data);

        expect(
          Employee.fromJson(jsonDecode(json)).toString(),
          employee.toString(),
        );
      });
    });

    group('Employee', () {
      test('생성', () {
        expect(department, isA<Department>());
        expect(department.name, depart);
        expect(department.leader, employee);
      });

      test('직렬화', () {
        final data = department.toJson();
        expect(data, {
          'name': depart,
          'leader': {'name': name, 'age': age},
        });
      });

      test('역질렬화', () {
        final data = department.toJson();
        final json = jsonEncode(data);

        expect(
          Department.fromJson(jsonDecode(json)).toString(),
          department.toString(),
        );
      });
    });
  });
}
