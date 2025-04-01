class Comment {
  final int postId;
  final int id;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.email,
    required this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comment &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          id == other.id &&
          email == other.email &&
          body == other.body;

  @override
  int get hashCode =>
      postId.hashCode ^ id.hashCode ^ email.hashCode ^ body.hashCode;

  @override
  String toString() {
    return 'Comment{postId: $postId, id: $id, email: $email, body: $body}';
  }

  Comment copyWith({int? postId, int? id, String? email, String? body}) {
    if ((postId == null || identical(postId, this.postId)) &&
        (id == null || identical(id, this.id)) &&
        (email == null || identical(email, this.email)) &&
        (body == null || identical(body, this.body))) {
      return this;
    }

    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {'postId': postId, 'id': id, 'email': email, 'body': body};
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      postId: map['postId'] as int,
      id: map['id'] as int,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }
}
