// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

import 'photo_type.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
@JsonSerializable()
class Photo with _$Photo {
  final int id;
  final PhotoType? type;
  final String title;
  final String content;
  final String url;
  final String caption;
  final DateTime? createdAt;
  Photo({
    required this.id,
    this.type,
    required this.title,
    required this.content,
    required this.url,
    required this.caption,
    this.createdAt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
