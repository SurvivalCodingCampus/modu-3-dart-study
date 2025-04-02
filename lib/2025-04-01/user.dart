class User {
  final String name;
  final int age;

  const User(this.name, this.age);

  @override
  String toString() => 'User(name:$name, age:$age)';
}
