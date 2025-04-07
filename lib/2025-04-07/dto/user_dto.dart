class UserDto {
  String ? id;
  String ? email;
  String ? password;
  String ? createdAt;
  String ? errorMessage;

  UserDto({
    this.id,
    this.email,
    this.password,
    this.createdAt,
    this.errorMessage,
  });

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'created_at': createdAt,
      'error_message': errorMessage,
    };
  }
}