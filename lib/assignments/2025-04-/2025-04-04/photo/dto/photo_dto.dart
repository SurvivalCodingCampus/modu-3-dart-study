class PhotoDto {
  final dynamic id;
  final String? type;
  final String? url;
  final String? content;
  final String? createdAt;

  const PhotoDto({this.id, this.type, this.url, this.content, this.createdAt});

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id'] as dynamic,
      type: json['type'] as String?,
      url: json['url'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'url': url,
      'content': content,
      'created_at': createdAt,
    };
  }
}
