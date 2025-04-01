import 'dart:convert';
import 'dart:io';
import '../model/user.dart';

class UsersDataSource {
  final String path = 'lib/PR2025-04-01/users/assets/users.json';

  Future<List<User>> getUsers() async {
    final file = File(path);
    final String fileContents = await file.readAsString();
    List<dynamic> jsonContents = jsonDecode(fileContents);
    List<User> userContents =
        jsonContents.map((e) => User.fromJson(e)).toList();
    return userContents;
  }
}
