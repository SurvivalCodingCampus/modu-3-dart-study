import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  @JsonKey(fromJson: _parseNum)
  final num? id;
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

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  // 커스텀 fromJson 함수
  static num? _parseNum(dynamic value) {
    if (value == null) return null;
    if (value is num) return value;
    if (value is String) {
      return num.tryParse(value);
    }
    return null; // 예외 상황 처리
  }
}
