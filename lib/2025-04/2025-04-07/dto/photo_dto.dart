import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto {
  int? id;

  @JsonKey(name: 'tags')
  String? tags;

  @JsonKey(name: 'webformatURL')
  String? url;

  PhotoDto({required this.id, required this.tags, required this.url});

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
