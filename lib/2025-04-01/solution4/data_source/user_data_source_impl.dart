import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04-01/solution4/data_source/user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final File file = File('lib/2025-04-01/solution4/users.json');

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final List<dynamic> jsonList = jsonDecode(await file.readAsString());
    return jsonList
        .map((e) => e as Map<String, dynamic>) // 굳이 명시함
        .toList();
  }
}