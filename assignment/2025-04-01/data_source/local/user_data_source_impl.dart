import 'dart:convert';
import 'dart:io';

import '../user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchUsers(String path) async {
    final jsonString = await File(path).readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
