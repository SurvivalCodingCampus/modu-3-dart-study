import 'package:modu_3_dart_study/2025-04/2025-04-04/model/photo_type.dart';

class PhotoDto {
  int? id;
  PhotoType? type;
  String? url;
  String? content;
  String? caption;
  String? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.url,
    this.content,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id:
          json['id'] != null && json['id'] is int
              ? json['id']
              : int.tryParse(json['id']),
      type:
          json['type'] != null && json['type'] is String
              ? PhotoType.fromName(json['type'])
              : PhotoType.unknown,
      url: json['url'] != null && json['url'] is String ? json['url'] : 'N/A',
      content:
          json['content'] != null && json['content'] is String
              ? json['content']
              : 'N/A',
      caption:
          json['caption'] != null && json['caption'] is String
              ? json['caption']
              : 'N/A',
      createdAt:
          json['created_at'] != null && json['created_at'] is String
              ? json['created_at']
              : null,
    );
  }
  @override
  String toString() {
    return 'PhotoDto{id: $id, type: $type, url: $url, content: $content, caption: $caption, createdAt: $createdAt}';
  }
}
