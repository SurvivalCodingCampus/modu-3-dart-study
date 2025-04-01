import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-04/2025-04-01/model/user.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';

class UserDataSource implements DataSource<User> {
  @override
  Future<List<User>> load({
    String relativePath = '/lib/data/users.json',
  }) async {
    File file = File(Directory.current.path + relativePath);
    List<dynamic> json = jsonDecode(await file.readAsString());

    return json
        .cast<Map<String, dynamic>>()
        .map((e) => User.fromJson(e))
        .toList();
  }
}
