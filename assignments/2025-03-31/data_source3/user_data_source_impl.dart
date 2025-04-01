import 'dart:convert';
import 'dart:io';
import '../model/users/user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    File file = File('assignments/2025-03-31/model/users/users.json');
    final String jsonString = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<User> users =
        jsonList.map((usersJson) => User.fromJson(usersJson)).toList();
    return users;
  }
}
