import 'user_model.dart';

class UserList {
  final List<User> list;

  UserList({required this.list});

  factory UserList.fromJson(Map<String, dynamic> json) {
    final list =
        (json['list'] as List<dynamic>).map((e) => User.fromJson(e)).toList();
    return UserList(list: list);
  }
}
