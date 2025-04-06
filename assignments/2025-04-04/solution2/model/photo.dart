import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/2025-04-04/solution2/model/content_type.dart';

part 'photo.freezed.dart';

@Freezed(
  copyWith: true,
  equal: true,
  toStringOverride: true,
  toJson: true,
  fromJson: true,
)
class Photo with _$Photo {
  final int id;
  final ContentType type;
  final String title;
  final String content;
  final DateTime createdAt;

  const Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: int.parse(json["id"]),
      type: ContentType.values.firstWhere((e) => e.name == json["type"]),
      title: json["title"],
      content: json["content"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
  //
}
