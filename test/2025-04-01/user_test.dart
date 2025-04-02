import 'package:test/test.dart';
import '../../assignments/2025-04-01/data_source/mock_user_data_source_impl.dart';
import '../../assignments/2025-04-01/model/user.dart';
import '../../assignments/2025-04-01/repository/user_repository_impl.dart';

void main() {
  final mockUserDataSource = MockUserDataSourceImpl();
  group('예제4) users', () {
    test('users 목록 가져오기', () async {
      final userRepository = UserRepositoryImpl(mockUserDataSource);
      List<User> users = await userRepository.getUsers();

      expect(users.length, 10);

      expect(users[0].id, 1);
      expect(users[0].name, 'Leanne Graham');
      expect(users[0].username, 'Bret');
      expect(users[0].email, 'Sincere@april.biz');
      expect(users[0].address.street, 'Kulas Light');
      expect(users[0].address.geo.lat, -37.3159);
      expect(users[0].phone, '1-770-736-8031 x56442');
      expect(users[0].website, 'hildegard.org');
      expect(users[0].company.name, 'Romaguera-Crona');

      expect(users[9].id, 10);
      expect(users[9].name, 'Clementina DuBuque');
      expect(users[9].username, 'Moriah.Stanton');
      expect(users[9].email, 'Rey.Padberg@karina.biz');
      expect(users[9].address.street, 'Kattie Turnpike');
      expect(users[9].address.geo.lat, -38.2386);
      expect(users[9].phone, '024-648-3804');
      expect(users[9].website, 'ambrose.net');
      expect(users[9].company.name, 'Hoeger LLC');
    });

    test('users 이름 순으로 데이터 가져오기', () async {
      final userRepository = UserRepositoryImpl(mockUserDataSource);
      List<User> users = await userRepository.getUsersTop10ByUserName();

      expect(users.length, 10);

      expect(users[0].username, 'Antonette');
      expect(users[1].username, 'Bret');
      expect(users[2].username, 'Delphine');
      expect(users[3].username, 'Elwyn.Skiles');
      expect(users[4].username, 'Kamren');
      expect(users[5].username, 'Karianne');
      expect(users[6].username, 'Leopoldo_Corkery');
      expect(users[7].username, 'Maxime_Nienow');
      expect(users[8].username, 'Moriah.Stanton');
      expect(users[9].username, 'Samantha');
    });
  });
}
