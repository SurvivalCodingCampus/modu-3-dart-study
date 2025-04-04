class Comment {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Comment(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  Comment copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Comment(
      albumId ?? this.albumId,
      id ?? this.id,
      title ?? this.title,
      url ?? this.url,
      thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comment &&
          runtimeType == other.runtimeType &&
          albumId == other.albumId &&
          id == other.id &&
          title == other.title &&
          url == other.url &&
          thumbnailUrl == other.thumbnailUrl;

  @override
  int get hashCode =>
      albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;

  @override
  String toString() {
    return 'Comment{albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      json['albumId'],
      json['id'],
      json['title'],
      json['url'],
      json['thumbnailUrl'],
    );
  }
  Map<String, dynamic> toJson() => {
    'albumId': albumId,
    'id': id,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };
}
