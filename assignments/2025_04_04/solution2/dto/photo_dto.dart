class PhotoDto {
  String? id;
  String? type;
  String? title;
  String? content;
  String? url;
  String? caption;
  String? createdAt;
  num? idNum; // id가 숫자인 경우를 위한 보조 필드 (optional)

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
    this.idNum,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) {
    return PhotoDto(
      id: json['id']?.toString(), // 숫자든 문자열이든 문자열로 처리
      idNum: json['id'] is num ? json['id'] : null,
      type: json['type'],
      title: json['title'],
      content: json['content'],
      url: json['url'],
      caption: json['caption'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'title': title,
    'content': content,
    'url': url,
    'caption': caption,
    'created_at': createdAt,
  };

  @override
  String toString() {
    return 'Dto(id: $id, idNum: $idNum, type: $type, title: $title, content: $content, url: $url, caption: $caption, created_at: $createdAt\n)';
  }
}
