import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_user_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/user_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/user_repository_impl.dart';
import 'package:test/test.dart';


void main() {
  group('[ UserRepository ] - ', () {
    MockUserDataSource mockDataSource = MockUserDataSource();
    UserRepository repository = UserRepositoryImpl(mockDataSource);

    test('getUsers() - 사용자 정보를 가져온다.', () async {
      final users = await repository.getUsers();

      expect(users.length, 2);
      expect(users.first.name, "Leanne Graham");
    });

    test('getUsersTop10ByUserName() 이름정렫 상위 10개 데이터 로딩 10개 안되면 있는것 다 출력해야한다.', () async {
      final users = await repository.getUsersTop10ByUserName();

      expect(users.length, 2);
      expect(users.first.username, "Bret");
    });
  });
}