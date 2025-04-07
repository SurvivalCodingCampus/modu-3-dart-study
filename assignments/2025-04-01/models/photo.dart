class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Photo copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Photo(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Photo &&
            albumId == other.albumId &&
            id == other.id &&
            title == other.title &&
            url == other.url &&
            thumbnailUrl == other.thumbnailUrl;
  }

  @override
  int get hashCode =>
      albumId.hashCode ^ id.hashCode ^ title.hashCode ^ url.hashCode ^ thumbnailUrl.hashCode;

  @override
  String toString() {
    return 'Photo(albumId: $albumId, id: $id, title: "$title", url: "$url", thumbnailUrl: "$thumbnailUrl")';
  }
}