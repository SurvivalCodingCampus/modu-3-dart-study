class Employee {
  final String name;
  final int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}
