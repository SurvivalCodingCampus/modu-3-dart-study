class User {
  int userId;
  String title;
  bool completed;

  User({required this.userId, required this.title, required this.completed});

  User.fromJson(Map<String, dynamic> json)
    : userId = json["userId"],
      title = json["title"] as String,
      completed = json["completed"] as bool;
}
