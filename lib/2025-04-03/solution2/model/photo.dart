enum ContentType { article, image, video, unknown }

class Photo {
  final int id; // Converting to int for domain model
  final ContentType type;
  final String title;
  final String content;
  final String url;
  final String caption;
  final DateTime createdAt;

  const Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.url,
    required this.caption,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Photo &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              type == other.type &&
              title == other.title &&
              content == other.content &&
              url == other.url &&
              caption == other.caption &&
              createdAt == other.createdAt;

  @override
  int get hashCode => Object.hash(id, type, title, content, url, caption, createdAt);

  @override
  String toString() =>
      'Photo(id: $id, type: $type, title: $title, content: $content, url: $url, caption: $caption, createdAt: $createdAt)';

  Photo copyWith({
    int? id,
    ContentType? type,
    String? title,
    String? content,
    String? url,
    String? caption,
    DateTime? createdAt,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      url: url ?? this.url,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}