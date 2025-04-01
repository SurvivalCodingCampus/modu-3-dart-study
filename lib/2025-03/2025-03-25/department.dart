import 'package:modu_3_dart_study/2025-03/2025-03-25/employee.dart';

class Department {
  final String name;
  final Employee leader;

  Department(this.name, this.leader);

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);

  @override
  int get hashCode => Object.hash(name, leader);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Department && other.name == name && other.leader == leader;
  }

  Map<String, dynamic> toJson() => {"name": name, "leader": leader.toJson()};
}
