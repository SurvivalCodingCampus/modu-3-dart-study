import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_dto.freezed.dart';
part 'auth_dto.g.dart';

@freezed
abstract class AuthDto with _$AuthDto {
  const factory AuthDto({
    String? id,
    String? email,
    String? password,
    String? createdAt,
    String? errorMessage,
  }) = _AuthDto;

  factory AuthDto.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoFromJson(json);
}
