class User {
  final String id;
  final String email;
  final String password;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          password == other.password &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^ email.hashCode ^ password.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'User{id: $id, email: $email, createdAt: $createdAt}';
  }
}


