class User {
  final String id;
  final String email;
  final String password;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });
}
