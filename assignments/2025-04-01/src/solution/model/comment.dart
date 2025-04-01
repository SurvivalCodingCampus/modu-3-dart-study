class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{postId: $postId, id: $id, name: $name, email: $email, body: $body}';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Comment &&
            postId == other.postId &&
            id == other.id &&
            name == other.name &&
            email == other.email &&
            body == other.body;
  }

  @override
  // TODO: implement hashCode
  int get hashCode =>
      postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;
}
