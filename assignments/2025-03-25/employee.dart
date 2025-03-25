class Employee {
  String name;
  int age;

  Employee({required this.name, required this.age});

  //역 직렬화
  Employee.fromJson (Map<String, dynamic> json)
    : name = json['name'],
    age = json['age'];

  //직렬화
  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  // 직렬화, 역직렬화 후 객체 비교를 위해 ==, hashCode 재정의
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Employee &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
}

