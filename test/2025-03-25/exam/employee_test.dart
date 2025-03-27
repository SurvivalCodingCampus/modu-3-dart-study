import 'dart:convert';

import 'package:modu_3_dart_study/2025-03-25/exam/employee.dart';
import 'package:test/test.dart';

void main() {
  final String expected =
      '''{"name":"Sales","leader":{"name":"John","age":30}}''';

  test('직렬화', () {
    final json = jsonDecode(expected);

    Employee john = Employee('John', 30);

    Department sales = Department('Sales', john);

    expect(() => jsonEncode(sales.toJson()), returnsNormally);

    expect(sales.toJson(), json);
  });

  test('역직렬화', () {
    Employee john = Employee('John', 30);
    Department sales = Department('Sales', john);

    final jsonString = jsonEncode(sales.toJson());

    final json = jsonDecode(jsonString);
    final deserializedDepartment = Department.fromJson(json);

    expect(deserializedDepartment.name, equals('Sales'));
    expect(deserializedDepartment.leader.name, equals('John'));
    expect(deserializedDepartment.leader.age, equals(30));

    expect(json, jsonDecode(expected));
  });
}
