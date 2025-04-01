import 'package:test/test.dart';

import '../../../../../assignments/structure/2025-04-01/user/data_source/local/user_local_data_source_impl.dart';
import '../../../../../assignments/structure/2025-04-01/user/repository/mock/mock_user_repository_impl.dart';
import '../../../../../assignments/structure/2025-04-01/user/repository/user_repository.dart';
import '../../../../../assignments/structure/2025-04-01/user/repository/user_repository_impl.dart';

void main() {
  group('user repo test', (){
    test('user mock repo test', () async {
      final UserRepository repo = MockUserRepositoryImpl();
      final top10Users = await repo.getUsersTop10ByUserName();

      expect(top10Users.length, equals(10));
      expect(top10Users[0].name.split('')[0], equals('1'));
    });

    test('user repo test', () async {
      final UserRepository repo = UserRepositoryImpl(UserLocalDataSourceImpl());
      final top10Users = await repo.getUsersTop10ByUserName();

      expect(top10Users.length, equals(10));
    });
  });
}