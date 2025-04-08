import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(fromJson: _forceToString)
  final String id;

  @JsonKey(fromJson: _forceToString)
  final String email;

  @JsonKey(fromJson: _forceToString)
  final String password;

  @JsonKey(fromJson: _forceToString)
  final String createdAt;

  UserDto({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  static String _forceToString(dynamic value) {
    return value != null ? value.toString() : '';
  }
}
