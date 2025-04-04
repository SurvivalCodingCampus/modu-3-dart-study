import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/data_source/25-04-01/user_data_source/user_data_source.dart';

import '../../../model/25-04-01/user.dart';

class UserDataSourceImpl implements UserDataSource {
  final String _filePath = "user_data.json";

  @override
  Future<List<User>> getUsers() async {
    final file = File(_filePath);
    final jsonString = await file.readAsString();
    final List<Map<String, dynamic>> jsonData = jsonDecode(jsonString);
    return jsonData.map((e) => User.fromJson(e)).toList();
  }
}
