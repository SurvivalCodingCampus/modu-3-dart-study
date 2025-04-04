class Photo {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Photo(this.postId, this.id, this.name, this.email, this.body);

  Photo copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body
}) {
    return Photo(
      postId ?? this.postId,
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      body ?? this.body
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Photo && runtimeType == other.runtimeType &&
              postId == other.postId && id == other.id && name == other.name &&
              email == other.email && body == other.body;

  @override
  int get hashCode =>
      postId.hashCode ^ id.hashCode ^ name.hashCode ^ email.hashCode ^ body
          .hashCode;

  @override
  String toString() {
    return 'Photo{postId: $postId, id: $id, name: $name, email: $email, body: $body}';
  }

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      json['postId'],
      json['id'],
      json['name'],
      json['email'],
      json['body'],
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'postId': postId,
        'id': id,
        'name': name,
        'email': email,
        'body': body,
      };
}
