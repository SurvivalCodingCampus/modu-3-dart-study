import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';
// ignore_for_file: annotate_overrides

@freezed
@JsonSerializable()
class UserDto with _$UserDto {
  String? id;
  String? email;
  String? password;
  String? createAt;
  String? errorMessage;

  UserDto({
    this.id,
    this.email,
    this.password,
    this.createAt,
    this.errorMessage
  });

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);

  Map<String, Object?> toJson() => _$UserDtoToJson(this);
}