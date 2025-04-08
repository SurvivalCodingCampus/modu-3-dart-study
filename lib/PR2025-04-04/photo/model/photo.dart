import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/photo_enum.dart';

part 'photo.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Photo with _$Photo {
  final int id;
  final PhotoEnum type;
  final String title;
  final String content;
  final DateTime createdAt;
  final String url;
  final String caption;

  Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.url,
    required this.caption,
  });
}
