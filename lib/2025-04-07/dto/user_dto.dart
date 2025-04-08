import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  dynamic id;
  String? email;
  String? password;
  String? createdAt;
  String? message;

  UserDto({this.id, this.email, this.password, this.createdAt, this.message});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
