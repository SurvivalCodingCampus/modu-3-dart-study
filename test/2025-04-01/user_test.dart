import 'package:test/test.dart';

import '../../assignments/2025-04-01/data_source/user_data_source.dart';
import '../../assignments/2025-04-01/data_source/user_data_source_impl.dart';
import '../../assignments/2025-04-01/model/user.dart';
import '../../assignments/2025-04-01/repository/user_repository.dart';
import '../../assignments/2025-04-01/repository/user_repository_impl.dart';

void main() {
  group('User 테스트', () {
    test('Mock 데이터 테스트', () async {
      String path = 'assignments/2025-04-01/data_source/mock_users.json';
      UserDataSource userDataSource = UserDataSourceImpl(path: path);
      UserRepository userRepository = UserRepositoryImpl(
        dataSource: userDataSource,
      );
      List<User> allUsers = await userRepository.getUsers();
      expect(allUsers.length, 1);
      List<User> top10Users = await userRepository.getUsersTop10ByUserName();
      expect(top10Users[0].name, 'test name');
      expect(top10Users[0].address.geo.lat, -1.0);
      expect(top10Users[0].address.geo.lng, 1);
      expect(top10Users[0].company.bs, 'test bs');
      expect(top10Users[0].phone, 'test phone');
    });

    test('본데이터 test', () async {
      String path = 'assignments/2025-04-01/data_source/users.json';
      UserDataSource userDataSource = UserDataSourceImpl(path: path);
      UserRepository userRepository = UserRepositoryImpl(
        dataSource: userDataSource,
      );
      List<User> allUsers = await userRepository.getUsers();
      expect(allUsers.length, 10);
      List<User> top10Users = await userRepository.getUsersTop10ByUserName();
      expect(top10Users[0].name, 'Chelsey Dietrich');
      expect(top10Users[9].name, 'Patricia Lebsack');
    });
  });
}
