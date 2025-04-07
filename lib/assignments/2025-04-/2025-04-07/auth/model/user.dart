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

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.password == password &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      password.hashCode ^
      createdAt.hashCode;
  }

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
  String toString() {
    return 'User(id: $id, email: $email, password: $password, createdAt: $createdAt)';
  }
}
