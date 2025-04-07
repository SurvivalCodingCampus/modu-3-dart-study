import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/dto_utils/json_convert.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto implements JsonConvert<UserDto, User> {
  final String? id;
  final String? email;
  final String? password;
  final String? createdAt;

  const UserDto({
    required this.id,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  const UserDto.empty()
    : id = null,
      email = null,
      password = null,
      createdAt = null;

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  UserDto fromJson(Map<String, dynamic> json) {
    return UserDto.fromJson(json);
  }

  @override
  User toEntity() {
    return toUser();
  }
}
