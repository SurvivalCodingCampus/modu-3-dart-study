import 'dart:convert';
import 'dart:io';

import 'user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  String path;
  UserDataSourceImpl({required this.path});

  @override
  Future<List<User>> getUsers() async {
    try {
      final List jsonMap = jsonDecode(await File(path).readAsString());
      return jsonMap.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
