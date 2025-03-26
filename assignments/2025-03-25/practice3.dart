import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }
}

void main() {
  final employee = Employee('홍길동', 41);
  final department = Department('총무부', employee);
  Map<String, dynamic> json = department.toJson();
  String jsonString = jsonEncode(json);
  const filePath =
      '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-25';
  File file = File('$filePath/company.txt');
  file.writeAsStringSync(jsonString);

  // 역직렬화
  final Map<String, dynamic> data = jsonDecode(jsonString);
  final Employee employee2 = Employee.fromJson(data['leader']);
  final Department department2 = Department.fromJson(data);
  print(employee2.name);
  print(department2.leader);
}

/// 총무부 리더 '홍길동(41세)'의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 저장하는 프로그램을 작성
/// 직렬화를 위해 위의 2개 클래스를 일부 수정하시오.
