class Photosdto {
  Photosdto({
    num? id,
    String? type,
    String? title,
    String? content,
    String? createdAt,
  }) {
    _id = id;
    _type = type;
    _title = title;
    _content = content;
    _createdAt = createdAt;
  }

  Photosdto.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _title = json['title'];
    _content = json['content'];
    _createdAt = json['“created_at”'];
  }

  num? _id;
  String? _type;
  String? _title;
  String? _content;
  String? _createdAt;

  Photosdto copyWith({
    num? id,
    String? type,
    String? title,
    String? content,
    String? createdAt,
  }) => Photosdto(
    id: id ?? _id,
    type: type ?? _type,
    title: title ?? _title,
    content: content ?? _content,
    createdAt: createdAt ?? _createdAt,
  );

  num? get id => _id;

  String? get type => _type;

  String? get title => _title;

  String? get content => _content;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['title'] = _title;
    map['content'] = _content;
    map['“created_at”'] = _createdAt;
    return map;
  }
}
