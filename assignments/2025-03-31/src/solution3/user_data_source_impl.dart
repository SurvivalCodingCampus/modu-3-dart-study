import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    final File file = File('lib/2025-03-31/users.json');
    final String fileString = file.readAsStringSync();
    final List<dynamic> jsonList = jsonDecode(fileString);

    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}

void main() async {
  List<User> users = await UserDataSourceImpl().getUsers();
  print(users);
}