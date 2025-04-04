import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../enums/photo_enum.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  final int id;
  final String title;
  final String content;
  final PhotoEnum type;
  final DateTime createdAt;
  final String caption;

  const Photo({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.caption,
  });
}
