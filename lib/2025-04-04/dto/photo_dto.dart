class PhotoDto {
  final dynamic id; // int 또는 String 모두 수용
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
      id: json['id'], // dynamic으로 받고 Model 변환 시 int로 캐스팅
      type: json['type'] as String?,
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