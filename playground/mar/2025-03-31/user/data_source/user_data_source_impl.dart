import 'dart:convert';
import 'dart:io';

import '../model/user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getListUser() async {
    final userFile = File(r'playground/mar/2025-03-31/user/user.txt');
    final jsonString = await userFile.readAsString();
    final List<dynamic> userJson = jsonDecode(jsonString);

    return userJson.map((e) => User.fromJson(e)).toList();
  }
}
