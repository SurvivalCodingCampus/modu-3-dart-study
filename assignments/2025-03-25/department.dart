import 'employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // 역 직렬화
  Department.fromJson (Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader};
  }

  // 직렬화, 역직렬화 후 객체 비교를 위해 ==, hashCode 재정의
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Department &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          leader == other.leader;

  @override
  int get hashCode => name.hashCode ^ leader.hashCode;

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }
}