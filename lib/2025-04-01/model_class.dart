void main() {}

class User {
  final String name; // 모델클래스를 위한 불변 객체
  final int age;

  const User(this.name, this.age); // constant constructor

  User copyWith({String? name, int? age}) {
    return User(name ?? this.name, age ?? this.age);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'User{name: $name, age: $age}';
  }
}
