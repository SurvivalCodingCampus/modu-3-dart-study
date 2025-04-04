// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  overview: json['overview'] as String,
  releaseDate: json['release_date'] as String,
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'release_date': instance.releaseDate,
};
