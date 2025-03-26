import 'package:modu_3_dart_study/2025-03-25/employee.dart';

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // 직렬화. leader는 Employee 직렬화 코드 수행 후 입력
  Map<String, dynamic> toJson() {
    return {"name": name, "leader": leader.toJson()};
  }

  // 역직렬화. Employee도 다시 인스턴스 생성
  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee(json['leader']['name'], json['leader']['age']);

  // 동등성 비교 테스트를 위한 == 재정의
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
