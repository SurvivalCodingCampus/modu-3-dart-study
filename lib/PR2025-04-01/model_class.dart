class User {
  //final 로 선언하면 읽기만 가능 (getter 가능)
  final String name;
  final int year;

  int get age => DateTime.now().year - year;

  const User(this.name, this.year);

  User copyWith({String? name, int? year}) {
    return User(name ?? this.name, year ?? this.year);
  }

  @override
  String toString() {
    return 'User{name: $name, year: $year}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          year == other.year;

  @override
  int get hashCode => name.hashCode ^ year.hashCode;
}

void main() {
  final user = const User('name', 2000);
  final user2 = const User('name', 2000);
  //const를 붙이면 둘이 같음, 때면 다름, const가 없으면 런타임에 생성됨
  print(identical(user, user2));
}
