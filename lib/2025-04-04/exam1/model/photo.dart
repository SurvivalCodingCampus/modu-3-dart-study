import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

enum Type {
  Article,
  Image,
  Video,
  UnKnown
}

@freezed
class Photo with _$Photo{
  final int id;
  final Type type;
  final String title;
  final String url;
  final String content;
  final String caption;
  final String createdAt;

  const Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.url,
    required this.content,
    required this.caption,
    required this.createdAt,
  });
}
