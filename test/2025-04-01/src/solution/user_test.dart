import 'package:collection/collection.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/src/solution/data_source/user_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/src/solution/model/user.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/src/solution/repository/user_repository.dart';
import 'package:modu_3_dart_study/assignments/2025-04-01/src/solution/repository/user_repository_impl.dart';
import 'package:test/test.dart';

import 'mock/mock_all_users_data_source_impl.dart';

void main() {
  group('User', () {
    test('문제 3번 - getUsers', () async {
      final UserRepository repository = UserRepositoryImpl(
        userDataSource: UserDataSourceImpl(),
      );

      final expected = await MockAllUsersDataSourceImpl().getUsers();

      final result = await repository.getUsers();

      for (int i = 0; i < expected.length; i++) {
        expect(result[i], isA<User>());
      }

      expect(result.length, expected.length);
    });

    test('문제 3번 - getUsersTop10ByUserName', () async {
      final UserRepository repository = UserRepositoryImpl(
        userDataSource: UserDataSourceImpl(), // true 2개, false 2개
      );

      final expected =
          (await MockAllUsersDataSourceImpl().getUsers())
              .map((e) => e['name'])
              .toList()
              .sorted((a, b) => a.compareTo(b))
              .toList();

      final result =
          (await repository.getUsersTop10ByUserName())
              .map((e) => e.name)
              .toList();

      expect(result.length, expected.length);
      for (int i = 0; i < expected.length; i++) {
        expect(result[i], expected[i]);
      }
    });
  });
}
