import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto {
  dynamic id;
  String? type;
  String? title;
  String? content;
  String? url;
  String? caption;
  @JsonKey(name: 'created_at')
  String createdAt;

  PhotoDto({
    required this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    required this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
