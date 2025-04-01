class Employee {
  final String name;
  final int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      age = json['age'];

  @override
  int get hashCode => Object.hash(name, age);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Employee && other.name == name && other.age == age;
  }

  Map<String, dynamic> toJson() => {"name": name, "age": age};
}
