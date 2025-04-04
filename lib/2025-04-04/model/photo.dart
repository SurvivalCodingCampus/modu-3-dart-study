// lib/photo.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

enum PhotoType { article, image, video, unknown }

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required PhotoType type,
    required String title,
    required String content,
    required DateTime createdAt,
  }) = _Photo;
}
