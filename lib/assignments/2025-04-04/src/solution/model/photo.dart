import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/media_type.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    int? id,
    MediaType? type,
    String? title,
    String? content,
    String? url,
    String? caption,
    DateTime? createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
