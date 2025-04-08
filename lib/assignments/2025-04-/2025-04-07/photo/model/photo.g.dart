// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  previewURL: json['previewURL'] as String,
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'tags': instance.tags,
  'previewURL': instance.previewURL,
};
