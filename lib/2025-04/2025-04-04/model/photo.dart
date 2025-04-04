import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo_type.dart';

part 'photo.freezed.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required PhotoType type,
    required String url,
    required String content,
    required String caption,
    required DateTime createdAt,
  }) = _Photo;
}
