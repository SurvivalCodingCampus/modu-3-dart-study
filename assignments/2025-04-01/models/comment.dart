class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment(this.postId, this.id, this.name, this.email, this.body);

  Comment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      postId ?? this.postId,
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      body ?? this.body,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Comment &&
              runtimeType == other.runtimeType &&
              postId == other.postId &&
              id == other.id &&
              name == other.name &&
              email == other.body;

  @override
  int get hashCode =>
      postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;

  @override
  String toString() =>
      'Comment(postId: $postId, id: $id, name: $name, email: $email, body: $body)';

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      json['postId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'id': id,
    'name': name,
    'email': email,
    'body': body,
  };
}