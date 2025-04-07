import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
abstract class PhotoDto with _$PhotoDto{
  const factory PhotoDto({
    required int id,
    required String pageURL,
    required String type,
    required String tags,
    required String previewURL,
    required int previewWidth,
    required int previewHeight,
    required String webformatURL,
    required int webformatWidth,
    required int webformatHeight,
    required String largeImageURL,
    required int imageWidth,
    required int imageHeight,
    required int imageSize,
    required int views,
    required int downloads,
    required int collections,
    required int likes,
    required int comments,
    @JsonKey(name: 'user_id') required int userId,
    required String user,
    required String userImageURL,
  }) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);
}