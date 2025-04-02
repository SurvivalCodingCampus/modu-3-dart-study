class Photo {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

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

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Photo.fromJson(Map<String, dynamic> map) {
    return Photo(
      albumId: map['albumId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      thumbnailUrl: map['thumbnailUrl'] ?? '',
    );
  }


  @override
  String toString() {
    return 'Photo(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Photo &&
      other.albumId == albumId &&
      other.id == id &&
      other.title == title &&
      other.url == url &&
      other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;
  }
}
