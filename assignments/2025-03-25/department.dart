import 'employee.dart';

class Department {
  String departmentName;
  Employee leader;

  Department(this.departmentName, this.leader);

  Map<String, dynamic> toJson() => {
    'departmentName': departmentName,
    'leader': leader.toJson(),
  };

  Department.fromJson(Map<String, dynamic> json)
    : departmentName = json['departmentName'],
      leader = Employee.fromJson(json['leader']);

  @override
  String toString() {
    return 'department name: $departmentName,\nleader employee : ${leader.toString()}';
  }
}
