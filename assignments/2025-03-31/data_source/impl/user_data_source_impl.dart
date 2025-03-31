import 'dart:convert';
import 'dart:io';

import '../../model/user.dart';
import '../user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<User>> getUsersFromFile(String fileName) async {
    try {
      File userFile = File(fileName);
      String userJson = await userFile.readAsString();

      return (jsonDecode(userJson) as List<dynamic>)
          .map((e) => User.fromJson(e))
          .toList();
    } on PathNotFoundException {
      throw ArgumentError('파일을 찾을 수 없습니다.');
    }
  }
}
