import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
abstract class PhotoDto with _$PhotoDto{
  const factory PhotoDto(
    {
      required Object id,
      @Default('unknown') String? type,
      @Default('')String? title,
      @Default('')String? content,
      @Default('')String? url,
      @Default('')String? caption,
      @JsonKey(name: 'created_at') @Default('1999-01-01')String? createdAt,

    }

    
  ) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);
}