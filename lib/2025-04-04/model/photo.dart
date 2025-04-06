import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

enum PhotoType { article, image, video, unknown }

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required PhotoType type,
    String? title,
    String? content,
    String? url,
    String? caption,
    DateTime? createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}