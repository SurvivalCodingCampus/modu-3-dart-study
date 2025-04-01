import 'dart:convert';
import 'dart:io';

import '../../model/user/user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsers() async {
    final file =
        await File(
          'assignments/2025-03-31/src/solution/data_source/user/users.json',
        ).readAsString();

    List<dynamic> contents = jsonDecode(file);
    List<Map<String, dynamic>> results =
        contents.map((e) => e as Map<String, dynamic>).toList();
    return results.map((e) => User.fromJson(e)).toList();
  }
}
