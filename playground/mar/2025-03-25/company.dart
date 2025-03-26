class Employee {
  String name;
  int age;

  Employee(this.name, this.age);
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() {
    return {
      'department': name,
      'leader_name': leader.name,
      'leader_age': leader.age,
    };
  }
}
