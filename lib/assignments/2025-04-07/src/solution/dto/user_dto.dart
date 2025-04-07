// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  String? id;
  String? email;
  String? password;
  String? createdAt;
  String? errorMessage;

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
