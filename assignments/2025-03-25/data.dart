import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  const targetPath =
      '/Users/eastar/Documents/github/modu-3-dart-study/assignments/2025-03-25/gildong.txt';
  Employee employee = Employee('홍길동', 41);
  Department department = Department('총무과', employee);
  final file = File(targetPath);
  file.writeAsStringSync(jsonEncode(department.toJson()));
}

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }
}
