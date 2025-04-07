class UserDto {
  final String? id;
  final String? email;
  final String? password;
  final String? createdAt;
  final String? errorMessage;

  const UserDto({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.errorMessage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'errorMessage': errorMessage,
    };
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      errorMessage: json['errorMessage'],
    );
  }
}
