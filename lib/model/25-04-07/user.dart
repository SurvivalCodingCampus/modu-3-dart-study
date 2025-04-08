class User {
  final String id;
  final String email;
  final String password;
  final DateTime createAt;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.createAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          password == other.password &&
          createAt == other.createAt;

  @override
  int get hashCode =>
      id.hashCode ^ email.hashCode ^ password.hashCode ^ createAt.hashCode;

  @override
  String toString() {
    return 'User{id: $id, email: $email, password: $password, createAt: $createAt}';
  }

  User copyWith({
    String? id,
    String? email,
    String? password,
    DateTime? createAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      createAt: createAt ?? this.createAt,
    );
  }
}
