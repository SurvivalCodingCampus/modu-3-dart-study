class PhotoDto {
  final Object? id;
  final String? type;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? url;
  final String? caption;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.createdAt,
    this.url,
    this.caption,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'],
      url: json['url'],
      caption: json['caption'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'content': content,
      'created_at': createdAt,
      'url': url,
      'caption': caption,
    };
  }
}
