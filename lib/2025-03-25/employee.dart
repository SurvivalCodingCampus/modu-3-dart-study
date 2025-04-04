class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  // 직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  // 역직렬화
  Employee.fromJson(Map<String, dynamic> json)
    : name = json['name'] as String,
      age = json['age'] as int;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
