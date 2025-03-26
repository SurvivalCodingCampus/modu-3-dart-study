import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/exercise_json.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main () {
  Employee employee = Employee('홍길동', 41);
  Department department = Department('총무부', employee);

  String jsonToMap = jsonEncode(department.toJson());
  File file = File('lib/2025-03-25/company.txt');

  file.writeAsStringSync(jsonToMap);
  String contents = file.readAsStringSync();
  test('company.txt 데이터 검사', (){

    Map<String, dynamic> decode = jsonDecode(contents);

    expect(decode['name'], equals('총무부'));
    expect(decode['leader']['name'], equals('홍길동'));
    expect(decode['leader']['age'], equals(41));
  });
}