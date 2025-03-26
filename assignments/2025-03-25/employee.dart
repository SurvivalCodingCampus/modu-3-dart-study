class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];
}
