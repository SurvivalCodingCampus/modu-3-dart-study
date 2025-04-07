class UserDto {
  final String? id;
  final String? email;
  final String? password;
  final String? createdAt;
  final String? errorMessage;

  UserDto({
    this.id,
    this.email,
    this.password,
    this.createdAt,
    this.errorMessage,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id']?.toString(),
      email: json['email']?.toString(),
      password: json['password']?.toString(),
      createdAt: json['createdAt']?.toString(),
      errorMessage: json['errorMessage']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'errorMessage': errorMessage,
    };
  }
}
