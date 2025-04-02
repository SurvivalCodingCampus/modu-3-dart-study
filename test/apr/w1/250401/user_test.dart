import 'package:collection/collection.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../playground/apr/w1/2025-04-01/user/data_source/Mock_user_data_source_impl.dart';
import '../../../../playground/apr/w1/2025-04-01/user/repository/user_repository_impl.dart';

void main() {
  test('user', () async {
    final userRepository = await UserRepositoryImpl(MockUserDataSourceImpl());
    final userData = await userRepository.getUsers();
    final userTop10Data = await userRepository.getUsersTop10ByUserName();

    final sortedUserName =
        userData.sorted((a, b) => a.username.compareTo(b.username)).toList();

    expect(userData.length, equals(10));
    expect(userTop10Data, equals(sortedUserName));
  });
}
