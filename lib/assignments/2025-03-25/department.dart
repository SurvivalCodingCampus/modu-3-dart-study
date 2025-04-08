import 'employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // 역직열화
  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      // leader = json['leader'];
      leader = Employee.fromJson(json['leader']); // 역직열화

  // 직열화
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()}; // 직열화
  }
}
