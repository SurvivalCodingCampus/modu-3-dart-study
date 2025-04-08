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
      id: json['id'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      createdAt: json['createdAt'] as String?,
      errorMessage: json['errorMessage'] as String?,
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

  UserDto copyWith({
    String? id,
    String? email,
    String? password,
    String? createdAt,
    String? errorMessage,
  }) {
    return UserDto(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
