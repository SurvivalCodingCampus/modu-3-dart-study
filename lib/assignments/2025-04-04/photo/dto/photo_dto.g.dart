// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => _PhotoDto(
  id: json['id'] as Object,
  type: json['type'] as String? ?? 'unknown',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  url: json['url'] as String? ?? '',
  caption: json['caption'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '1999-01-01',
);

Map<String, dynamic> _$PhotoDtoToJson(_PhotoDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'content': instance.content,
  'url': instance.url,
  'caption': instance.caption,
  'created_at': instance.createdAt,
};
