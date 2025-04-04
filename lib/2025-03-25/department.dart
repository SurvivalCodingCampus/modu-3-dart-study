import 'index.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  // 역직렬화
  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      leader = Employee.fromJson(json['leader'] as Map<String, dynamic>);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          leader == other.leader;

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;
}
