import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  final dynamic id; // Can be int / String based on JSON
  final String? type;
  final String? title;
  final String? content;
  final String? url;
  final String? caption;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}