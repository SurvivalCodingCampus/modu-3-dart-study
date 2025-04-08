import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/photo_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/photo.dart';
import 'package:modu_3_dart_study/dto_utils/json_convert.dart';

part 'photo_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoDto implements JsonConvert<PhotoDto, Photo> {
  final num? id;
  final String? pageURL;
  final String? type;
  final String? tags;
  final String? previewURL;
  final num? previewWidth;
  final num? previewHeight;
  final String? webformatURL;
  final num? webformatWidth;
  final num? webformatHeight;
  final String? largeImageURL;
  final num? imageWidth;
  final num? imageHeight;
  final num? imageSize;
  final num? views;
  final num? downloads;
  final num? collections;
  final num? likes;
  final num? comments;
  final String? errorMessage;

  const PhotoDto({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.errorMessage,
  });

  const PhotoDto.empty()
    : id = null,
      pageURL = null,
      type = null,
      tags = null,
      previewURL = null,
      previewWidth = null,
      previewHeight = null,
      webformatURL = null,
      webformatWidth = null,
      webformatHeight = null,
      largeImageURL = null,
      imageWidth = null,
      imageHeight = null,
      imageSize = null,
      views = null,
      downloads = null,
      collections = null,
      likes = null,
      comments = null,
      errorMessage = null;

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  @override
  PhotoDto fromJson(Map<String, dynamic> json) {
    return PhotoDto.fromJson(json);
  }

  @override
  Photo toEntity() {
    return toPhoto();
  }
}
