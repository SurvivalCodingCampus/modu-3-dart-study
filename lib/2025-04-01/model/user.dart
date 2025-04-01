class User {
  final int id;
  final String name;
  final String username;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  User copyWith({int? id, String? name, String? username, String? email}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is User &&
            other.id == id &&
            other.name == name &&
            other.username == username &&
            other.email == email);
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ username.hashCode ^ email.hashCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'username': username, 'email': email};
  }
}
