class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  // 직렬화.
  Map<String, dynamic> toJson() {
    return {"name": name, "age": age};
  }

  // 동등성 비교 테스트를 위한 == 재정의
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