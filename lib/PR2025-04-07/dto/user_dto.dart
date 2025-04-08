import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

//항상성공하는 형태만되니까 실패하면 에러메세지반환
@JsonSerializable(explicitToJson: true)
class UserDto {
  final String id;
  final String email;
  final String password;
  final String createdAt;
  final String errorMessage;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  const UserDto({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.errorMessage,
  });
}
