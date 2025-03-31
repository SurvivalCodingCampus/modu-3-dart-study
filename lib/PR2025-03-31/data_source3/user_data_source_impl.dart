import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/PR2025-03-31/data_source3/user_data_source.dart';

import '../model/users/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    File file = File('lib/PR2025-03-31/model/users/users.json');
    final String jsonString = await file.readAsString();
    List<dynamic> jsonList = jsonDecode(jsonString);
    List<User> users =
        jsonList.map((usersJson) => User.fromJson(usersJson)).toList();
    return users;
  }
}
