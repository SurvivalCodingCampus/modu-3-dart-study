import '../enum/photo_enum.dart';

class PhotoDto {
  final num? id;
  final PhotoEnum? type;
  final String? title;
  final String? content;
  final String? created_at;
  final String? url;
  final String? caption;

  const PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.created_at,
    this.url,
    this.caption,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type?.toString().split('.').last,
      'title': title,
      'content': content,
      'created_at': created_at,
      'url': url,
      'caption': caption,
    };
  }

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      content: json['content'],
      created_at: json['“created_at”'],
      url: json['url'],
      caption: json['caption'],
    );
  }
}
