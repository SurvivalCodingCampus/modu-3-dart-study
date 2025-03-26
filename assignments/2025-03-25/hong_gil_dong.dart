class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  @override
  String toString() => 'Employee(name: $name, age: $age)';
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  @override
  String toString() => 'Department(name: $name, leader: $leader)';
}