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

  bool get isEmailValid =>
      RegExp(r'^[\w\\\.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(email);

  bool get isPasswordValid => password.length > 6;
}
