import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
abstract class PhotoDto with _$PhotoDto {
  const factory PhotoDto({
    dynamic? id,
    String? type,
    String? title,
    String? url,
    String? content,
    String? caption,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}
