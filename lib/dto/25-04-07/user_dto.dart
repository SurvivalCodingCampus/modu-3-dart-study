class UserDto {
  final String? id;
  final String? email;
  final String? password;
  final String? createAt;
  final String? errorMessage;

  UserDto({
    this.id,
    this.email,
    this.password,
    this.createAt,
    this.errorMessage,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      createAt: json['create_at'],
      errorMessage: json['error_message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'create_at': createAt,
      'error_message': errorMessage,
    };
  }
}
