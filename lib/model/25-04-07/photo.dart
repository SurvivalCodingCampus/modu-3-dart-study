class Photo {
  final String tags;
  final String imageUrl;

  const Photo({required this.tags, required this.imageUrl});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo &&
          runtimeType == other.runtimeType &&
          tags == other.tags &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => tags.hashCode ^ imageUrl.hashCode;

  Photo copyWith({String? tags, String? imageUrl}) {
    return Photo(tags: tags ?? this.tags, imageUrl: imageUrl ?? this.imageUrl);
  }

  @override
  String toString() {
    return 'Photo{tags: $tags, imageUrl: $imageUrl}';
  }
}
