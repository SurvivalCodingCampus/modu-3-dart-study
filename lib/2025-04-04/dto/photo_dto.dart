class PhotoDto {
  final Object? id;
  final String? type;
  final String? title;
  final String? content;
  final String? url;
  final String? caption;
  final String? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id']?.toString(),
      type: json['type']?.toString(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
      caption: json['caption'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'content': content,
      'url': url,
      'caption': caption,
      'created_at': createdAt,
    };
  }
}