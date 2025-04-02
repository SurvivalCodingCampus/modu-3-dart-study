import '../../utils/json_convertible.dart';

class Album implements JsonConvertible<Album, int> {
  final int userId;
  final int id;
  final String title;

  const Album({int? userId, int? id, String? title})
    : userId = userId ?? 0,
      id = id ?? 0,
      title = title ?? '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Album && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Album{userId: $userId, id: $id, title: $title}';
  }

  @override
  // TODO: implement filterKey
  int get filterKey => userId;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }

  @override
  Album fromJson(Map<String, dynamic> json) {
    return Album.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => {'userId': userId, 'id': id, 'title': title};
}
