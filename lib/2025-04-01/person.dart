class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);

  Person copyWith({String? name, int? age}) {
    return Person(name ?? this.name, age ?? this.age);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}
