// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
  id: json['id'],
  type: json['type'] as String?,
  title: json['title'] as String?,
  url: json['url'] as String?,
  caption: json['caption'] as String?,
  content: json['content'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'url': instance.url,
  'content': instance.content,
  'caption': instance.caption,
  'created_at': instance.createdAt,
};
