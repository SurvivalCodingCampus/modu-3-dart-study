import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/department.dart';
import 'package:modu_3_dart_study/2025-03-25/employee.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main () {

  /// 직렬화 테스트
  group('[Json 직력화/역직렬화] - ', () {

    //기본정보 셋팅
    final Employee employee = Employee(name: '홍길동', age: 41);
    final Department department = Department('인사과', employee);
    String jsonString;
    String fileName ='company.json';
    Map<String, dynamic> json;

    test('직렬화  테스트', () {

      // 직렬화할 정보 확인
      //print('직렬화/역직렬화 시작\n ${department.toString()}');

      // 객체 -> Map(Json)
      json = department.toJson();

      // Map(Json) -> String
      jsonString = jsonEncode(json);

      // 파일에 기록
      final File companyFile = File(fileName);
      companyFile.writeAsStringSync(jsonString);

      //파일존재 확인. 컨텐츠 확인
      expect(companyFile.existsSync(), isTrue);
      expect(companyFile.readAsStringSync(), jsonString);

    });

    test('역직렬화  테스트', () {

      // json 파일 오픈
      File readDepartmentFile = File(fileName);

      jsonString = readDepartmentFile.readAsStringSync();

      // JsonString -> Map
      json = jsonDecode(jsonString);

      // Map -> 객체
      final Department newDepartment = Department.fromJson(json);

      //print('부서명: ${newDepartment.name}, 리더: ${newDepartment.leader.name}, 나이: ${newDepartment.leader.age}');
      //if (department == newDepartment)
      //  print('직렬화/역직렬화 성공\n ${newDepartment.toString()}');
      //else
      //  print('직렬화/역직렬화에 실패했습니다. 데이터가 다릅니다.');

      expect(department, newDepartment);

    });

  });

}