import 'dart:convert';
import 'dart:io';

import 'model/user.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final String UsersJsoFilePath =
      '${Directory.current.path}/assignments/2025-03-31/user_solution/user.json';

  @override
  Future<List<User>> getUsers() async {
    try {
      final File jsonFile = File(UsersJsoFilePath);
      String jsonFromFile = await jsonFile.readAsString();

      List<dynamic> decodedData = jsonDecode(jsonFromFile);

      List<User> users = decodedData.map((e) => User.fromJson(e)).toList();

      print(users);
      return users;
    } on FormatException {
      throw FormatException('JSON 파싱 중 오류가 발생했습니다');
    } catch (e) {
      print(e);
      throw Exception('Error fetching Todo: $e');
    }
  }
}

void main() async {
  final List<User> users = await UserDataSourceImpl().getUsers();
}
