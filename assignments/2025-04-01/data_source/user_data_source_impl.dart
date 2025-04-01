import 'dart:convert';
import 'dart:io';

import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final String path;

  UserDataSourceImpl({required this.path});
  @override
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    String jsonString = await File(path).readAsString();
    List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
    
  }
}
