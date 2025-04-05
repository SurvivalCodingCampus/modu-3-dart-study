import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/media_type.dart';

part 'photo.freezed.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required MediaType type,
    required String title,
    required String content,
    required String url,
    required String caption,
    required DateTime createdAt,
  }) = _Photo;
}
