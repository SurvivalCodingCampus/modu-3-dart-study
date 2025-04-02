import '../../utils/json_convertible.dart';

class Comment implements JsonConvertible<Comment, int> {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) : postId = postId ?? 0,
       id = id ?? 0,
       name = name ?? '',
       email = email ?? '',
       body = body ?? '';

  Comment copyWith({String? name, String? email, String? body}) => Comment(
    postId: postId,
    id: id,
    name: name ?? this.name,
    email: email ?? this.email,
    body: body ?? this.body,
  );

  @override
  Map<String, dynamic> toJson() => {
    'postId': postId,
    'id': id,
    'name': name,
    'email': email,
    'body': body,
  };

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      body: json['body'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Comment && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      "Comment{postId : $postId, id : $id, name : $name, email : $email}";

  @override
  // TODO: implement filterKey
  int get filterKey => postId;

  @override
  Comment fromJson(Map<String, dynamic> json) {
    return Comment.fromJson(json);
  }
}
