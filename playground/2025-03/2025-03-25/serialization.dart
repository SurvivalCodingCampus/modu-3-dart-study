import 'dart:convert';

class User {
  final int _id;
  final String _username;

  User({required int id, required String username})
    : _id = id,
      _username = username;

  User.fromJson(Map<String, dynamic> json)
    : _id = json['id'],
      _username = json['username'];

  String toJson() {
    return jsonEncode({"id": _id, "username": _username});
  }
}
