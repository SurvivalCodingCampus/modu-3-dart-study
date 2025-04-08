import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
