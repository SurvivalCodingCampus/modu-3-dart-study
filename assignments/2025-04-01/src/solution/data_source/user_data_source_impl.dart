import 'dart:convert';
import 'dart:io';

import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final file =
        await File(
          'assignments/2025-04-01/src/solution/data_source/local/users.json',
        ).readAsString();

    final List usersList = jsonDecode(file);

    return usersList.map((e) => e as Map<String, dynamic>).toList();
  }
}
