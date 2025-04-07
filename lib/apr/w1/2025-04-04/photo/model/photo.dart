import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/type_enum.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required PhotoType type,
    required String title,
    required String url,
    required String content,
    required String caption,
    required DateTime createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
