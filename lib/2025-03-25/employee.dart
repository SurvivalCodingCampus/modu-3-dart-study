import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  // 직렬화 
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // JSON 
  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee(json['leader']['name'], json['leader']['age']); 
}

// void main() {
//   // 🔹 1. 객체 생성
//   final Employee employee = Employee('홍길동', 41);
//   final Department department = Department('총무부', employee);

//   // 🔹 2. JSON 직렬화 후 파일 저장
//   final String jsonString = jsonEncode({
//     'name': department.name,
//     'leader': department.leader.toJson() // Employee 객체 직렬화
//   });

//   final File file = File('assignments/2025-03-25/company.txt');
//   file.writeAsStringSync(jsonString);

//   // 🔹 3. 파일에서 JSON 불러와 역직렬화
//   final String loadedJson = file.readAsStringSync();
//   final Department loadedDepartment = Department.fromJson(jsonDecode(loadedJson));

//   // 🔹 4. 데이터 확인
//   print('Json 파일 불러오기');
//   print('부서: ${loadedDepartment.name}');
//   print('리더: ${loadedDepartment.leader.name} (${loadedDepartment.leader.age}세)');
// }