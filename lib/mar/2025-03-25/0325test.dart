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

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
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

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }
}

void main() {
  Employee leader = Employee(name: '홍', age: 3);
  Department department = Department(name: '총', leader: leader);
  print(department);
  String jsonText = jsonEncode(department.toJson());
  print(jsonText);
}
