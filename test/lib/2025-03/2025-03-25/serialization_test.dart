import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03/2025-03-25/department.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-25/employee.dart';
import 'package:test/test.dart';

void main() {
  test('총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 저장해야한다.', () {
    // Given
    const String path = 'test/lib/2025-03/2025-03-25/company.txt';
    final Employee gildong = Employee('홍길동', 41);
    final Department department = Department('총무부', gildong);

    // When
    final String serialized = jsonEncode(department.toJson());
    final File file = File(path);

    file.writeAsStringSync(serialized);

    // Then
    expect(file.existsSync(), isTrue);

    // After
    addTearDown(() {
      file.deleteSync();
    });
  });

  test('Department JSON 형식을 Department 인스턴스화 할 수 있어야한다.', () {
    // Given
    final Employee gildong = Employee('홍길동', 41);
    final Department department = Department('총무부', gildong);
    final String serialized = jsonEncode(department.toJson());

    // When
    final Department decoded = Department.fromJson(jsonDecode(serialized));

    // Then
    expect(decoded, isA<Department>());
    expect(decoded, equals(department));
  });

  test('Employee JSON 형식을 Employee 인스턴스화 할 수 있어야한다.', () {
    // Given
    final Employee gildong = Employee('홍길동', 41);
    final String serialized = jsonEncode(gildong.toJson());

    // When
    final Employee decoded = Employee.fromJson(jsonDecode(serialized));

    // Then
    expect(decoded, isA<Employee>());
    expect(decoded, equals(gildong));
  });
}
