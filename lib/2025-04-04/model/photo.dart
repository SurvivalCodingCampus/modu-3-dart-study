import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  final int id;
  final Type type;
  final DateTime createdAt;
  final String title;
  final String content;
  final String url;
  final String caption;

  const Photo({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.title,
    required this.content,
    required this.url,
    required this.caption,
  });
}

enum Type {
  Article,
  Image,
  Video,
  Unknown
}