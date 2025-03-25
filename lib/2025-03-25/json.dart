class Employee {
  final String name;
  final int age;

  Employee({required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }
}

class Department {
  final String name;
  final Employee leader;

  Department({required this.name, required this.leader});

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }
}
