import 'employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() {
    return {'department_name': name, 'leader': leader.toJson()};
  }

  Department.fromJson(Map<String, dynamic> json)
    : name = json['department_name'],
      leader = Employee.fromJson(json['leader']);
}
