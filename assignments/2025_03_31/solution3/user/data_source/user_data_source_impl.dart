import 'dart:convert';
import 'dart:io';

import '../user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    final userFile = File('assets/json/user.json');
    final userJsonString = await userFile.readAsString();

    final List userData = jsonDecode(userJsonString);
    List<User> users = userData.map((user) => User.fromJson(user)).toList();
    print(users);

    return users;
  }
}
