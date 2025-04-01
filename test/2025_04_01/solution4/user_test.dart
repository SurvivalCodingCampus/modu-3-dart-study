import 'package:test/test.dart';

import '../../../assignments/2025_04_01/solution4/data_source/user_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution4/mock/mock_user_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution4/repository/user_repository.dart';
import '../../../assignments/2025_04_01/solution4/repository/user_repository_impl.dart';

void main() {
  group('Data Source', () {
    final userDataSourceImpl = UserDataSourceImpl();
    test('제대로 잘 가져오는지 확인', () async {
      final result = await userDataSourceImpl.getUsers();

      print(result);

      expect(result.length, 10);
    });
  });

  group('Repository', () {
    final UserRepository userRepository = UserRepositoryImpl(
      UserDataSourceImpl(),
    );
    test('getUsers 확인', () async {
      final result = await userRepository.getUsers();

      print(result);
    });

    test('getUsersTop10ByUserName 확인', () async {
      final result = await userRepository.getUsersTop10ByUserName();

      final List resultName = result.map((e) => e.username).toList();

      print(resultName);
      // print(result);
    });
  });

  group('Mock Data', () {
    final UserRepository userRepository = UserRepositoryImpl(
      MockUserDataSourceImpl(),
    );
    test('Mock length test', () async {
      final result = await userRepository.getUsers();

      print(result);

      expect(result.length, 2);
    });
  });
}
