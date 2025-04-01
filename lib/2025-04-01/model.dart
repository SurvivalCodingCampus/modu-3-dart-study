import 'dart:convert';

main() {
  final user = User('name', 10);
  final user2 = User('name', 10);
  // final 새로운 객체를 생성
  // const 값이 같은 객체를 한 번만 생성하고 재사용

  print(identical(user, user2));
}

// 모델 클래스는 순수하게
// 데이터를 담는 용도로만 쓴다!
class User {
  final String name;
  final int age;

  // 생성자
  // const를 붙이면?
  // 불변성을 보장하고, 메모리를 효율적으로 사용하기 위해
  const User(this.name, this.age);

  User copyWith({String? name, int? age}) {
    return User(name ?? this.name, age ?? this.age);
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'age': age});

    return result;
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(map['name'] ?? '', map['age']?.toInt() ?? 0);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() => 'User(name: $name, age: $age)';
}
