import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Photo with _$Photo {
  final DateTime createdAt;
  final Type type;
  final String url;
  final String title;

  const Photo({
    required this.createdAt,
    required this.type,
    required this.url,
    required this.title,
  });
}

enum Type { article, image, video, unknown }
