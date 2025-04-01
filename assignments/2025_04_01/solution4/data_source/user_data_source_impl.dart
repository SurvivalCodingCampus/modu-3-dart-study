import 'dart:convert';
import 'dart:io';

import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final jsonFile = File(
    'C:\\Users\\Ujun\\modu-3-dart-study\\assignments\\2025_04_01\\solution4\\user.json',
  );

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final jsonString = await jsonFile.readAsString();

    final List users = jsonDecode(jsonString);

    return users.map((e) => e as Map<String, dynamic>).toList();
  }
}
