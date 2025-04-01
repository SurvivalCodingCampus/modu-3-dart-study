
import 'dart:math';

import 'package:modu_3_dart_study/2025-04-01/solution4/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution4/repository/user_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution4/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_user_data_source_impl.dart';

void main() {
  test('모든 User 가져오기', () async {
    final UserRepository userRepository = UserRepositoryImpl(UserDataSourceImpl());
    final userList = await userRepository.getUsers();

    expect(userList.length, 10);
  });
  test('이름순으로 User 10개 가져오기', () async {
    final UserRepository userRepository = UserRepositoryImpl(UserDataSourceImpl());
    final userList = await userRepository.getUsersTop10ByUserName();
    print(userList.last.username);

    expect(userList.first.username, 'Antonette');
    expect(userList.last.username, 'Samantha');
  });
  test('모든 User 가져오기', () async {
    final UserRepository userRepository = UserRepositoryImpl(MockUserDataSourceImpl());
    final userList = await userRepository.getUsers();

    expect(userList.length, 2);
  });
  test('이름순으로 User 10개 가져오기', () async {
    final UserRepository userRepository = UserRepositoryImpl(MockUserDataSourceImpl());
    final userList = await userRepository.getUsersTop10ByUserName();
    print(userList.last.username);

    expect(userList.first.username, 'Antonette');
    expect(userList.last.username, 'Bret');
  });
}
