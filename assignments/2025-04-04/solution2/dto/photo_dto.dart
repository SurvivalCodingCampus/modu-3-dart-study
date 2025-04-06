import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';

part 'photo_dto.g.dart';

@freezed
abstract class PhotoDto with _$PhotoDto {
  const factory PhotoDto({
    int? id,
    String? type,
    String? title,
    String? content,
    @JsonKey(name: 'created_at') String? createAt,
  }) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}
