class User {
  final String name;
  final int age;

  const User(this.name, this.age);
}

void main() {
  final user = User('name', 10);
  final user2 = User('name', 10);

  print(identical(user, user2));
}
