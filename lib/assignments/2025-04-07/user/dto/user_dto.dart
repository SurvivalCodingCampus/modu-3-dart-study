import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto{
  const factory UserDto({
    @Default('0') String id,
    @Default('0') String email,
    @Default('0') String password,
    @Default('1900-01-01 00') String createdAt,
    @Default('') String errorMessage
  }) = _UserDto;
  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}