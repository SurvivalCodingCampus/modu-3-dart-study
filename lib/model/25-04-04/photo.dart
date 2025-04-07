import 'package:modu_3_dart_study/model/25-04-04/phototype.dart';

class Photo {
  final int id;
  final String title;
  final PhotoType type;
  final String content;
  final DateTime createdAt;
  final String? url;
  final String? caption;

  const Photo({
    required this.id,
    required this.title,
    required this.type,
    required this.content,
    required this.createdAt,
    required this.url,
    required this.caption,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          type == other.type &&
          content == other.content &&
          createdAt == other.createdAt &&
          url == other.url &&
          caption == other.caption;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      type.hashCode ^
      content.hashCode ^
      createdAt.hashCode ^
      url.hashCode ^
      caption.hashCode;

  @override
  String toString() {
    return 'Photo{id: $id, title: $title, type: $type, content: $content, createdAt: $createdAt, url: $url, caption: $caption}';
  }
}
