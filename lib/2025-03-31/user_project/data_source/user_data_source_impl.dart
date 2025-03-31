import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/user_project/data_source/user_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/user_project/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  final String filePath;

  UserDataSourceImpl(this.filePath);

  @override
  Future<List<User>> getUsers() async {
    final File file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode((jsonString));
    return jsonData.map((user) => User.fromJson(user)).toList();
  }
}