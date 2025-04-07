import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto {
  final Object? id;
  final String? type;
  final String? title;
  final String? url;
  final String? content;
  final String? caption;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.url,
    this.caption,
    this.content,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String,dynamic> json) => _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}