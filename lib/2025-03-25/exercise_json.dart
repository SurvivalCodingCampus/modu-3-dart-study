class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() {
    return {'name': name, 'leader': leader.toJson()};
  }

  Department.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      leader = Employee.fromJson(json['leader']);
}
