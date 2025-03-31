import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_sources/user/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/models/user.dart';

class UserDataSourceImpl implements UserDataSource {
  static final String root = Directory.current.path;

  @override
  Future<List<User>> getUsers(String relativePath) async {
    File file = File(root + relativePath);
    List<dynamic> json = jsonDecode(await file.readAsString());

    return json
        .cast<Map<String, dynamic>>()
        .map((e) => User.fromJson(e))
        .toList();
  }
}
