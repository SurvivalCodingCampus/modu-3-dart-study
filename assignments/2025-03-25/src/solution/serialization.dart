// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);
}

void main() {
  final employee = Employee(name: '홍길동', age: 41);

  print(employee.toJson());

  final department = Department(name: '총무부', leader: employee);

  print(department.toJson());
  print(jsonEncode(department));

  final json = jsonEncode(department);

  final decodedJson = jsonDecode(json);

  print(decodedJson);

  print(Employee.fromJson(employee.toJson()));
}
