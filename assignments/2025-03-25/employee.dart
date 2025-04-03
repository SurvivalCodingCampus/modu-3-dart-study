import 'dart:io';

import 'department.dart';
import 'dart:convert';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  // 역직렬화
  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

void main() {
  // final String filePath =
  //     '/Users/jilong/Desktop/workspace/flutter_modu/assignments/2025-03-25';
  final String filePath = Directory.current.path + '/assignments/2025-03-25';

  final Employee hongGilDong = Employee('홍길동', 41);
  final Department hongGilDongDepartment = Department('총무부', hongGilDong);

  /* 
    직렬화 
    객체 -> json
  */
  // 1. 파일 열기
  final File companyFile = File('$filePath/company.txt');
  // 2. 객체 -> map
  Map<String, dynamic> json = hongGilDongDepartment.toJson();
  // 3. Map(Json)-> String
  String jsonString = jsonEncode(json);
  // 4. 파일로 내보내기
  companyFile.writeAsStringSync(jsonString);

  /* 
    역직렬화 
    json -> 객체로
  */
  // 1. 파일에서 JSON 문자열 읽기
  String jsonFromFile = companyFile.readAsStringSync();
  // 2. JSON 문자열 -> Map 변환
  Map<String, dynamic> jsonMap = jsonDecode(jsonFromFile);
  // 3. Map -> Department 객체 생성
  Department deserializedUser = Department.fromJson(jsonMap);

  print(deserializedUser);
}
