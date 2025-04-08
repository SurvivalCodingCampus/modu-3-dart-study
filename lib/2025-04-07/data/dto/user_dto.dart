
import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable()
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

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}