import 'dart:io';
import 'package:collection/collection.dart';

import '../data_source/data_source.dart';
import '../data_source/mock_user_data_source_impl.dart';
import '../model/user.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final DataSource _userDataSource;
  const UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/users.json';
      List<dynamic> jsonList = await _userDataSource.getList(filePath);

      return jsonList.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/users.json';
      List<dynamic> jsonList = await _userDataSource.getList(filePath);

      return jsonList
          .map((json) => User.fromJson(json))
          .sorted((a, b) => a.username.compareTo(b.username))
          .sublist(0, 10);
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }
}

void main() async {
  final mockUserDataSource = MockUserDataSourceImple();
  final userRepository = UserRepositoryImpl(mockUserDataSource);

  List<User> users = await userRepository.getUsers();

  List<User> uersTop10ByUserName =
      await userRepository.getUsersTop10ByUserName();

  for (int i = 0; i < users.length; i++) {
    print(uersTop10ByUserName[i].username);
  }
  // print(uersTop10ByUserName);
}
