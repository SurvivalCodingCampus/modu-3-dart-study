import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_dto.freezed.dart';

part 'pixabay_dto.g.dart';

@freezed
abstract class PixabayDto with _$PixabayDto {
  const factory PixabayDto({
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'totalHits') int? totalHits,
    @JsonKey(name: 'hits') List<Hits>? hits,
  }) = _PixabayDto;

  factory PixabayDto.fromJson(Map<String, Object?> json) =>
      _$PixabayDtoFromJson(json);
}

@freezed
abstract class Hits with _$Hits {
  const factory Hits({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'pageURL') String? pageURL,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'tags') String? tags,
    @JsonKey(name: 'previewURL') String? previewURL,
    @JsonKey(name: 'previewWidth') int? previewWidth,
    @JsonKey(name: 'previewHeight') int? previewHeight,
    @JsonKey(name: 'webformatURL') String? webformatURL,
    @JsonKey(name: 'webformatWidth') int? webformatWidth,
    @JsonKey(name: 'webformatHeight') int? webformatHeight,
    @JsonKey(name: 'largeImageURL') String? largeImageURL,
    @JsonKey(name: 'imageWidth') int? imageWidth,
    @JsonKey(name: 'imageHeight') int? imageHeight,
    @JsonKey(name: 'imageSize') int? imageSize,
    @JsonKey(name: 'views') int? views,
    @JsonKey(name: 'downloads') int? downloads,
    @JsonKey(name: 'collections') int? collections,
    @JsonKey(name: 'likes') int? likes,
    @JsonKey(name: 'comments') int? comments,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'user') String? user,
    @JsonKey(name: 'userImageURL') String? userImageURL,
  }) = _Hits;

  factory Hits.fromJson(Map<String, Object?> json) => _$HitsFromJson(json);
}
