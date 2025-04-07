import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  final String? id;
  final String? email;
  final String? password;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  UserDto({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}