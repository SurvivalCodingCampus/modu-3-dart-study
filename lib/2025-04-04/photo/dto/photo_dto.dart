import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/2025-04-04/photo/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/dto_utils/json_convert.dart';
import 'package:modu_3_dart_study/enums/photo_enum.dart';

import '../model/photo.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto implements JsonConvert<PhotoDto, Photo> {
  final Object? id;
  final String? title;
  final String? content;
  final PhotoEnum? type;
  @JsonKey(name: 'create_at')
  final String? createdAt;
  final String? caption;

  const PhotoDto({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.caption,
  });

  const PhotoDto.empty()
    : id = null,
      caption = null,
      content = null,
      createdAt = null,
      title = null,
      type = null;

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  @override
  PhotoDto fromJson(Map<String, dynamic> json) {
    return PhotoDto.fromJson(json);
  }

  @override
  Photo toEntity() {
    return toPhoto();
  }
}
