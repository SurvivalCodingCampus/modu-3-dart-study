import 'dart:convert';
import 'dart:io';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-25/company.dart';

void main() {
  test('company test', () {
    Employee leader = Employee('홍길동', 41);
    Department department = Department('총무부', leader);

    String jsonText = jsonEncode(department.toJson());

    final file = File(
      r'C:\Users\82105\Desktop\flutter\modu-3-dart-study\playground\mar\2025-03-25\company.txt',
    );

    file.writeAsStringSync(jsonText);

    expect(file.existsSync(), isTrue);

    final newJsonText = file.readAsStringSync();
    final text = jsonDecode(newJsonText);
    print(text);
    expect(text['department'], equals('총무부'));
    expect(text['leader_name'], equals('홍길동'));
    expect(text['leader_age'], equals(41));
  });
}
