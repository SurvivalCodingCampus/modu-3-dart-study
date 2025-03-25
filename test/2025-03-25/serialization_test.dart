import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-25/department.dart';
import 'package:modu_3_dart_study/2025-03-25/employee.dart';

void main () {

  /// 직렬화 테스트

  //기본정도 셋팅
  final Employee employee = Employee(name: '홍길동', age: 41);
  final Department department = Department('인사과', employee);

  // 직렬화할 정보 확인
  print('직렬화/역직렬화 시작\n ${department.toString()}');

  // 객체 -> Map(Json)
  Map<String, dynamic> json = department.toJson();

  // Map(Json) -> String
  String jsonString = jsonEncode(json);

  // 파일에 기록
  File writeDepartmentFile = File('save_departmentInfo.json');
  writeDepartmentFile.writeAsStringSync(jsonString);


  /// 역 직렬화 테스트

  // json 파일 오픈
  File readDepartmentFile = File('save_departmentInfo.json');

  jsonString = readDepartmentFile.readAsStringSync();

  // JsonString -> Map
  json = jsonDecode(jsonString);

  // Map -> 객체
  final Department newDepartment = Department.fromJson(json);

  //print('부서명: ${newDepartment.name}, 리더: ${newDepartment.leader.name}, 나이: ${newDepartment.leader.age}');
  if (department == newDepartment)
      print('직렬화/역직렬화 성공\n ${newDepartment.toString()}');
  else
      print('직렬화/역직렬화에 실패했습니다. 데이터가 다릅니다.');



}