import '../enum/photo_enum.dart';

class Photo {
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

  Photo copyWith({
    int? id,
    PhotoEnum? type,
    String? title,
    String? content,
    DateTime? createdAt,
    String? url,
    String? caption,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
      caption: caption ?? this.caption,
    );
  }

  @override
  String toString() {
    return 'Photo{id: $id, type: $type, title: $title, content: $content, createdAt: $createdAt, url: $url, caption: $caption}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          title == other.title &&
          content == other.content &&
          createdAt == other.createdAt &&
          url == other.url &&
          caption == other.caption;

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      title.hashCode ^
      content.hashCode ^
      createdAt.hashCode ^
      url.hashCode ^
      caption.hashCode;
}
