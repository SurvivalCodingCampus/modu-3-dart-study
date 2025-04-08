// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: json['id'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  createdAt: json['createdAt'] as String,
  errorMessage: json['errorMessage'] as String,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'password': instance.password,
  'createdAt': instance.createdAt,
  'errorMessage': instance.errorMessage,
};
