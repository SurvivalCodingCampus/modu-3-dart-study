class PhotoDto {
  PhotoDto(
    this.id,
    this.type,
    this.title,
    this.content,
    this.caption,
    this.url,
    this.createdAt,
  );

  PhotoDto.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    caption = json['caption'];
    url = json['url'];
  }

  String? id;
  String? type;
  String? title;
  String? content;
  String? caption;
  String? url;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['content'] = content;
    map['caption'] = caption;
    map['url'] = url;
    map['created_at'] = createdAt;
    return map;
  }
}
