import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/util/type_enum.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    required int id,
    required PhotoType type,
    required String title,
    required String content,
    required String url,
    required String caption,
    required DateTime createdAt,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
