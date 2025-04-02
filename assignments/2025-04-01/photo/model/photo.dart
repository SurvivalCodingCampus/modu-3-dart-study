import '../../utils/json_convertible.dart';

class Photo implements JsonConvertible<Photo, int> {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) : albumId = albumId ?? 0,
       id = id ?? 0,
       title = title ?? '',
       url = url ?? '',
       thumbnailUrl = thumbnailUrl ?? '';

  Photo copyWith({String? title, String? url, String? thumbnailUrl}) => Photo(
    albumId: albumId,
    id: id,
    title: title ?? this.title,
    url: url ?? this.url,
    thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
  );

  @override
  Map<String, dynamic> toJson() => {
    'albumId': albumId,
    'id': id,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      "Photo{albumId : $albumId, id : $id, title : $title, url : $url}";

  @override
  Photo fromJson(Map<String, dynamic> json) {
    return Photo.fromJson(json);
  }

  @override
  int get filterKey => albumId;
}
